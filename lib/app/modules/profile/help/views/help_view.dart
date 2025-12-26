import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF071727)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            color: Color(0xFF071727),
            fontSize: 22,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We\'re here to help you every step of the way!\nIf you face any issues or have questions about using the app, our support team is always ready to assist.',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              title: '1. Common Issues',
              bullets: [
                'Trouble posting or finding a job',
                'Payment or withdrawal problems',
                'Bid or proposal not showing',
                'Profile or account login issues',
                'Notification or app update problems',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '2. How to Get Help',
              content: 'You can reach our support team in the following ways:',
              bullets: [
                'In-App Chat: Go to Settings → Help & Support → Chat with Us',
                'Email: support@[yourappname].com',
                'Call (optional): +8801XXXXXXXXXX',
                'Support Hours: 9 AM – 9 PM (Saturday – Friday)',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '3. FAQs',
              content: 'Before contacting support, you can also check our FAQ Section for quick answers about:',
              bullets: [
                'How to post a job',
                'How to send a bid or proposal',
                'How payments and ratings work',
                'How to update or delete your account',
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              '4. Feedback & Suggestions',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                height: 1.50,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'We value your opinion!\nIf you have ideas to improve our platform, please share your feedback — it helps us make the app better for everyone.\nSubmit Feedback: Settings → Help & Support → Send Feedback',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '5. Emergency Support',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                height: 1.50,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'If you experience harassment, scams, or any suspicious activity, report it immediately through:\nReport User / Report Job option on the profile or job page.\nOur safety team will review and take action promptly.',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    String? content,
    List<String>? bullets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF071727),
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
            height: 1.50,
          ),
        ),
        if (content != null) ...[
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF071727),
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
        if (bullets != null && bullets.isNotEmpty) ...[
          const SizedBox(height: 12),
          ...bullets.map((bullet) => Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(
                        color: Color(0xFF071727),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bullet,
                        style: const TextStyle(
                          color: Color(0xFF071727),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ],
    );
  }
}
