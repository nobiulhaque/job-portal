import 'package:flutter/material.dart';


class ReviewCard extends StatelessWidget {
  final String name;
  final String avatar;
  final String review;
  final String author;
  final int rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.avatar,
    required this.review,
    required this.author,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with avatar and name
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(avatar),
                backgroundColor: Colors.grey.shade200,
              ),
              const SizedBox(width: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3142),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Review text
          Text(
            review,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF5A5A5A),
              height: 1.6,
              letterSpacing: 0.2,
            ),
          ),

          const SizedBox(height: 12),

          // Author
          Text(
            '— $author',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF9E9E9E),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 16),

          // Star rating
          Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.star,
                  size: 20,
                  color: index < rating
                      ? const Color(0xFFFFB300)
                      : const Color(0xFFE0E0E0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}