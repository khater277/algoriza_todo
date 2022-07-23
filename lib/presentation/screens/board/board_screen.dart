import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/cubit/app_states.dart';
import 'package:algoriza_todo/models/TaskModel.dart';
import 'package:algoriza_todo/presentation/screens/add_task/add_task_screen.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/appBar_button.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/appBar_title.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/tasks_tabBar.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/teb_content.dart';
import 'package:algoriza_todo/presentation/screens/schedule/schedule_screen.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:algoriza_todo/shared/navigation.dart';
import 'package:algoriza_todo/shared/widgets/elevated_button.dart';
import 'package:algoriza_todo/shared/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {

  final List<String> _titles = [
    "All",
    "Completed",
    "Uncompleted",
    "Favorite"
  ];



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const AppBarTitle(title: "Board"),
            actions: [
              AppBarButton(icon: IconBroken.Notification, onPressed: () {}),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: AppBarButton(
                    icon: IconBroken.Calendar,
                    onPressed: () {
                      navigateTo(context: context, screen: const ScheduleScreen());
                    })
                ,
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: Column(children: [
                      const SizedBox(height: 10,),
                      TasksTabBar(
                        titles:
                        cubit.tasks.map((element) => element["title"].toString()).toList(),
                      ),
                      Expanded(
                        child: state is! AppOpenDBLoadingState?
                        TabBarView(
                            children: cubit.tasks.map((element){
                              List<TaskModel> tasks = element['list'].toList();
                              return TabContent(tasks: tasks);
                            }).toList()
                        )
                            :
                        const DefaultProgressIndicator(width: 2.0, color: ColorManager.green),
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
      },
    );
  }
}

