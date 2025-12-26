
import 'package:ellidobra_job_portal_app/app/modules/home/views/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  final List<Map<String, dynamic>> stats = const [
    {
      'icon': Icons.folder_open,
      'iconColor': Color(0xFF3889CA),
      'backgroundColor': Color(0x4C3889CA),
      'count': '0',
      'label': 'Open Jobs',
    },
    {
      'icon': Icons.work,
      'iconColor': Color(0xFFF6C10E),
      'backgroundColor': Color(0x4CF6C10E),
      'count': '0',
      'label': 'Total Jobs',
    },
    {
      'icon': Icons.pie_chart,
      'iconColor': Color(0xFF9333EA),
      'backgroundColor': Color(0x4C9333EA),
      'count': '0',
      'label': 'In Progress',
    },
    {
      'icon': Icons.check_circle,
      'iconColor': Color(0xFF16A34A),
      'backgroundColor': Color(0x4C16A34A),
      'count': '0',
      'label': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 1.3, // Adjust as needed for card shape
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return StatCard(
          icon: stat['icon'],
          iconColor: stat['iconColor'],
          backgroundColor: stat['backgroundColor'],
          count: stat['count'],
          label: stat['label'],
        );
      },
    );
  }
}
