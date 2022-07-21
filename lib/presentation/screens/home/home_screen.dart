import 'package:algoriza_todo/presentation/screens/home/home_components/appBar_button.dart';
import 'package:algoriza_todo/presentation/screens/home/home_components/tasks_tabBar.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:algoriza_todo/shared/default_elevated_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Board",
          style: getBoldStyle(
              fontColor: ColorManager.black, fontSize: FontSize.s24),
        ),
        actions: [
          AppBarButton(icon: IconBroken.Search, onPressed: () {}),
          AppBarButton(icon: IconBroken.Notification, onPressed: () {}),
          AppBarButton(icon: IconBroken.Filter, onPressed: () {}),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Divider(
            color: ColorManager.lightGrey,
          ),
          Expanded(
            child: DefaultTabController(
                length: 4, // length of tabs
                initialIndex: 0,
                child: Column(children: [
                  const TasksTabBar(),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: ColorManager.lightGrey,
                                    width: 0.5))),
                        child: const TabBarView(
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
                            ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: DefaultElevatedButton(
                        color: ColorManager.green,
                        rounded: 12,
                        height: 45,
                        width: double.infinity,
                        onPressed: (){

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

