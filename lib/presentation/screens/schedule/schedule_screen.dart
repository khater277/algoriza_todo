import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/cubit/app_states.dart';
import 'package:algoriza_todo/models/task_model.dart';
import 'package:algoriza_todo/presentation/screens/board/components/app_bar_title.dart';
import 'package:algoriza_todo/presentation/screens/schedule/components/task_view.dart';
import 'package:algoriza_todo/presentation/screens/schedule/components/weekly_calender.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/shared/date_time_formatter.dart';
import 'package:algoriza_todo/shared/widgets/no_items_founded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> days = [];
    for (int i = 0; i < 7; i++) {
      int day = DateTime.now().add(Duration(days: i)).weekday;
      days.add(DateTimeFormatter.days[day]!);
      // days.add(DateTimeFormatter.days[day]!);
    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        List<TaskModel> allTasks = cubit.tasks[0]['list'];
        String selectedDayDate = DateTimeFormatter.taskDate(
            DateTime.now().add(Duration(days: cubit.selectedDayIndex)));
        List<TaskModel> viewedTasks = allTasks
            .where((element) => element.date == selectedDayDate)
            .toList();
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leading: const BackButton(),
            title: const AppBarTitle(
              title: "Schedule",
              size: FontSize.s22,
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              WeeklyCalender(days: days),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            days[cubit.selectedDayIndex],
                            style: getSemiBoldStyle(
                                fontColor: ColorManager.black,
                                fontSize: FontSize.s16),
                          ),
                          Text(
                            DateTimeFormatter.completeDate(DateTime.now()
                                .add(Duration(days: cubit.selectedDayIndex))),
                            style: getMediumStyle(
                                fontColor: ColorManager.black,
                                fontSize: FontSize.s14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: viewedTasks.isNotEmpty
                              ? ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return TaskView(task: viewedTasks[index]);
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 5,
                                      ),
                                  itemCount: viewedTasks.length)
                              : const NoItemsFounded()),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
