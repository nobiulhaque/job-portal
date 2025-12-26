import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditprofileController extends GetxController {
  final fullNameController = TextEditingController(text: 'Puerto Rico');
  final phoneController = TextEditingController(text: '123-456-7890');
  final addressController = TextEditingController(text: '45 New Avenue, New York');
  final bioController = TextEditingController();

  var selectedCountry = 'United States'.obs;
  var selectedGender = 'Female'.obs;

  void saveProfile() {
    // Handle save action
    Get.snackbar('Success', 'Profile updated successfully');
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
