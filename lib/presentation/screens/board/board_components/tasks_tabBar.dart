import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:flutter/material.dart';

class TasksTabBar extends StatefulWidget {
  const TasksTabBar({Key? key}) : super(key: key);

  @override
  State<TasksTabBar> createState() => _TasksTabBarState();
}

class _TasksTabBarState extends State<TasksTabBar> {
  final List<String> _titles = [
    "All",
    "Completed",
    "Uncompleted",
    "Favorite"
  ];
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: ColorManager.black,
      unselectedLabelColor: ColorManager.grey,
      indicatorColor: ColorManager.black,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      labelStyle: const TextStyle(
          fontFamily: FontFamily.fontFamily,
          fontWeight: FontWeightManager.medium,
          fontSize: FontSize.s12
      ),
      onTap: (value){
        debugPrint(value.toString());
      },
      tabs: _titles.map((text) => Tab(text: text,)).toList(),
    );
  }
}
