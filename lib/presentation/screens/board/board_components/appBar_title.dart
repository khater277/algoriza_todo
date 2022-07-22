import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final double size;

  const AppBarTitle({Key? key, required this.title, this.size = FontSize.s24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          getBoldStyle(fontColor: ColorManager.black, fontSize: size),
    );
  }
}
