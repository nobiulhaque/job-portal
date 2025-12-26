import 'package:ellidobra_job_portal_app/app/modules/workerSide/review/views/review_with_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared_widgets/bids_card.dart';

class BidsTab extends StatelessWidget {
  const BidsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BidsCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
              onViewDetails: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewWithProfileProfileView(),
                  ),
                );
              },
              onHire: () {},
            ),
            BidsCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
              onViewDetails: () {},
              onHire: () {},
            ),
            BidsCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
              onViewDetails: () {},
              onHire: () {},
            ),
            BidsCard(
              profileImage: 'assets/images/profile.png',
              workerName: 'Jonak',
              title: 'Cleaning Expert',
              location: 'New York, NY',
              budget: '\$80 - \$350',
              description:
                  'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
              onViewDetails: () {},
              onHire: () {},
            ),
          ],
        ),
      ),
    );
  }
}
