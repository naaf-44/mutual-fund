/// NumUtils has the numeric formatted value.
class NumUtils {

  /// amount format which displayed across the application.
  static String formatAmount(double amount) {
    String formattedAmount = "";
    if (amount >= 10000000) {
      formattedAmount = '${(amount / 10000000).toStringAsFixed(0)} Cr';
    } else if (amount >= 100000) {
      formattedAmount = '${(amount / 100000).toStringAsFixed(0)} L';
    } else if (amount >= 1000 && amount <= 100000) {
      formattedAmount = '${(amount / 1000).toStringAsFixed(0)} K';
    } else {
      formattedAmount = amount.toStringAsFixed(0);
    }


    return "₹ $formattedAmount";
  }
}