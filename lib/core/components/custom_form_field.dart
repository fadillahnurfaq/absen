import 'package:absensi_fic/core/components/spaces.dart';
import 'package:absensi_fic/core/components/text.dart';
import 'package:absensi_fic/core/constants/app_colors.dart';
import 'package:absensi_fic/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final void Function(String)? onSubmit;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode? focusText;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? suffixText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? focusColor;
  final Color? fillColor;
  final bool? readOnly;
  final bool obscureText;
  final TextInputAction? styleTextInputAction;
  final TextInputType? keyboardType;
  final bool isDigitsAndDotsOnly;
  final bool isNumberOnly;
  final bool isLowerCase;
  final bool isCurrency;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? maxLength;

  const CustomFormField({
    super.key,
    required this.label,
    this.initialValue,
    this.controller,
    this.onTap,
    this.onSubmit,
    this.onSaved,
    this.validator,
    this.prefix,
    this.suffix,
    this.isDigitsAndDotsOnly = false,
    this.isNumberOnly = false,
    this.isLowerCase = false,
    this.isCurrency = false,
    this.obscureText = false,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.hintText,
    this.hintStyle,
    this.suffixText,
    this.contentPadding,
    this.focusText,
    this.focusColor,
    this.fillColor,
    this.readOnly,
    this.styleTextInputAction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: label,
          textStyle: AppTextStyle.h4,
        ),
        const SpaceHeight(12.0),
        TextFormField(
          initialValue: initialValue,
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          onTap: onTap,
          controller: controller,
          focusNode: focusText,
          validator: validator,
          textInputAction: styleTextInputAction ?? TextInputAction.next,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
          onSaved: onSaved,
          cursorColor: AppColors.primary,
          obscureText: obscureText,
          // inputFormatters: isDigitsAndDotsOnly
          //     ? [
          //         FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
          //       ]
          //     : isNumberOnly
          //         ? [
          //             FilteringTextInputFormatter.digitsOnly,
          //           ]
          //         : isLowerCase
          //             ? [
          //                 LowerCaseTextFormatter(),
          //               ]
          //             : isCurrency
          //                 ? [
          //                     FilteringTextInputFormatter.digitsOnly,
          //                     CurrencyInputFormatter(),
          //                   ]
          //                 : null,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: "",

            suffixText: suffixText,
            contentPadding: contentPadding ?? const EdgeInsets.all(10),
            prefixIcon: prefix,
            suffixIcon: suffix,
            // filled: true,
            // fillColor: fillColor ?? AppColors.backgroundcolor,
            enabledBorder: _border(
              color: AppColors.grey,
            ),
            focusedBorder: _border(
              indent: 2.0,
              color: focusColor ?? Colors.grey,
            ),
            errorBorder: _border(
              color: Colors.red,
            ),
            focusedErrorBorder: _border(
              indent: 2.0,
              color: focusColor ?? Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({final double? indent, final Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        width: indent ?? 1,
        color: color ?? AppColors.primary,
      ),
    );
  }
}
