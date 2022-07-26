// ignore_for_file: must_be_immutable

import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class DefaultDropDownTextField extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  final SingleValueDropDownController controller;
  final Color? textColor;
  final double textSize;
  final TextInputType? inputType;
  final String? hint;
  final Color? hintColor;
  final Color focusBorder;
  final Color border;
  final String? validateText;
  final double rounded;
  final void Function(dynamic)? onChanged;
  Color? fillColor;
  double? heightPadding;
  double? widthPadding;
  Color? cursorColor;
  DefaultDropDownTextField(
      {Key? key,
      required this.list,
      required this.controller,
      this.textColor,
      required this.textSize,
      this.inputType,
      this.hint,
      this.hintColor,
      required this.focusBorder,
      required this.border,
      this.validateText,
      required this.rounded,
      this.fillColor,
      this.heightPadding,
      this.widthPadding,
      this.cursorColor,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      dropdownRadius: 5,
      dropDownItemCount: list.length,
      clearOption: false,
      singleController: controller,
      textStyle: getSemiBoldStyle(fontColor: textColor!, fontSize: textSize),
      listTextStyle:
          getSemiBoldStyle(fontColor: textColor!, fontSize: textSize),
      validator: (value) {
        if (value!.isEmpty) {
          if (validateText != null) {
            return validateText!;
          } else {
            return "can't be empty";
          }
        }
        return null;
      },
      textFieldDecoration: InputDecoration(
        filled: fillColor == null ? false : true,
        fillColor: fillColor,
        hintText: hint,
        hintStyle: getRegularStyle(fontColor: hintColor!, fontSize: textSize),
        contentPadding: EdgeInsets.symmetric(
            vertical: heightPadding == null ? 18 : heightPadding!,
            horizontal: widthPadding == null ? 10 : widthPadding!),
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
        labelStyle: TextStyle(
          color: textColor,
        ),
      ),
      onChanged: onChanged,
      dropDownList: list
          .map(
            (element) => DropDownValueModel(
                name: element['text'], value: element['value']),
          )
          .toList(),
    );
  }
}
