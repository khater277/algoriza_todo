import 'package:algoriza_todo/models/task_model.dart';
import 'package:algoriza_todo/presentation/screens/board/components/board_task.dart';
import 'package:algoriza_todo/shared/widgets/no_items_founded.dart';
import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  final List<TaskModel> tasks;
  const TabContent({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20)
          .add(const EdgeInsets.only(left: 20)),
      child: tasks.isNotEmpty
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return BoardTask(
                  task: tasks[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: tasks.length)
          : const NoItemsFounded(),
    );
  }
}
