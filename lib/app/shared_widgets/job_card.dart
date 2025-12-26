import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';

class JobCard extends StatelessWidget {
  final String name;
  final String title;
  final String location;
  final String jobType;
  final String description;
  final String? profileImage;
  final VoidCallback? onViewProfile;
  final VoidCallback? onMessage;
  final VoidCallback? onHire;

  const JobCard({
    super.key,
    required this.name,
    required this.title,
    required this.location,
    required this.jobType,
    required this.description,
    this.profileImage,
    this.onViewProfile,
    this.onMessage,
    this.onHire,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.softBlue),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.h,
          children: [
            _buildProfileHeader(context: context),
            _buildJobDetails(),
            _buildJobDescription(context: context),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader({required BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          child: profileImage != null
              ? Image.asset(profileImage!, fit: BoxFit.cover)
              : Image.asset("assets/images/profile.png", fit: BoxFit.cover),
        ),
        SizedBox(width: 8.w),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.primaryDark,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 25.w),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.primaryDark,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildJobDetails() {
    return Row(
      children: [
        Expanded(
          child: _DetailBadge(
            icon: Icons.location_on_outlined,
            label: location,
          ),
        ),
        SizedBox(width: 8.w),
        _DetailBadge(icon: Icons.work_outline, label: jobType),
      ],
    );
  }

  Widget _buildJobDescription({required BuildContext context}) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.primaryDark,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            label: 'View Profile',
            onPressed: onViewProfile ?? () {},
            variant: 'outline',
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _ActionButton(
            label: 'Message',
            onPressed: onMessage ?? () {},
            variant: 'secondary',
            icon: Icons.mail_outline,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _ActionButton(
            label: 'Hire',
            onPressed: onHire ?? () {},
            variant: 'primary',
            icon: Icons.check_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _DetailBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color:  Color(0xFF050F20).withAlpha(13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.w, color: AppColors.primaryDark),
          SizedBox(width: 6.w),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primaryDark,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String variant;
  final IconData? icon;

  const _ActionButton({
    required this.label,
    required this.onPressed,
    required this.variant,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = variant == 'primary';
    final isOutline = variant == 'outline';

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 38.h,
          decoration: ShapeDecoration(
            color: isPrimary ? const Color(0xFFE63946) : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isOutline
                    ? AppColors.backgroundLight
                    : isPrimary
                    ? Colors.transparent
                    : AppColors.backgroundLight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16.w,
                  color: isPrimary ? Colors.white : AppColors.primary,
                ),
                SizedBox(width: 4.w),
              ],
              Text(
                label,
                style: TextStyle(
                  color: isPrimary
                      ? Colors.white
                      : isOutline
                      ? AppColors.textLight
                      : AppColors.primary,
                  fontSize: 12.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
