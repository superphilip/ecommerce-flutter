import 'package:flutter/material.dart';

class DefaultHeaderTextIcon extends StatelessWidget {
  IconData? icon;
  Color? colorIcon;
  double? size;
  String text;
  Color? colorText;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  int? maxLines;
  TextAlign? textAlign;


  DefaultHeaderTextIcon(
    this.text, {
    this.icon = Icons.person,
    this.colorIcon = Colors.white,
    this.size = 125,
    this.colorText = Colors.white,
    this.fontSize = 25,
    this.fontWeight = FontWeight.bold,
    this.overflow,
    this.maxLines,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: colorIcon, size: size),
        Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          overflow: overflow,
          maxLines: maxLines,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
