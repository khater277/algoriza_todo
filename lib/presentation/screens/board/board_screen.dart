import 'package:algoriza_todo/presentation/screens/add_task/add_task_screen.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/appBar_button.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/appBar_title.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/tasks_tabBar.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:algoriza_todo/shared/navigation.dart';
import 'package:algoriza_todo/shared/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Board"),
        actions: [
          AppBarButton(icon: IconBroken.Notification, onPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: AppBarButton(icon: IconBroken.Calendar, onPressed: () {}),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultTabController(
                length: 4, // length of tabs
                initialIndex: 0,
                child: Column(children: [
                  const SizedBox(height: 10,),
                  const TasksTabBar(),
                  const Expanded(
                    child: TabBarView(
                        children: [
                          Center(
                            child: Text('Display Tab 1',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text('Display Tab 2',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text('Display Tab 3',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text('Display Tab 4',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: DefaultElevatedButton(
                        color: ColorManager.green,
                        rounded: 12,
                        height: 45,
                        width: double.infinity,
                        onPressed: (){
                          navigateTo(context: context, screen: const AddTaskScreen());
                        },
                        child: Text(
                          "Add a task",
                          style: getBoldStyle(fontColor: ColorManager.white,),
                        )),
                  ),
                ])),
          )
        ],
      ),
    );
  }


}

