
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerMessageScreenController extends GetxController {}

class WorkerMessageScreenView extends GetView<WorkerMessageScreenController> {
  const WorkerMessageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF071727)),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Jonak',
              style: TextStyle(
                color: Color(0xFF071727),
                fontSize: 24,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              reverse: true,
              children: [
                _buildReceivedMessage(
                  'Hello,im fine,how can i help you?',
                  'assets/images/profile.png',
                ),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Hi! I need a cleaner for my apartment. Are you available tomorrow morning?',
                  'assets/images/profile2.png',
                ),
                const SizedBox(height: 12),
                _buildReceivedMessage(
                  'Hello! Yes, Im available. Could you please share the location and what type of cleaning you need?',
                  'assets/images/profile.png',
                ),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Its a 2-bedroom apartment in Dhanmondi. I need deep cleaning — especially kitchen and bathroom.',
                  'assets/images/profile2.png',
                ),
                const SizedBox(height: 12),
                _buildReceivedMessage(
                  'Sure! I specialize in deep cleaning. Itll take around 3–4 hours depending on the condition.                        Would you like me to bring cleaning materials, or will you provide them?',
                  'assets/images/profile.png',
                ),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Please bring your own materials. How much will it cost?',
                  'assets/images/profile2.png',
                ),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Hello Jonak,how are you today?',
                  'assets/images/profile2.png',
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String message, String avatarPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(avatarPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Container(
          constraints: const BoxConstraints(maxWidth: 252),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 13,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSentMessage(String message, String avatarPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(avatarPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Container(
          constraints: const BoxConstraints(maxWidth: 291),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            color: Color(0xFF2A3D5F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x21000000),
            blurRadius: 20,
            offset: Offset(5, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write your message',
                hintStyle: TextStyle(
                  color: Color(0xFFA1A1A1),
                  fontSize: 13,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.attach_file, size: 24, color: Color(0xFFA1A1A1)),
                onPressed: () {},
              ),
              const SizedBox(width: 7),
              IconButton(
                icon: const Icon(Icons.send, size: 24, color: Color(0xFF2A3D5F)),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}