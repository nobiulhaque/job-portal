


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Notifications/views/showReviewDialog.dart';


class workernotification_controller extends GetxController {}

class WorkernotificationView extends GetView<workernotification_controller> {
  const WorkernotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // Column(
      //     children: [
      //       // Header Section with curved bottom
      //       Container(
      //         height: 120,
      //         width: double.infinity,
      //         decoration: const BoxDecoration(
      //           color: Color(0xFF002249),
      //         ),
      // child: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 24),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         const Text(
      //           'Activity',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //             fontFamily: 'Dn sans',
      //             fontWeight: FontWeight.w700,
      //           ),
      //         ),
      //         Stack(
      //           clipBehavior: Clip.none,
      //           children: [
      //             Container(
      //               width: 30,
      //               height: 30,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 shape: BoxShape.circle,
      //               ),
      //               child: Center(
      //                 child: Image.asset(
      //                   'assets/images/notification.png',
      //                   width: 24,
      //                   height: 24,
      //                   fit: BoxFit.contain,
      //                 ),
      //               ),
      //             ),
      //             Positioned(
      //               right: -8,
      //               top: -8,
      //               child: Container(
      //                 width: 22,
      //                 height: 22,
      //                 decoration: BoxDecoration(
      //                   color: const Color(0xFFF7A435),
      //                   shape: BoxShape.circle,
      //                 ),
      //                 child: const Center(
      //                   child: Text(
      //                     '12',
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 12,
      //                       fontFamily: 'Outfit',
      //                       fontWeight: FontWeight.w700,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // ),
      // Notifications List
      Expanded(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            _buildNotificationItem(
              imagePath: 'https://www.facebook.com/fb.tamim/',
              hasUnreadBadge: true,
              badgeCount: '2',
              title: 'Worker Accepted SALE IS LIVE',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit\ndolor sit amet, consectetur adipiscing elit.  ',
              timeAgo: '1m ago.',
            ),
            const SizedBox(height: 19),
            _buildNotificationItem(
              imagePath: 'assets/images/profile.png',
              hasUnreadBadge: true,
              badgeCount: '2',
              title: 'SALE IS LIVE',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit\ndolor sit amet, consectetur adipiscing elit.  ',
              timeAgo: '1m ago.',
            ),
            const SizedBox(height: 19),
            _buildNotificationItem(
              imagePath: 'https://placehold.co/42x42',
              hasUnreadBadge: false,
              title: 'SALE IS LIVE',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit\ndolor sit amet, consectetur adipiscing elit.  ',
              timeAgo: '1m ago.',
            ),
            const SizedBox(height: 19),
            _buildNotificationItem(
              imagePath: 'https://placehold.co/42x42',
              hasUnreadBadge: false,
              title: 'SALE IS LIVE',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit\ndolor sit amet, consectetur adipiscing elit.  ',
              timeAgo: '10 Hrs ago.',
            ),
            const SizedBox(height: 19),
            GestureDetector(
              onTap: () => _showJobDetailsDialog(context),
              child: _buildNotificationItem(
                imagePath: 'https://placehold.co/42x42',
                hasUnreadBadge: false,
                title: 'SALE IS LIVE',
                description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit\ndolor sit amet, consectetur adipiscing elit.  ',
                timeAgo: '15 Hrs ago.',
              ),
            ),
          ],
        ),
      );


  }

  void _showJobDetailsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.96),
            ),
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15.96),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color: const Color(0xFF071727),
                            ),
                            borderRadius: BorderRadius.circular(14.96),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'I need a cleaner',
                                    style: TextStyle(
                                      color: const Color(0xFF071727),
                                      fontSize: 23.94,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 7.98),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40.92,
                                          padding: const EdgeInsets.all(9.97),
                                          decoration: ShapeDecoration(
                                            color: const Color(0x0C050F20),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(11.97),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Cleaning',
                                                style: TextStyle(
                                                  color: const Color(0xFF071727),
                                                  fontSize: 15.96,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 7.98),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  height: 29.92,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0x0C050F20),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(11.97),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Icon(Icons.location_on, size: 14),
                                                      const SizedBox(width: 4),
                                                      Flexible(
                                                        child: Text(
                                                          'New York, NY',
                                                          style: TextStyle(
                                                            color: const Color(0xFF071727),
                                                            fontSize: 12,
                                                            fontFamily: 'Inter',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Flexible(
                                                child: Container(
                                                  height: 29.92,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0x0C050F20),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(11.97),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Full Time',
                                                      style: TextStyle(
                                                        color: const Color(0xFF071727),
                                                        fontSize: 12,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Flexible(
                                                child: Container(
                                                  height: 29.92,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0x0C050F20),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(11.97),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '\$100-\$500',
                                                      style: TextStyle(
                                                        color: const Color(0xFF071727),
                                                        fontSize: 12,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 7.98),
                                        Container(
                                          height: 29.92,
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                          decoration: ShapeDecoration(
                                            color: const Color(0x0C050F20),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(11.97),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Date: 10-11-2025',
                                              style: TextStyle(
                                                color: const Color(0xFF071727),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 7.98),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Looking for an experienced and reliable cleaner to perform a deep cleaning for a 2-bedroom apartment (approx. 1,000 sq. ft).                              Work includes:\n',
                                          style: TextStyle(
                                            color: const Color(0xFF071727),
                                            fontSize: 13.96,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Floor mopping and dusting\nBathroom and kitchen deep cleaning\nWindow and fan cleaning\nBalcony and furniture cleaning\nWaste disposal\n',
                                          style: TextStyle(
                                            color: const Color(0xFF071727),
                                            fontSize: 13.96,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Cleaning materials can be provided if required.                              Preference will be given to workers with prior residential cleaning experience and good reviews.',
                                          style: TextStyle(
                                            color: const Color(0xFF071727),
                                            fontSize: 13.96,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 23.94),
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gallery',
                                    style: TextStyle(
                                      color: const Color(0xFF071727),
                                      fontSize: 13.96,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 11.97),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 110,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/image1.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.98),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 11.54),
                                      Expanded(
                                        child: Container(
                                          height: 110,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/image2.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.98),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 23.94),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      height: 43.89,
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            color: const Color(0x7F1C1C1C),
                                          ),
                                          borderRadius: BorderRadius.circular(11.97),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Reversion',
                                          style: TextStyle(
                                            color: const Color(0x7F1C1C1C),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 7.98),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showReviewDialog(context);
                                    },
                                    child: Container(
                                      height: 43.89,
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFE63946),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(11.97),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Accept',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ]),
              ),

            )));}

  Widget _buildNotificationItem({
    required String imagePath,
    required bool hasUnreadBadge,
    String? badgeCount,
    required String title,
    required String description,
    required String timeAgo,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image with Badge
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF142356),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1E000000),
                    blurRadius: 0,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (hasUnreadBadge)
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7A435),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      badgeCount ?? '2',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: hasUnreadBadge ? 8 : 14),
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        // Time
        Text(
          timeAgo,
          style: const TextStyle(
            color: Color(0xFFB3B8C1),
            fontSize: 12,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// Extension for conditional spacing
// extension on SizedBox {
//   static double get hasUnreadBadge => 8;
// }