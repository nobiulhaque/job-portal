



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/worker_payment_controller.dart';
import '../../withdraw/views/withdraw_view.dart';



class WorkerPaymentView extends GetView<WorkerPaymentController> {
  const WorkerPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF071727)),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Payments',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF071727),
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 1.27,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet, color: Color(0xFF071727)),
            onPressed: () => Get.to(() =>  WithdrawView()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Payment Summary Cards
              _buildSummaryCard(
                backgroundColor: const Color(0x353889CA),
                iconBackgroundColor: const Color(0x193889CA),
                icon: Icons.credit_card,
                title: 'Total Payment',
                amount: '\$10,200',
              ),
              const SizedBox(height: 16),
              _buildSummaryCard(
                backgroundColor: const Color(0x7F8AD1A3),
                iconBackgroundColor: const Color(0x4C16A34A),
                icon: Icons.check_circle_outline,
                title: 'Complete Payment',
                amount: '\$500',
              ),
              const SizedBox(height: 16),
              _buildSummaryCard(
                backgroundColor: const Color(0x7FFC7B00),
                iconBackgroundColor: const Color(0x4CFF9633),
                icon: Icons.pending_outlined,
                title: 'Pending Payment',
                amount: '\$5000',
              ),
              const SizedBox(height: 16),
              _buildSummaryCard(
                backgroundColor: const Color(0x7FFF1F30),
                iconBackgroundColor: const Color(0x4CFF3D4B),
                icon: Icons.cancel_outlined,
                title: 'Cancel Payment',
                amount: '\$200',
              ),
              const SizedBox(height: 48),
              // Transaction History Section
              const Text(
                'Transaction History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.42,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              // Transaction List
              _buildTransactionItem(
                title: 'App UI Design',
                transactionId: '564925374920',
                amount: '\$ 1000.00',
                status: 'Complete',
                statusColor: const Color(0xFF5CC486),
                statusBgColor: const Color(0x3300FF93),
                date: '20 Sep 2025',
                time: '10:34 AM',
              ),
              const SizedBox(height: 12),
              _buildTransactionItem(
                title: 'App Fontend Design',
                transactionId: '564925374920',
                amount: '\$ 1000.00',
                status: 'Cancel',
                statusColor: const Color(0xFFE63946),
                statusBgColor: const Color(0x4CE63946),
                date: '20 Sep 2025',
                time: '10:34 AM',
              ),
              const SizedBox(height: 12),
              _buildTransactionItem(
                title: 'App UI Design',
                transactionId: '564925374920',
                amount: '\$ 500.00',
                status: 'Complete',
                statusColor: const Color(0xFF5CC486),
                statusBgColor: const Color(0x3300FF93),
                date: '20 Sep 2025',
                time: '10:34 AM',
              ),
              const SizedBox(height: 12),
              _buildTransactionItem(
                title: 'App UX Design',
                transactionId: '564925374920',
                amount: '\$ 2500.00',
                status: 'Complete',
                statusColor: const Color(0xFF5CC486),
                statusBgColor: const Color(0x3300FF93),
                date: '20 Sep 2025',
                time: '10:34 AM',
              ),
              const SizedBox(height: 12),
              _buildTransactionItem(
                title: 'App UI Design',
                transactionId: '564925374920',
                amount: '\$ 500.00',
                status: 'Pending',
                statusColor: const Color(0xFFFF9633),
                statusBgColor: const Color(0x33FF9633),
                date: '20 Sep 2025',
                time: '10:34 AM',
              ),
              const SizedBox(height: 12),
              _buildTransactionItem(
                title: 'App Fontend Design',
                transactionId: '564925374920',
                amount: '\$ 100.00',
                status: 'Cancel',
                statusColor: const Color(0xFFE63946),
                statusBgColor: const Color(0x4CE63946),
                date: '20 Sep 2025',
                time: '10:34 AM',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required Color backgroundColor,
    required Color iconBackgroundColor,
    required IconData icon,
    required String title,
    required String amount,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14.52),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1F1A1A),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  amount,
                  style: const TextStyle(
                    color: Color(0xFF383838),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String transactionId,
    required String amount,
    required String status,
    required Color statusColor,
    required Color statusBgColor,
    required String date,
    required String time,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFB3C5F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/Plus.png',
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Left Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF26273A),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Transaction ID',
                  style: TextStyle(
                    color: Color(0x9926273A),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  transactionId,
                  style: const TextStyle(
                    color: Color(0xFF26273A),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Right Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF26273A),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    date,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0x9926273A),
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    time,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0x9926273A),
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}