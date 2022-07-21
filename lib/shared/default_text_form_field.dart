// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFormFiled extends StatelessWidget{
  final TextEditingController? controller;
  final Color? textColor;
  final double textSize;
  final TextInputType? inputType;
  final String? hint;
  final Color? hintColor;
  final Color focusBorder;
  final Color border;
  final String? validateText;
  final double rounded;
  final List<TextInputFormatter> formatters;
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



  DefaultTextFormFiled({Key? key,
    required this.controller,
    required this.textColor,
    required this.inputType,
    required this.hint,
    required this.hintColor,
    required this.rounded,
    required this.focusBorder,
    required this.border,
    required this.textSize,
    required this.formatters,
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
  }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: formatters,
      autofocus: autoFocus??false,
      controller: controller,
      cursorColor: cursorColor,
      maxLines: maxLines??1,
      validator: (value) {
        if (value!.isEmpty) {
          if(validateText!=null) {
            return validateText!;
          } else {
            return "can't be empty";
          }
        }
        return null;
      },
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: textColor,
          fontSize: textSize,
          letterSpacing: 1
      ),
      cursorHeight: cursorHeight,
      keyboardType: inputType,
      obscureText: isPassword==null?false:isPassword!,
      decoration: InputDecoration(
        filled: fillColor==null?false:true,
        fillColor: fillColor,
        hintText: hint,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: heightPadding==null?18:heightPadding!,
            horizontal: widthPadding==null?10:widthPadding!),
        prefixIcon: prefix,
        suffixIcon: suffix,
        errorStyle: TextStyle(
            color: Colors.red.withOpacity(0.6)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.6),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.6),
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
    );
  }
}
