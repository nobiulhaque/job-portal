import 'package:ellidobra_job_portal_app/app/modules/workerSide/review/views/review_with_profile.dart';
import 'package:ellidobra_job_portal_app/app/shared_widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkerTab extends StatelessWidget {
  const WorkerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Job Listings Section
          SizedBox(height: 16.h),
          JobCard(
            name: 'Jonak',
            title: 'Cleaning Expert',
            location: 'New York, NY',
            jobType: 'Full-Time',
            description:
                'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
            profileImage: 'assets/images/profile.png',
            onViewProfile: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewWithProfileProfileView(),
                ),
              );
            },
            onMessage: () {},
            onHire: () {},
          ),
    
          SizedBox(height: 16.h),
          JobCard(
            name: 'Jonak',
            title: 'Cleaning Expert',
            location: 'New York, NY',
            jobType: 'Full-Time',
            description:
                'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
            profileImage: 'assets/images/profile.png',
            onViewProfile: () {},
            onMessage: () {},
            onHire: () {},
          ),
    
          SizedBox(height: 16.h),
          JobCard(
            name: 'Jonak',
            title: 'Cleaning Expert',
            location: 'New York, NY',
            jobType: 'Full-Time',
            description:
                'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
            profileImage: 'assets/images/profile.png',
            onViewProfile: () {},
            onMessage: () {},
            onHire: () {},
          ),
        ],
      ),
    );
  }
}
