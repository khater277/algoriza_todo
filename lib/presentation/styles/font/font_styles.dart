import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required Color fontColor,
}){
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: fontColor
  );
}

///Bold font style
TextStyle getBoldStyle({
  double fontSize = FontSize.s14,
  required Color fontColor
}){
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontFamily.fontFamily,
      fontWeight: FontWeightManager.bold,
      fontColor: fontColor);
}

///SemiBold font style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s14,
  required Color fontColor
}){
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontFamily.fontFamily,
      fontWeight: FontWeightManager.semiBold,
      fontColor: fontColor);
}

///Medium font style
TextStyle getMediumStyle({
  double fontSize = FontSize.s14,
  required Color fontColor
}){
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontFamily.fontFamily,
      fontWeight: FontWeightManager.medium,
      fontColor: fontColor);
}

///Regular font style
TextStyle getRegularStyle({
  double fontSize = FontSize.s14,
  required Color fontColor
}){
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontFamily.fontFamily,
      fontWeight: FontWeightManager.regular,
      fontColor: fontColor);
}

///Light font style
TextStyle getLightStyle({
  double fontSize = FontSize.s14,
  required Color fontColor
}){
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontFamily.fontFamily,
      fontWeight: FontWeightManager.light,
      fontColor: fontColor);
}