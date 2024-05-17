import 'package:absensi_fic/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final TextOverflow? textOverflow;
  final TextStyle? textStyle;

  const TextLabel({
    super.key,
    required this.text,
    this.align,
    this.textOverflow,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      overflow: textOverflow,
      style: textStyle ?? AppTextStyle.regularStyle,
    );
  }
}
