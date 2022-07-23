import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/models/TaskModel.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/pop_up_menu.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:flutter/material.dart';

class BoardTask extends StatelessWidget {
  final TaskModel task;
  final int index;
  const BoardTask({Key? key, required this.task, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color taskColor = Color(task.color!).withOpacity(1);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 20,height: 20,
                  decoration: BoxDecoration(
                      color: task.completed==1?taskColor:null,
                      border: Border.all(color: taskColor,width: 0.7),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: task.completed==1?
                  const Icon(
                    Icons.task_alt_sharp,size: 10,
                    color: ColorManager.white,)
                      :
                  const SizedBox(),
                ),
                const SizedBox(width: 20,),
                Text(
                  "${task.title}",
                  style: getMediumStyle(
                      fontColor: ColorManager.black,
                  ),
                ),
              ],
            ),
          ),
          TaskPopupMenu(
              task: task,
              index: index, cubit: AppCubit.get(context))
        ],
      ),
    );
  }
}
