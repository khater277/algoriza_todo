import 'package:algoriza_todo/presentation/screens/add_task/add_task_components/drop_down_text_field_with_title.dart';
import 'package:algoriza_todo/presentation/screens/add_task/add_task_components/text_field_with_title.dart';
import 'package:algoriza_todo/presentation/screens/board/board_components/appBar_title.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:algoriza_todo/shared/date_time_formatter.dart';
import 'package:algoriza_todo/shared/widgets/elevated_button.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

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
  final SingleValueDropDownController _remindController = SingleValueDropDownController();
  final SingleValueDropDownController _repeatController = SingleValueDropDownController();

  final List<String> _repeatList = [
    "Daily",
    "Weekly",
    "Monthly"
  ];

  final List<String> _reminderList = [
    "10 minutes early",
    "30 minutes early",
    "1 hour early",
    "2 hour early",
    "1 day early",
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _remindController.dispose();
    _repeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(
              IconBroken.Arrow___Left_2,
              color: ColorManager.black,
              size: 20,
            )),
        title: const AppBarTitle(title: "Add task",size: FontSize.s22,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  // Title text field
                  Expanded(
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
                            onTap: (){
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(const Duration(days: 365))
                              ).then((date){
                                setState(() {
                                  _dateController.text = DateTimeFormatter.taskDate(date!);
                                });
                                // print(value);
                              });
                            },),
                        Row(
                          children: [
                            // Start time text field
                            Expanded(
                              child: TextFieldWithTitle(
                                controller: _startTimeController,
                                title: "Start time",
                                hint: "ex : 10:00AM",
                                isTime: true,
                                readOnly: true,
                                onTap: (){
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                  ).then((time){
                                    setState(() {
                                      _startTimeController.text =
                                      DateTimeFormatter.taskTime(time!);
                                    });
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 20,),
                            // End time text field
                            Expanded(
                              child: TextFieldWithTitle(
                                controller: _endTimeController,
                                title: "End time",
                                hint: "ex : 11:00PM",
                                isTime: true,
                                readOnly: true,
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((time){
                                    setState(() {
                                      _endTimeController.text =
                                          DateTimeFormatter.taskTime(time!);
                                    });
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
                        // Repeat text field
                        DropDownTextFieldWithTitle(
                            controller: _repeatController,
                            list: _repeatList,
                            title: "Repeat",
                            hint: "ex : Daily"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: DefaultElevatedButton(
                        color: ColorManager.green,
                        rounded: 12,
                        height: 45,
                        width: double.infinity,
                        onPressed: (){
                          // navigateTo(context: context, screen: const AddTaskScreen());
                        },
                        child: Text(
                          "Create a task",
                          style: getBoldStyle(fontColor: ColorManager.white,),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
