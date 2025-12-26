import 'dart:io';

import 'package:ellidobra_job_portal_app/app/data/job/post_job/post_job_request.dart';
import 'package:ellidobra_job_portal_app/app/data/job/post_job/post_job_response.dart';
import 'package:ellidobra_job_portal_app/core/services/api_services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/api_services/api_exception.dart';
import '../../../../core/services/api_services/api_response.dart';
import '../../../../core/urls/urls.dart';

class JobPostController extends GetxController {
  // Current step in the job posting process
  final currentStep = 1.obs;

  // Dropdown options
  final List<String> jobCategories = [
    'construction',
    'cleaning',
    'restaurant',
    'transport',
    'events',
    'warehouse',
    'home services',
    'etc',
  ];

  final List<String> jobTypes = ['Full-Time', 'Part-time', 'Contractual'];

  // Form values
  final selectedCategory = Rx<String?>(null);
  final selectedJobType = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    currentStep.value = 1;
  }

  // add new category
  void addJobCategory(String value) {
    if (!jobCategories.contains(value)) {
      jobCategories.add(value);
    }
  }

  // Navigate to the next step
  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
    }
  }

  // Navigate to the previous step
  void previousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
    }
  }

  /// date controller
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  /// image picker controller
  final ImagePicker _picker = ImagePicker();

  // Observable list of images
  RxList<File> selectedImages = <File>[].obs;

  // Pick multiple images
  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      selectedImages.addAll(
        images.map((e) => File(e.path)).toList(),
      );
    }
  }

  // Remove image
  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  // Clear all images
  void clearImages() {
    selectedImages.clear();
  }

  /// post job controller
  final ApiService apiService = ApiService();

  //input controllers
  final TextEditingController jobLocationController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobDescriptionController = TextEditingController();
  final List<String> imageUrls = [];


  final RxBool isPostJobLoading = false.obs;
  final errorMessage = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  Future<ApiResponse<PostJobResponse>?> getJob() async {
    errorMessage.value = '';

    if(!formKey.currentState!.validate()){
      errorMessage.value = 'Please, enter job details';
      return ApiResponse<PostJobResponse>(
          success: false,
          message: errorMessage.value,
          data: null
      );
    }

    isPostJobLoading.value = true;

    try {
      /// create request body
      final request = PostJobRequest(
        title: jobTitleController.text,
        description: jobDescriptionController.text,
        jobType: selectedJobType.value ?? '',
        category: selectedCategory.value ?? '',
        location: JobLocation(type: 'Point', coordinates: [19.816026, 42.002636]),
        startsAt: startDateController.text,
        endsAt: endDateController.text,
        fileUrls: imageUrls,
        minBudget: 100.0,
        maxBudget: 100.0,
        address: '',
        payCurrency: 'USD',
        payType: 'FiXED',
        urgent: false
      );

      final response = await apiService.post(
        path:  Urls.addJob,
       data: request.toJson()
      );

      if (response == null) {
        throw ApiException('No response received');
      }


      // Proper generic parsing that handles ApiService behavior
      final apiResponse = ApiResponse<PostJobResponse>.fromJson(
        response,
            (json)=> PostJobResponse.fromJson(json as Map<String,dynamic>)
      );


      if (apiResponse.success) {
        debugPrint('Job added successfully');
        selectedCategory.value = '';
        selectedJobType.value = '';
        jobLocationController.clear();
        jobTitleController.clear();
        jobDescriptionController.clear();
        startDateController.clear();
        endDateController.clear();

      } else {
        errorMessage.value = apiResponse.message ?? 'Failed to add job';
        debugPrint('❌ API Error: ${errorMessage.value}');
      }

      return apiResponse;

    } on ApiException catch (e) {
      errorMessage.value = e.message;
      debugPrint('❌ ApiException: ${e.message}');
      return ApiResponse<PostJobResponse>(
        success: false,
        message: e.message,
        data: null,
        statusCode: e.statusCode,
      );
    } catch (e) {
      errorMessage.value = 'Unexpected error: $e';
      debugPrint('❌ Unexpected error: $e');
      return ApiResponse<PostJobResponse>(
        success: false,
        message: 'Unexpected error occurred',
        data: null,
      );
    } finally {
      isPostJobLoading.value = false;
    }
  }

}
