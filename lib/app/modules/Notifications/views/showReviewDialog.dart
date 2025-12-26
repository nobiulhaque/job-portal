import 'package:flutter/material.dart';

void showReviewDialog(BuildContext context) {
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
                      color: const Color(0xFFE63946),
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
                            'Review',
                            style: TextStyle(
                              color: const Color(0xFF071727),
                              fontSize: 23.94,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 7.98),
                          Container(
                            width: double.infinity,
                            height: 157,
                            padding: const EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: const Color(0xFFE63946),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Write Your Review',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF071727),
                                  fontSize: 13.96,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 23.94),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              // Handle submit logic here
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
                                  'Submit',
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
                    const SizedBox(height: 23.94),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 43.89,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11.97),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: const Color(0xFF797979),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
    ),
  );
}
