import 'package:flutter/services.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty &&
        newValue.text.length > oldValue.text.length) {
      if (newValue.text.length > mask.length) return oldValue;
      if (newValue.text.length < mask.length &&
          mask[newValue.text.length - 1] == separator) {
        return TextEditingValue(
          text:
              '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      }
    }
    return newValue;
  }
}
