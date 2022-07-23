import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:flutter/material.dart';

class NoItemsFounded extends StatelessWidget {
  final String text;
  final Widget widget;
  const NoItemsFounded({Key? key, required this.text, required this.widget,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          const SizedBox(height: 15,),
          Text(text,
            style: getMediumStyle(fontColor: ColorManager.grey,fontSize: FontSize.s18),)
        ],
      ),
    );
  }
}
