import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../editprofile/views/editprofile_view.dart';
import '../../help/views/help_view.dart';
import '../../payment/views/payment_view.dart';
import '../../privacy/views/privacy_view.dart';
import '../controllers/employeeprofile_controller.dart';



class EmployeeprofileView extends GetView<EmployeeprofileController> {
   EmployeeprofileView({super.key});
@override
  final controller = Get.put(EmployeeprofileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Profile Image
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: const Icon(
                        Icons.upload,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Puerto Rico',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF071727),
                  fontSize: 22,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                  height: 1.27,
                ),
              ),
              const SizedBox(height: 24),
              // Edit Profile Information Card
              _buildCard(
                child: _buildMenuItem(
                  icon: Icons.edit_document,
                  title: 'Edit profile information',
                  onTap: () {
                         Navigator.push(context,MaterialPageRoute(builder: (context)=> EditprofileView()));
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Settings Card
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFF071727),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Obx(() => _buildSwitchItem(
                      title: 'General Notification',
                      value: controller.generalNotification.value,
                      onChanged: (val) =>
                      controller.generalNotification.value = val,
                    )),
                    const SizedBox(height: 24),
                    Obx(() => _buildSwitchItem(
                      title: 'Sound',
                      value: controller.sound.value,
                      onChanged: (val) => controller.sound.value = val,
                    )),
                    const SizedBox(height: 24),
                    Obx(() => _buildSwitchItem(
                      title: 'Vibrate',
                      value: controller.vibrate.value,
                      onChanged: (val) => controller.vibrate.value = val,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Other Options Card
              _buildCard(
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.payment,
                      title: 'Payments',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentView()));
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildMenuItem(
                      icon: Icons.lock_outline,
                      title: 'Security & Privacy policy',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivacyView()));
                      },
                    ),
                    const SizedBox(height: 24),
                    Obx(() => Row(
                      children: [
                        const Icon(Icons.refresh, size: 24),
                        const SizedBox(width: 13),
                        const Expanded(
                          child: Text(
                            'App updates',
                            style: TextStyle(
                              color: Color(0xFF071727),
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.43,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                        _buildCustomSwitch(
                          value: controller.appUpdates.value,
                          onChanged: (val) =>
                          controller.appUpdates.value = val,
                        ),
                      ],
                    )),
                    const SizedBox(height: 24),
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HelpView()));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Logout Card
              _buildCard(
                child: _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  titleColor: const Color(0xFFFB0D22),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 0,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: titleColor ?? Colors.black,
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: titleColor ?? const Color(0xFF071727),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 1.43,
                letterSpacing: 0.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchItem({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF071727),
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.25,
          ),
        ),
        _buildCustomSwitch(value: value, onChanged: onChanged),
      ],
    );
  }

  Widget _buildCustomSwitch({
    required bool value,
    required Function(bool) onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 40,
        height: 20,
        decoration: BoxDecoration(
          color: value ? const Color(0xFFE63946) : const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFF7F7F7),
                width: 0.51,
              ),
            ),
          ),
        ),
      ),
    );
  }
}