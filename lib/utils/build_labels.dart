String buildNameAmountPercentageLabel(
    String name, double amount, double percentage) {
  return '$name\n$amount\n${percentage.toStringAsFixed(1)}%';
}
