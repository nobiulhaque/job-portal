import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  const PrivacyView({super.key});
  
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
          'Security & Privacy Policy',
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
              'Your privacy and security are our top priority. We are committed to protecting your personal information and ensuring a safe experience for both Employers and Workers on our platform.',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0.10,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              title: '1. Data Collection',
              content: 'We collect only the information necessary to provide and improve our services, such as:',
              bullets: [
                'Name, email, and contact details',
                'Profile information (skills, experience, company name, etc.)',
                'Job posts, bids, and messages',
                'Payment and transaction details (processed securely)',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '2. Data Usage',
              content: 'We collect only the information necessary to provide and improve our services, such as:',
              bullets: [
                'Name, email, and contact details',
                'Profile information (skills, experience, company name, etc.)',
                'Job posts, bids, and messages',
                'Payment and transaction details (processed securely)',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '3. Data Sharing',
              content: 'We do not sell or rent your personal data to any third parties.\nInformation is shared only:',
              bullets: [
                'With other users (for job-related purposes)',
                'With payment gateways (for secure transactions)',
                'If required by law or legal process',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '4. Security Measures',
              content: 'We use advanced security technologies and encrypted connections (SSL) to protect your personal data.',
              bullets: [
                'Passwords are stored in encrypted format',
                'Regular security audits are performed',
                'Suspicious activities are monitored and blocked',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '5. Your Control',
              content: 'We use advanced security technologies and encrypted connections (SSL) to protect your personal data.',
              bullets: [
                'Passwords are stored in encrypted format',
                'Regular security audits are performed',
                'Suspicious activities are monitored and blocked',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '6. Cookies & Tracking',
              content: 'We use cookies to enhance your experience, such as saving preferences or improving site speed.\nYou can manage or disable cookies in your browser settings.',
            ),
            const SizedBox(height: 16),
            const Text(
              '7. Policy Updates',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w600,
                height: 1.50,
                letterSpacing: 0.10,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We may update this policy from time to time. All changes will be notified in the app or via email.',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '8. Contact Us',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w600,
                height: 1.50,
                letterSpacing: 0.10,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'support@[yourappname].com',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
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
    required String content,
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
            letterSpacing: 0.10,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(
            color: Color(0xFF071727),
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            height: 1.5,
          ),
        ),
        if (bullets != null && bullets.isNotEmpty) ...[
          const SizedBox(height: 8),
          ...bullets.map((bullet) => Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
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
                          letterSpacing: 0.25,
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
