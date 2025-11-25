import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String? initialValue;
  String? errorText;
  IconData icon;
  Color? color;
  FilteringTextInputFormatter? formatter;
  Function(String text) onChanged;
  String? Function(String?)? validator;
  bool obscureText = false;
  TextInputType? keyboardType;

  DefaultTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.formatter,
    this.errorText,
    this.validator,
    this.obscureText = false,
    this.initialValue,
    this.color = Colors.white,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: (text) => onChanged(text),
      validator: validator,
      cursorColor: color,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: color)),
        errorText: errorText,
        prefixIcon: Icon(icon, color: color),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
      ),
      inputFormatters: [?formatter],
      keyboardType: keyboardType,
      style: TextStyle(color: color),
    );
  }
}
