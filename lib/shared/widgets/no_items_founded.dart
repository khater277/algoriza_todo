import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:flutter/material.dart';

class NoItemsFounded extends StatelessWidget {
  const NoItemsFounded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconBroken.Document,
              color: ColorManager.grey.withOpacity(0.7),
              size: 150,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "There is no tasks yet",
              style: getMediumStyle(
                  fontColor: ColorManager.grey, fontSize: FontSize.s18),
            )
          ],
        ),
      ),
    );
  }
}
