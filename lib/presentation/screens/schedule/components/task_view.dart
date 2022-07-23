import 'package:algoriza_todo/models/TaskModel.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/shared/date_time_formatter.dart';
import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  final TaskModel task;
  const TaskView({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color taskColor = Color(task.color!).withOpacity(1.0);
    // TimeOfDay taskTime
    return Card(
      elevation: 0,
      color: taskColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "${task.startTime}",
              style: getBoldStyle(fontColor: ColorManager.white,fontSize: FontSize.s16),
            ),
            SizedBox(height: 5,),
            Text(
              "${task.title}",
              style: getSemiBoldStyle(fontColor: ColorManager.white,fontSize: FontSize.s16),
            ),
          ],
        ),
      ),
    );
  }
}
