String unformatBalance(String formattedBalance) {
  // Remove non-numeric characters except for the decimal point
  return formattedBalance.replaceAll(RegExp(r'[^\d]'), '');
}
