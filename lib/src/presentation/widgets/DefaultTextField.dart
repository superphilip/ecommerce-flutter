import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String? errorText;
  IconData icon;
  FilteringTextInputFormatter? formatter;
  Function(String text) onChanged;
  bool obscureText = false;

  DefaultTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.formatter,
    this.errorText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: (text) => onChanged(text),
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: Colors.white)),
        errorText: errorText,
        prefixIcon: Icon(icon, color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      inputFormatters: [?formatter],
      style: TextStyle(color: Colors.white),
    );
  }
}
