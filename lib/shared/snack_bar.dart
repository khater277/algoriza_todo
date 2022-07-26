import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showSnackBar({
  required String title,
  required String content,
  required Color color,
  required Color fontColor,
  required IconData icon,
  int duration = 3,
}) {
  return Get.snackbar(title, content,
      titleText: Text(
        title,
        style: getMediumStyle(fontColor: fontColor, fontSize: FontSize.s16),
      ),
      messageText: Text(
        content,
        style: getRegularStyle(fontColor: fontColor, fontSize: FontSize.s14),
      ),
      icon: Icon(
        icon,
        color: fontColor,
        size: 20,
      ),
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      borderRadius: 5,
      margin: const EdgeInsets.symmetric(horizontal: 2)
      //padding: const EdgeInsets.all(0)
      );
}
