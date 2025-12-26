
import 'package:ellidobra_job_portal_app/app/data/auth/login/login_request.dart';
import 'package:ellidobra_job_portal_app/app/data/auth/login/login_response.dart';
import 'package:ellidobra_job_portal_app/app/routes/app_pages.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_exception.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_response.dart';
import 'package:ellidobra_job_portal_app/core/urls/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../../../core/services/api_services/api_service.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final ApiService _apiService = ApiService();


  /// login input fields controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final errorMessage = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future<ApiResponse<LoginResponse>?> login()async{
    errorMessage.value = '';

    if(!formKey.currentState!.validate()){
      errorMessage.value = 'Please, enter your valid email and password';
      return ApiResponse<LoginResponse>(
        success: false,
        message: errorMessage.value,
        data: null
      );
    }

    isLoading.value = true;

    try{
      /// create request body
      final request = LoginRequest(email: emailController.text.trim(), password: passwordController.text);

      /// call api post method
      final response = await _apiService.post(path: Urls.login, data: request.toJson());

      if(response == null){
        throw ApiException('No response received');
      }

      final apiResponse = ApiResponse<LoginResponse>.fromJson(response,
          (json)=> LoginResponse.fromJson(json as Map<String, dynamic>)
      );

      if(apiResponse.success && apiResponse.data?.token !=null ){
        final token = apiResponse.data!.token;
        await _apiService.saveToken(token);
        debugPrint('User token is saved');

        // decode token
        Map<String,dynamic> decodedToken = JwtDecoder.decode(token);
        debugPrint('\n========== Decoded token: $decodedToken');


        final userRole = decodedToken['role'];

        if (userRole == 'WORKER') {
          Get.offAllNamed(Routes.WORKER_HOME);
        } else if (userRole == 'EMPLOYER') {
          Get.offAllNamed(Routes.HOME);
        } else {
          debugPrint('Unknown role: $userRole');
          Get.offAllNamed(Routes.LOGIN);
        }

        isLoading.value = false;
        emailController.clear();
        passwordController.clear();
      }else{
        errorMessage.value = apiResponse.message ?? 'Login Failed!';
        Get.snackbar('Login Failed!', 'Enter valid email and password');
      }

      return apiResponse;

    } on ApiException catch (e){
      errorMessage.value = e.message;
      return ApiResponse<LoginResponse>(
        success: false,
        message: errorMessage.value,
        data: null,
        statusCode: e.statusCode
      );
    }catch(e){
      errorMessage.value = 'Unexpected error: $e';
      return ApiResponse<LoginResponse>(
        success: false,
        message: 'Unexpected error occurred',
        data: null,
      );
    }finally{
      isLoading.value = false;
      // emailController.clear();
      // passwordController.clear();
    }
  }

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

}
