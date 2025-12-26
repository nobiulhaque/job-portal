import 'package:ellidobra_job_portal_app/app/modules/chat/messageScree/views/message_scree_view.dart';
import 'package:ellidobra_job_portal_app/app/shared_widgets/hired_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HiredTab extends StatelessWidget {
  const HiredTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HiredCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Great work! Very professional and reliable. Completed the job on time and did an excellent job more...',
              onRate: () {
                // Navigate to the review with profile view
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageScreeView(),
                  ),
                );
              },
            ),
            HiredCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Great work! Very professional and reliable. Completed the job on time and did an excellent job more...',
              onViewProfile: () {},
              onRate: () {},
            ),
            HiredCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Great work! Very professional and reliable. Completed the job on time and did an excellent job more...',
              onViewProfile: () {},
              onRate: () {},
            ),
            HiredCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Great work! Very professional and reliable. Completed the job on time and did an excellent job more...',
              onViewProfile: () {},
              onRate: () {},
            ),
          ],
        ),
      ),
    );
  }
}
