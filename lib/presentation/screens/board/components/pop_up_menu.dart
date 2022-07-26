import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/models/task_model.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:algoriza_todo/services/local_db/sqflite_constants.dart';
import 'package:flutter/material.dart';

class TaskPopupMenu extends StatelessWidget {
  final AppCubit cubit;
  final TaskModel task;
  final int index;
  const TaskPopupMenu(
      {Key? key, required this.task, required this.index, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCompleted = task.completed == 1;
    bool isFavorite = task.favorite == 1;

    String completeName = isCompleted ? "uncompleted" : "complete";
    String favoriteName = isFavorite ? "unfavored" : "favorite";

    List<Map<String, dynamic>> items = [
      {
        "name": completeName,
        "icon": IconBroken.Shield_Done,
        "color": Colors.green,
      },
      {
        "name": favoriteName,
        "icon": IconBroken.Heart,
        "color": Colors.pink,
      },
      {
        "name": "delete",
        "icon": IconBroken.Delete,
        "color": Colors.red,
      }
    ];

    return PopupMenuButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            )),
        //color: !cubit.isDarkMode?const Color(0xff010108):Colors.white,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        enabled: true,
        onSelected: (Map<String, dynamic> value) {
          if (value['name'] == favoriteName) {
            cubit.updateTask(
                id: task.id!,
                field: SqfLiteConstants.favorite,
                value: isFavorite ? false : true);
          } else if (value['name'] == completeName) {
            cubit.updateTask(
                id: task.id!,
                field: SqfLiteConstants.completed,
                value: isCompleted ? false : true);
            // print
          } else {
            cubit.deleteTask(id: task.id!);
          }
          debugPrint(value.toString());
          //cubit.deletePost(index: index);
        },
        itemBuilder: (context) {
          return items.map((Map<String, dynamic> choice) {
            return PopupMenuItem(
              value: choice,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    choice['name'],
                    style: getMediumStyle(
                        fontColor: ColorManager.black, fontSize: FontSize.s14),
                  )),
                  Icon(
                    choice['icon'],
                    color: choice['color'],
                  )
                ],
              ),
            );
          }).toList();
        });
  }
}
