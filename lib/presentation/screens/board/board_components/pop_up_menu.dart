import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/models/TaskModel.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:flutter/material.dart';

class TaskPopupMenu extends StatelessWidget {
  final AppCubit cubit;
  final TaskModel task;
  final int index;
  const TaskPopupMenu({Key? key, required this.task, required this.index, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Map<String,dynamic>> items = [
      {
        "name":"complete",
        "icon":IconBroken.Shield_Done,
        "color":Colors.green,
      },
      {
        "name":"favorite",
        "icon":IconBroken.Heart,
        "color":Colors.pink,
      },
      {
        "name":"delete",
        "icon":IconBroken.Delete,
        "color":Colors.red,
      }
    ];

    return PopupMenuButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            )
        ),
        //color: !cubit.isDarkMode?const Color(0xff010108):Colors.white,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        enabled: true,
        onSelected: (Map<String,dynamic>value) {
          if(value['name'] == "delete") {
            // cubit.deleteTask(index: index, task: task);
          }else if(value['name'] == "complete"){
            cubit.getTasks();
          }else{
            // cubit.addToPend(index: index, task: task);
          }
          debugPrint(value.toString());
          //cubit.deletePost(index: index);
        },
        itemBuilder:(context) {
          return items.map((Map<String,dynamic> choice) {
            return PopupMenuItem(
              value: choice,
              child: Row(
                children: [
                  Expanded(child: Text(choice['name'],
                    style: getMediumStyle(
                        fontColor: ColorManager.black,
                        fontSize: FontSize.s14)
                    ,)),
                  Icon(choice['icon'],color: choice['color'],)
                ],
              ),
            );
          }).toList();
        }
    );
  }
}