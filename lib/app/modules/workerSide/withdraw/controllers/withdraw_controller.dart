import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController {
  final amountController = TextEditingController();

  final selectedPaymentMethod = 'bank'.obs;
  final selectedBankAccount = 'Bank of Rhodes'.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void selectBankAccount(String account) {
    selectedBankAccount.value = account;
  }

  void withdraw() {
    Get.snackbar(
      'Success',
      'Withdraw request submitted',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void addNewBankAccount() {
    Get.snackbar(
      'Add New Account',
      'Add new bank account functionality',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
