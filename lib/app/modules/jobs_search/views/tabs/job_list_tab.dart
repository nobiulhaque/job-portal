import 'package:ellidobra_job_portal_app/app/modules/job_post/controllers/job_post_controller.dart';
import 'package:ellidobra_job_portal_app/app/shared_widgets/edit_joblisting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../shared_widgets/job_list_card.dart';

class JobListTab extends StatelessWidget {
  const JobListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          JobListCard(
            title: 'I need a cleaner',
            category: 'Cleaning',
            location: 'New York, NY',
            jobType: 'Contractual',
            budget: '\$100 - \$500',
            description:
                'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
            onDelete: () {},
            onEdit: () {
              Get.to(
                () => EditJoblisting(),
                binding: BindingsBuilder(() {
                  Get.put<JobPostController>(JobPostController());
                }),
              );
            },
          ),

          JobListCard(
            title: 'I need a cleaner',
            category: 'Cleaning',
            location: 'New York, NY',
            jobType: 'Contractual',
            budget: '\$100 - \$500',
            description:
                'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
            onDelete: () {},
            onEdit: () {},
          ),

          JobListCard(
            title: 'I need a cleaner',
            category: 'Cleaning',
            location: 'New York, NY',
            jobType: 'Contractual',
            budget: '\$100 - \$500',
            description:
                'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
            onDelete: () {},
            onEdit: () {},
          ),

          JobListCard(
            title: 'I need a cleaner',
            category: 'Cleaning',
            location: 'New York, NY',
            jobType: 'Contractual',
            budget: '\$100 - \$500',
            description:
                'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
            onDelete: () {},
            onEdit: () {},
          ),
        ],
      ),
    );
  }
}
