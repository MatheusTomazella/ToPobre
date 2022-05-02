String cleanMoneyString(String string) {
  if (string.isEmpty) return string;
  return RegExp(r'\d|[,.]') // numbers and money separators
      .allMatches(string.replaceFirst(",", "."))
      .map((m) => m.group(0))
      .toList()
      .join();
}
