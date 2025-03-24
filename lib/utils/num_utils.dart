import 'package:intl/intl.dart';

class NumUtils {
  static String formatAmount(double amount) {
    String formatedAmount = "";
    if (amount >= 10000000) {
      formatedAmount = '${(amount / 10000000).toStringAsFixed(0)} Cr';
    } else if (amount >= 100000) {
      formatedAmount = '${(amount / 100000).toStringAsFixed(0)} L';
    } else if (amount >= 1000 && amount <= 100000) {
      formatedAmount = '${(amount / 1000).toStringAsFixed(0)} K';
    } else {
      formatedAmount = amount.toStringAsFixed(0);
    }


    return "₹ $formatedAmount";
  }
}