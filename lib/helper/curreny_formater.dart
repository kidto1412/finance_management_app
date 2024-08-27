import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// Currency formatter
final NumberFormat currencyFormatter = NumberFormat.currency(
  locale: 'id',
  symbol: 'Rp. ',
  decimalDigits: 0,
);
String formatRupiah(int amount) {
  // Format the amount as Rupiah
  return NumberFormat.currency(
          locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0)
      .format(amount);
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Format the number as currency
    final number = int.parse(newText);
    final formattedText = currencyFormatter.format(number);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
