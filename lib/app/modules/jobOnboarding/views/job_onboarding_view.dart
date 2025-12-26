import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/job_onboarding_controller.dart';

class JobOnboardingView extends GetView<JobOnboardingController> {
  const JobOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFD1D5DB),
                      width: 1.5,
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close, color: Color(0xFF9CA3AF), size: 18),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Icon
              Obx(() => Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: controller.currentPage.value == 0
                      ? const Color(0xFFB3D4F7)
                      : controller.currentPage.value == 1
                          ? const Color(0xFFFFE5B4)
                          : const Color(0xFFB8E6C9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  controller.currentPage.value == 0
                      ? Icons.track_changes
                      : controller.currentPage.value == 1
                          ? Icons.auto_awesome
                          : Icons.edit,
                  size: 40,
                  color: controller.currentPage.value == 0
                      ? const Color(0xFF3889CA)
                      : controller.currentPage.value == 1
                          ? const Color(0xFFFDB022)
                          : const Color(0xFF34D399),
                ),
              )),

              const SizedBox(height: 32),

              // Title
              Obx(() => Text(
                controller.currentTitle,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DM Sans',
                  color: Color(0xFF111827),
                ),
                textAlign: TextAlign.center,
              )),

              const SizedBox(height: 16),

              // Subtitle
              Obx(() => Text(
                controller.currentSubtitle,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF9CA3AF),
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )),

              const SizedBox(height: 40),

              // Checklist items
              Obx(() => Column(
                children: List.generate(
                  controller.currentPageItems.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              controller.currentPageItems[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF374151),
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),

              const SizedBox(height: 40),

              // Bottom navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Progress indicators
                  Row(
                    children: List.generate(
                      controller.totalPages,
                      (index) => Obx(() => Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: controller.currentPage.value == index ? 40 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? const Color(0xFFE63946)
                              : const Color(0xFFE5E7EB),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )),
                    ),
                  ),

                  // Navigation buttons
                  Row(
                    children: [
                      TextButton(
                        onPressed: controller.skip,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Obx(() => ElevatedButton(
                        onPressed: controller.nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE63946),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.buttonText,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}