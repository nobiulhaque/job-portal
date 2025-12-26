import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/services/api_services/api_service.dart';
import '../../../../core/services/storage_services/storage_service.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final ApiService apiService = ApiService();
    final StorageService storageService = StorageService();

    // splash delay
    await Future.delayed(const Duration(seconds: 2));
    final bool hasSeenOnboarding = storageService.isOnboardingSeen;
    debugPrint('Onboarding seen: $hasSeenOnboarding');

    // first time installed -> onboarding
    if (!hasSeenOnboarding) {
      Get.offAllNamed(Routes.ONBOARDING);
      return;
    } else {
      Get.offAllNamed(Routes.AUTH_VIEW);
    }

    // Onboarding already seen -> Check token

    // await apiService.logout();

    final String? token = await apiService.getValidToken();

    if (token != null) {
      // decode token
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      debugPrint('\n========== Decoded token: $decodedToken');

      final userRole = decodedToken['role'];

      if (userRole == 'WORKER') {
        Get.offAllNamed(Routes.WORKER_HOME);
      } else if (userRole == 'EMPLOYER') {
        Get.offAllNamed(Routes.HOME);
      } else {
        debugPrint('Unknown role: $userRole');
        Get.offAllNamed(Routes.AUTH_VIEW);

      }
    } else {
      // token is invalid -> Sign in Screen
      Get.offAllNamed(Routes.AUTH_VIEW);
    }
  }
}
