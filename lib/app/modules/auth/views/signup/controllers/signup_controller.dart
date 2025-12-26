
import 'package:ellidobra_job_portal_app/app/data/auth/signup/signup_request.dart';
import 'package:ellidobra_job_portal_app/app/data/auth/signup/signup_response.dart';
import 'package:ellidobra_job_portal_app/app/modules/AccountType/controllers/account_type_controller.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_exception.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_response.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/urls/urls.dart';
import '../../../../../routes/app_pages.dart';


class SignupController extends GetxController {
  //TODO: Implement SignupController

  final ApiService _apiService = ApiService();
  final accountTypeController = Get.find<AccountTypeController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debugPrint('initialize: ${accountTypeController.userRole.value}');
  }

  /// user role controller
  final RxString selectedUserRole = ''.obs;
  final RxList<String> roles = ['Employer', 'Worker'].obs;
  void setSelectedUserRole(String role){
    selectedUserRole.value = role;
    debugPrint('User role reset: ${accountTypeController.userRole.value}');
  }

  /// userEmail: store user email to use in verify
  final RxString userEmail = ''.obs;

  /// sign up input fields controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<ApiResponse<SignupResponse>?> signUp()async{
    errorMessage.value = '';
    if(!formKey.currentState!.validate()){
      errorMessage.value = 'Please, Enter required information';
      return ApiResponse(
        success: false,
        message:  errorMessage.value,
        data: null,
      );
    }

    isLoading.value = true;
    final userRole = selectedUserRole.value.toUpperCase();

    try{

      // create request body
      final request = SignupRequest(
          name: nameController.text,
          email: emailController.text.trim() ,
          phone: phoneController.text,
          password: passwordController.text,
          role: userRole.isEmpty ? accountTypeController.userRole.value.toUpperCase() : userRole
      );

      final response = await _apiService.post(path: Urls.signUp,data: request.toJson());

      if(response == null){
        throw ApiException('No response received');
      }

      final apiResponse = ApiResponse<SignupResponse>.fromJson(
        response,
          (json) => SignupResponse.fromJson(json as Map<String,dynamic>)
      );

      if(apiResponse.success){
        debugPrint('User Account created successfully');
        userEmail.value = apiResponse.data!.email;
        Get.snackbar('Success', apiResponse.message ?? 'User Registered successfully! Please verify your email');
        Get.offAllNamed(Routes.OTP_VERIFY);

        isLoading.value = false;
        emailController.clear();
        nameController.clear();
        phoneController.clear();
        passwordController.clear();
        selectedUserRole.value = '';

      }else{
        errorMessage.value = apiResponse.message ?? 'Sign Up Failed!';
        Get.snackbar('Error',apiResponse.message ?? 'Sign up failed');
        // return apiResponse;
      }

      return apiResponse;

    }on ApiException catch (e){
      errorMessage.value = e.message;
      Get.snackbar('Error',errorMessage.value);
        return ApiResponse(
          success: false,
          message:  errorMessage.value,
          data: null,
        );
    } catch(e){
      errorMessage.value = e.toString();
      Get.snackbar('Unexpected Error',errorMessage.value);
      return ApiResponse<SignupResponse>(
        success: false,
        message: 'Unexpected error occurred',
        data: null,
      );
    }finally{
      isLoading.value = false;
    }
  }


}
