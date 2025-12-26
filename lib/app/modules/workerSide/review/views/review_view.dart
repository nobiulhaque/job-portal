import 'package:ellidobra_job_portal_app/app/modules/workerSide/review/views/review_card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
 ReviewView({super.key});
@override
  final controller = Get.put(ReviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.reviews.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final review = controller.reviews[index];
          return ReviewCard(
            name: review['name'] as String,
            avatar: review['avatar'] as String,
            review: review['review'] as String,
            author: review['author'] as String,
            rating: review['rating'] as int,
          );
        },
      ),
    );
  }
}

