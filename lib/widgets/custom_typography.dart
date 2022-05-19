import 'package:flutter/material.dart';

const bodyColor = Color(0xFF222222);

class CustomTypography extends StatelessWidget {
  const CustomTypography(
    this.text, {
    Key? key,
    this.type,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.color,
    this.isBold,
  }) : super(key: key);
  const CustomTypography.heading(
    this.text, {
    Key? key,
    this.type = 'heading',
    this.maxLines = 1,
    this.textAlign,
    this.overflow,
    this.color = bodyColor,
    this.isBold = true,
  }) : super(key: key);
  const CustomTypography.body(
    this.text, {
    Key? key,
    this.type = 'body',
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.color,
    this.isBold = false,
  }) : super(key: key);

  final String text;
  final String? type;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color? color;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Text(
      text,
      style: TextStyle(
        fontSize: type == 'heading' ? 24 : 16,
        fontWeight: type == 'heading' ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      maxLines: 1,
      textAlign: textAlign,
    );
  }
}
