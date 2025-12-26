import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
 WithdrawView({super.key});
@override
  final controller = Get.put(WithdrawController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF002249),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: Get.back,
        ),
        title: const Text(
          'Withdraw Funds',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transfer your earning to your account',
              style: TextStyle(color: Color(0xFF656565)),
            ),
            const SizedBox(height: 32),

            /// Amount
            const Text('Amount', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            _amountField(),

            const SizedBox(height: 32),

            /// Payout Method
            const Text('Payout Method', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(child: _paymentTab('bank', Icons.account_balance, 'Bank')),
                const SizedBox(width: 12),
                Expanded(child: _paymentTab('debit', Icons.credit_card, 'Debit Card')),
              ],
            ),

            const SizedBox(height: 20),

            /// Bank Accounts
            _bankItem('Bank of Rhodes', '**** 2586'),
            const SizedBox(height: 12),
            _bankItem('Valentine Savings Bank', '**** 2816'),

            const SizedBox(height: 24),

            /// Add New Bank Account
            _addNewBankAccountButton(),

            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _withdrawButton(),
    );
  }

  /// ---------------- Widgets ----------------

  Widget _paymentTab(String type, IconData icon, String title) {
    return Obx(() {
      final isSelected = controller.selectedPaymentMethod.value == type;

      return GestureDetector(
        onTap: () => controller.selectPaymentMethod(type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF002249).withOpacity(0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF002249)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xFF002249)),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
        ),
      );
    });
  }

  Widget _bankItem(String bankName, String accountNumber) {
    return Obx(() {
      final isSelected =
          controller.selectedBankAccount.value == bankName;

      return GestureDetector(
        onTap: () => controller.selectBankAccount(bankName),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF002249).withOpacity(0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF002249)),
          ),
          child: Row(
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: const Color(0xFF002249),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bankName, style: const TextStyle(fontSize: 16)),
                  Text(accountNumber,
                      style: const TextStyle(color: Color(0xFF656565))),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _amountField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF002249).withOpacity(0.3),
        borderRadius: BorderRadius.circular(14.27),
        border: Border.all(
          color: const Color(0xFF002249),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: const Color(0xFF002249).withOpacity(0.1),
              borderRadius: BorderRadius.circular(7.74),
            ),
            child: const Center(
              child: Text(
                '฿',
                style: TextStyle(
                  color: Color(0xFF002249),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF191919),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                hintText: '******',
                hintStyle: TextStyle(
                  color: Color(0xFF656565),
                  fontSize: 16,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addNewBankAccountButton() {
    return GestureDetector(
      onTap: () => controller.addNewBankAccount(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF002249).withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF002249).withOpacity(0.7),
            width: 0.5,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Color(0xFF002249),
              size: 24,
            ),
            SizedBox(width: 8),
            Text(
              'Add New Bank Account',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _withdrawButton() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ElevatedButton(
        onPressed: controller.withdraw,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF002249),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text('Withdraw'),
      ),
    );
  }
}
