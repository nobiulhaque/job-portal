import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/editprofile_controller.dart';


class EditprofileView extends GetView<EditprofileController> {
   EditprofileView({super.key});
@override
  final controller = Get.put(EditprofileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF071727)),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Edit profile Info',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF071727),
            fontSize: 22,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w600,
            height: 1.27,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Full Name Field
              const Text(
                'Full Name',
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                hintText: 'Puerto Rico',
                controller: controller.fullNameController,
              ),
              const SizedBox(height: 16),
              // Phone Number Field
              const Text(
                'Phone Number',
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                hintText: '123-456-7890',
                controller: controller.phoneController,
              ),
              const SizedBox(height: 16),
              // Country and Gender Row
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Country',
                      value: controller.selectedCountry.value,
                      items: ['United States', 'Canada', 'United Kingdom'],
                      onChanged: (val) => controller.selectedCountry.value = val!,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Genre',
                      value: controller.selectedGender.value,
                      items: ['Male', 'Female', 'Other'],
                      onChanged: (val) => controller.selectedGender.value = val!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Address Field
              _buildTextField(
                hintText: '45 New Avenue, New York',
                controller: controller.addressController,
                label: 'Address',
              ),
              const SizedBox(height: 24),
              // Bio Field
              const Text(
                'Bio',
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFD1D5DB),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: controller.bioController,
                  maxLines: 6,
                  style: const TextStyle(
                    color: Color(0xFF071727),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Write Your Bio',
                    hintStyle: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE63946),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'SAVE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    String? label,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFD1D5DB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Color(0xFF4B5563),
          fontSize: 15,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 15,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
          labelStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFD1D5DB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7280), size: 20),
          style: const TextStyle(
            color: Color(0xFF071727),
            fontSize: 15,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
            floatingLabelStyle: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}