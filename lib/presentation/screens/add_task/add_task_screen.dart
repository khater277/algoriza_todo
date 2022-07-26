import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/cubit/app_states.dart';
import 'package:algoriza_todo/models/task_model.dart';
import 'package:algoriza_todo/presentation/screens/add_task/components/drop_down_text_field_with_title.dart';
import 'package:algoriza_todo/presentation/screens/add_task/components/text_field_with_title.dart';
import 'package:algoriza_todo/presentation/screens/board/components/app_bar_title.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:algoriza_todo/shared/date_time_formatter.dart';
import 'package:algoriza_todo/shared/snack_bar.dart';
import 'package:algoriza_todo/shared/widgets/elevated_button.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final SingleValueDropDownController _remindController =
      SingleValueDropDownController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> _reminderList = [
    {
      "text": "10 min before",
      "value": 10,
    },
    {
      "text": "30 min before",
      "value": 30,
    },
    {
      "text": "1 hour before",
      "value": 60,
    },
    {"text": "1 day before", "value": 24 * 60},
  ];

  DateTime? taskDate;
  TimeOfDay? taskStartTime;
  int start = 0;
  int end = 0;

  void _endTimeHandler(TimeOfDay? time) {
    setState(() {
      _endTimeController.text = DateTimeFormatter.taskTime(time!);
      String minutes = time.minute > 10 ? "${time.minute}" : "0${time.minute}";
      String hour = time.hour.toString();
      String s = "$hour$minutes";
      end = int.parse(s);
    });
  }

  void _startTimeHandler(TimeOfDay? time) {
    setState(() {
      _startTimeController.text = DateTimeFormatter.taskTime(time!);
      taskStartTime = time;
      String minutes = time.minute > 10 ? "${time.minute}" : "0${time.minute}";
      String hour = time.hour.toString();
      String s = "$hour$minutes";
      start = int.parse(s);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _remindController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppGetTasksState) {
          _titleController.clear();
          _dateController.clear();
          _startTimeController.clear();
          _endTimeController.clear();
          _remindController.clearDropDown();
          showSnackBar(
            title: "Completed",
            content: "task added successfully",
            color: ColorManager.green,
            fontColor: ColorManager.white,
            icon: IconBroken.Paper_Upload,
          );
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leading: const BackButton(),
            title: const AppBarTitle(
              title: "Add task",
              size: FontSize.s22,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      // Title text field
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFieldWithTitle(
                                  controller: _titleController,
                                  title: "Title",
                                  hint: "ex : algoriza meeting"),
                              // Date text field
                              TextFieldWithTitle(
                                controller: _dateController,
                                title: "Date",
                                hint: "ex : 15-10-2022",
                                readOnly: true,
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(const Duration(days: 365)))
                                      .then((date) {
                                    setState(() {
                                      _dateController.text =
                                          DateTimeFormatter.taskDate(date!);
                                      taskDate = date;
                                    });
                                    // print(value);
                                  });
                                },
                              ),
                              Row(
                                children: [
                                  // Start time text field
                                  Expanded(
                                    child: TextFieldWithTitle(
                                      startTime: start,
                                      endTime: end,
                                      controller: _startTimeController,
                                      title: "Start time",
                                      hint: "ex : 10:00AM",
                                      isTime: true,
                                      readOnly: true,
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((time) {
                                          _startTimeHandler(time);
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  // End time text field
                                  Expanded(
                                    child: TextFieldWithTitle(
                                      startTime: start,
                                      endTime: end,
                                      controller: _endTimeController,
                                      title: "End time",
                                      hint: "ex : 11:00PM",
                                      isTime: true,
                                      readOnly: true,
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((time) {
                                          _endTimeHandler(time);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // Reminder text field
                              DropDownTextFieldWithTitle(
                                  controller: _remindController,
                                  list: _reminderList,
                                  title: "Reminder",
                                  hint: "ex : 10 minutes early"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: DefaultElevatedButton(
                            color: ColorManager.green,
                            rounded: 12,
                            height: 45,
                            width: double.infinity,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                TaskModel task = TaskModel(
                                    id: DateTime.now().toString(),
                                    title: _titleController.text,
                                    date: _dateController.text,
                                    startTime: _startTimeController.text,
                                    endTime: _endTimeController.text,
                                    reminder:
                                        _remindController.dropDownValue!.name,
                                    completed: 0,
                                    favorite: 0,
                                    color: ColorManager.randomColor(),
                                    completeDate: taskDate!
                                        .add(Duration(
                                            hours: taskStartTime!.hour,
                                            minutes: taskStartTime!.minute))
                                        .toString());
                                cubit.addTask(context: context, task: task);
                              }
                            },
                            child: Text(
                              "Create a task",
                              style: getBoldStyle(
                                fontColor: ColorManager.white,
                              ),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
