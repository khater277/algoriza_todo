// ignore_for_file: must_be_immutable

import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:flutter/material.dart';

class DefaultTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final Color? textColor;
  final double textSize;
  final bool readOnly;
  final TextInputType? inputType;
  final String? hint;
  final Color? hintColor;
  final Color focusBorder;
  final Color border;
  final String? validateText;
  final double rounded;
  final bool isTime;
  final int startTime;
  final int endTime;
  Color? fillColor;
  String? label;
  bool? autoFocus;
  Widget? prefix;
  Widget? suffix;
  double? heightPadding;
  double? widthPadding;
  Color? cursorColor;
  double? cursorHeight;
  bool? isPassword;
  int? maxLines;
  VoidCallback? onTap;

  DefaultTextFormFiled({
    Key? key,
    required this.controller,
    required this.textColor,
    required this.inputType,
    required this.hint,
    required this.hintColor,
    required this.rounded,
    required this.focusBorder,
    required this.border,
    required this.textSize,
    this.readOnly = false,
    this.fillColor,
    this.label,
    this.autoFocus,
    this.isPassword,
    this.validateText,
    this.cursorColor,
    this.cursorHeight,
    this.heightPadding,
    this.widthPadding,
    this.suffix,
    this.prefix,
    this.maxLines,
    this.onTap,
    this.isTime = false,
    this.startTime = 0,
    this.endTime = 0,
  }) : super(key: key);

  String? validator(value) {
    if (value!.isEmpty) {
      return validateText ?? "can't be empty";
    } else if (isTime) {
      if (startTime >= endTime) {
        return "invalid time";
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus ?? false,
      controller: controller,
      readOnly: readOnly,
      cursorColor: cursorColor,
      maxLines: maxLines ?? 1,
      validator: validator,
      style: getSemiBoldStyle(fontColor: textColor!, fontSize: textSize),
      cursorHeight: cursorHeight,
      keyboardType: inputType,
      obscureText: isPassword == null ? false : isPassword!,
      decoration: InputDecoration(
        filled: fillColor == null ? false : true,
        fillColor: fillColor,
        hintText: hint,
        hintStyle: getRegularStyle(fontColor: hintColor!, fontSize: textSize),
        contentPadding: EdgeInsets.symmetric(
            vertical: heightPadding == null ? 18 : heightPadding!,
            horizontal: widthPadding == null ? 10 : widthPadding!),
        prefixIcon: prefix,
        suffixIcon: suffix,
        errorStyle: getMediumStyle(
            fontColor: Colors.red.withOpacity(0.6), fontSize: FontSize.s12),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.3),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.3),
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: border,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: focusBorder,
            )),
        labelText: label,
        labelStyle: TextStyle(
          color: textColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
