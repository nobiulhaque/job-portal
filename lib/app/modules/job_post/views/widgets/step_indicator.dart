import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String>? stepLabels;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.stepLabels,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          _buildProgressBar(),
          _buildStepButtons(), 
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    final progress = currentStep / totalSteps;

    return SizedBox(
      width: double.infinity,
      height: 12.h,
      child: Center(
        child: Stack(
          children: [
            // Background track
            Container(
              width: 250.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            // Progress fill
            Container(
              width: 250.w * progress,
              height: 12.h,
              decoration: BoxDecoration(
                color: const Color(0xFF5A5A5A),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16.w,
      children: List.generate(
        totalSteps,
        (index) => _buildStepButton(index + 1),
      ),
    );
  }

  Widget _buildStepButton(int step) {
    final isCompleted = step < currentStep;
    final isCurrent = step == currentStep;

    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: isCompleted
            ? const Color(0xFFFF9633)
            : isCurrent
            ? const Color(0xFF3889CA)
            : const Color(0xFFBDBDBD),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: isCompleted
            ? Icon(Icons.check, color: Colors.white, size: 20.sp)
            : Text(
                '$step',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isCurrent ? Colors.white : const Color(0xFF989898),
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
