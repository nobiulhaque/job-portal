

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditworkerProfileController extends GetxController {
  final fullNameController = TextEditingController(text: 'Khela hobe');
  final phoneController = TextEditingController(text: '123-456-7890');
  final addressController = TextEditingController(text: '45 New Avenue, New York');
  final bioController = TextEditingController();
  final skillController = TextEditingController();

  var selectedCountry = 'United States'.obs;
  var selectedGender = 'Female'.obs;
  var skills = <String>[].obs;

  void addSkill(String skill) {
    if (skill.trim().isNotEmpty && !skills.contains(skill.trim())) {
      skills.add(skill.trim());
      skillController.clear();
    }
  }

  void removeSkill(String skill) {
    skills.remove(skill);
  }

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
    skillController.dispose();
    super.onClose();
  }
}
