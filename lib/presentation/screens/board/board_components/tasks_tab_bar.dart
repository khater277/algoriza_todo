import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:flutter/material.dart';

class TasksTabBar extends StatelessWidget {
  final List<String> titles;
  const TasksTabBar({Key? key, required this.titles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: ColorManager.mediumGrey, width: 0.5),
        bottom: BorderSide(color: ColorManager.mediumGrey, width: 0.5),
      )),
      child: TabBar(
        labelColor: ColorManager.black,
        unselectedLabelColor: ColorManager.grey,
        unselectedLabelStyle: getMediumStyle(fontColor: ColorManager.black),
        indicatorColor: ColorManager.black,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        labelStyle: getSemiBoldStyle(fontColor: ColorManager.black),
        onTap: (value) {
          debugPrint(value.toString());
        },
        tabs: titles
            .map((text) => Tab(
                  text: text,
                ))
            .toList(),
      ),
    );
  }
}
