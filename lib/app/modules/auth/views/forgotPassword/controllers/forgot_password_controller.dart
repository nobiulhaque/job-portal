import 'dart:convert';

import 'package:ellidobra_job_portal_app/app/data/auth/forgot_password/otp_verify/otp_verify_request.dart';
import 'package:ellidobra_job_portal_app/app/data/auth/forgot_password/otp_verify/otp_verify_response.dart';
import 'package:ellidobra_job_portal_app/app/modules/auth/views/signup/controllers/signup_controller.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_exception.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_response.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_service.dart';
import 'package:ellidobra_job_portal_app/core/urls/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final signUpController = Get.find<SignupController>();
  final ApiService _apiService = ApiService();

  final RxBool isVerifyOtpLoading = false.obs;
  final RxBool isSendOtpToEmailLoading = false.obs;

  final RxString errorMessage = ''.obs;
  
  final TextEditingController otpController = TextEditingController();


  final RxString emailTobeVerified = ''.obs;

  void setEmail(String email){
    emailTobeVerified.value = email;
  }

  late OtpVerifyRequest request;

  Future<ApiResponse<OtpVerifyResponse>?> verifyOtp()async{

    isVerifyOtpLoading.value = true;
    errorMessage.value  = '';
    
    try{
      
      // create request body
     if(emailTobeVerified.value.isNotEmpty){
        request = OtpVerifyRequest(email: emailTobeVerified.value, otp: int.parse(otpController.text));
     }else{
       request = OtpVerifyRequest(email: signUpController.userEmail.value, otp: int.parse(otpController.text));
     }
      
      // call api
      final response = await _apiService.post(path: Urls.otpVerify,data: request.toJson());
     
     if(response == null){
       throw Exception('No response received');
     }
     
     final apiResponse = ApiResponse<OtpVerifyResponse>.fromJson(
       response,
         (json) => OtpVerifyResponse.fromJson(json as Map<String,dynamic>)
     );

     if(apiResponse.success){
       debugPrint(apiResponse.message ?? 'OTP verified successfully');
       Get.snackbar('Success', "OTP verified, sign in again");
       emailTobeVerified.isNotEmpty ? Get.toNamed(Routes.CHNAGE_PASSWORD) : Get.toNamed(Routes.SPLASH);

       isVerifyOtpLoading.value = false;
       otpController.clear();
       emailTobeVerified.value = '';

     }else{
       errorMessage.value = apiResponse.message ?? 'Sign Up Failed!';
       Get.snackbar('Error',apiResponse.message ?? 'Sign up failed');
     }
     return apiResponse;
      
    }on ApiException catch(e){
      errorMessage.value = e.message;
      Get.snackbar('Error',errorMessage.value);
      signUpController.userEmail.value == '';
      return ApiResponse<OtpVerifyResponse>(
        success: false,
        message:  errorMessage.value,
      );
    }catch(e){
      errorMessage.value = e.toString();
      Get.snackbar('Unexpected Error',errorMessage.value);
      return ApiResponse<OtpVerifyResponse>(
        success: false,
        message: 'Unexpected error occurred',
      );
    }finally{
      isVerifyOtpLoading.value = false;
    }

  }

  Future<void> sendOtpToEmail()async{
    isSendOtpToEmailLoading.value = true;

    try{
      // create request body
      final Map<String,dynamic> request ={
        "email": emailTobeVerified.value
      };

      final response = await _apiService.post(path: Urls.forgotPassword,data: request);

      if(response == null){
        throw Exception('No response received');
      }

      if(response['success'] == true){
        Get.snackbar('Success', response['message'] ?? 'OTP sent, check your email');
        Get.toNamed(Routes.OTP_VERIFY);

        emailTobeVerified.value = '';
      }else{
        Get.snackbar('Failed!', response['message'] ?? 'Try again later');
      }
    }on Exception catch(e){
      debugPrint('Unexpected Error: $e}');
    }catch(e){
      debugPrint('Error: $e}');
    }finally{
      isSendOtpToEmailLoading.value = false;
    }


  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    otpController.dispose();

  }

}
