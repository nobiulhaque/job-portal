import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_service.dart';
import 'package:ellidobra_job_portal_app/app/data/job/job_response.dart'; // Contains Job, Location, Poster, etc.
import 'package:ellidobra_job_portal_app/core/urls/urls.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_exception.dart';

import '../../../../core/services/api_services/api_response.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  late PageController pageController;

  /// Get all jobs
  final _apiService = ApiService();
  final isGetJobsLoading = false.obs;
  final errorMessage = ''.obs;

  final jobs = <Job>[].obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    getJob();
  }

  Future<ApiResponse<JobResponse>?> getJob() async {
    errorMessage.value = '';
    isGetJobsLoading.value = true;

    try {
      final token = await _apiService.getValidToken();
      if (token == null) {
        errorMessage.value = 'User not authenticated';
        isGetJobsLoading.value = false;
        return ApiResponse<JobResponse>(
          success: false,
          message: 'User not authenticated',
          data: null,
        );
      }

      debugPrint('=== Token sent: $token');

      final response = await _apiService.get(
        Urls.jobs,
        token: token,
        rawToken: true,
      );

      if (response == null) {
        throw ApiException('No response received');
      }

      debugPrint('Raw API response: ${jsonEncode(response)}');

      // Proper generic parsing that handles ApiService behavior
      final apiResponse = ApiResponse<JobResponse>.fromJson(
        response,
            (json) {
          // Most ApiService implementations pass only json['data'] here (a List)
          // So we reconstruct the full structure expected by JobResponse.fromJson
          return JobResponse.fromJson({
            'success': response['success'],
            'message': response['message'] ?? '',
            'data': json, // json here is the List of job maps
          });
        },
      );

      debugPrint('Parsed success: ${apiResponse.success}');
      debugPrint('Parsed message: ${apiResponse.message}');
      debugPrint('Jobs count: ${apiResponse.data?.jobs.length ?? 0}');

      if (apiResponse.success) {
        final jobList = apiResponse.data?.jobs ?? [];
        jobs.assignAll(jobList);

        if (jobList.isEmpty) {
          debugPrint('⚠️ No jobs available');
        } else {
          debugPrint('✅ Jobs loaded successfully: ${jobs.length} job(s)');
        }
      } else {
        errorMessage.value = apiResponse.message ?? 'Failed to fetch jobs';
        debugPrint('❌ API Error: ${errorMessage.value}');
      }

      return apiResponse;

    } on ApiException catch (e) {
      errorMessage.value = e.message;
      debugPrint('❌ ApiException: ${e.message}');
      return ApiResponse<JobResponse>(
        success: false,
        message: e.message,
        data: null,
        statusCode: e.statusCode,
      );
    } catch (e) {
      errorMessage.value = 'Unexpected error: $e';
      debugPrint('❌ Unexpected error: $e');
      return ApiResponse<JobResponse>(
        success: false,
        message: 'Unexpected error occurred',
        data: null,
      );
    } finally {
      isGetJobsLoading.value = false;
    }
  }

  // Future<void> getJob() async {
  //   errorMessage.value = '';
  //   isGetJobsLoading.value = true;
  //
  //   try {
  //     // Check if user has a valid token
  //     final token = await _apiService.getValidToken();
  //     if (token == null) {
  //       errorMessage.value = 'User not authenticated';
  //       isGetJobsLoading.value = false;
  //       return;
  //     }
  //
  //     debugPrint('=== Token sent: $token');
  //
  //     /// Call API GET method
  //     final response = await _apiService.get(
  //       Urls.jobs,
  //       token: token,
  //       rawToken: true,
  //     );
  //
  //     if (response == null) {
  //       throw ApiException('No response received');
  //     }
  //
  //     // Log raw response (useful during development)
  //     debugPrint('Raw API response: ${jsonEncode(response)}');
  //
  //     // Manual parsing to avoid generic callback type issues
  //     final bool success = response['success'] as bool? ?? false;
  //     final String message = response['message'] as String? ?? 'Unknown error';
  //
  //     if (!success) {
  //       errorMessage.value = message;
  //       debugPrint('❌ API Error: $message');
  //       return;
  //     }
  //
  //     // Extract the 'data' field which is the List of jobs
  //     final List<dynamic>? rawJobList = response['data'] as List<dynamic>?;
  //
  //     if (rawJobList == null || rawJobList.isEmpty) {
  //       jobs.clear();
  //       debugPrint('⚠️ No jobs available at the moment');
  //       // Optional: errorMessage.value = 'No jobs found';
  //       return;
  //     }
  //
  //     // Parse each job using the generated fromJson
  //     final List<Job> parsedJobs = rawJobList
  //         .map((item) => Job.fromJson(item as Map<String, dynamic>))
  //         .toList();
  //
  //     // Update the observable list
  //     jobs.assignAll(parsedJobs);
  //
  //     debugPrint('✅ Jobs loaded successfully: ${jobs.length} job(s)');
  //
  //   } on ApiException catch (e) {
  //     errorMessage.value = e.message;
  //     debugPrint('❌ ApiException: ${e.message}');
  //   } catch (e) {
  //     errorMessage.value = 'Unexpected error occurred';
  //     debugPrint('❌ Unexpected error: $e');
  //   } finally {
  //     isGetJobsLoading.value = false;
  //   }
  // }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}