import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          IconBroken.Arrow___Left_2,
          color: ColorManager.black,
          size: 20,
        ));
  }
}
