import 'package:algoriza_todo/cubit/app_states.dart';
import 'package:algoriza_todo/models/task_model.dart';
import 'package:algoriza_todo/services/local_db/sqflite_constants.dart';
import 'package:algoriza_todo/services/local_db/sqflite_helper.dart';
import 'package:algoriza_todo/services/notifications/notification_helper.dart';
import 'package:algoriza_todo/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void openDB() async {
    emit(AppOpenDBLoadingState());
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    // await deleteDatabase(path);
    openDatabase(path, version: 1, onCreate: (Database db, int version) {
      db.execute(
          'CREATE TABLE Task (${SqfLiteConstants.id} TEXT PRIMARY KEY, ${SqfLiteConstants.title} TEXT, ${SqfLiteConstants.completeDate} TEXT, ${SqfLiteConstants.date} TEXT, ${SqfLiteConstants.startTime} TEXT, ${SqfLiteConstants.endTime} TEXT, ${SqfLiteConstants.reminder} TEXT, ${SqfLiteConstants.completed} BOOLEAN, ${SqfLiteConstants.favorite} BOOLEAN, ${SqfLiteConstants.color} INTEGER)');
    }).then((value) {
      print("CREATED");
      database = value;
      getTasks();
    }).catchError((error) {
      printError("openDB", error.toString());
      emit(AppErrorState());
    });
  }

  void addTask({
    required BuildContext context,
    required TaskModel task,
  }) {
    setNotification(
        context: context,
        date: DateTime.parse(task.completeDate!)
            .subtract(Duration(minutes: reminderDuration)));
    SqfLiteHelper.insertTask(task: task).then((value) {
      debugPrint("ADDED");
      reminderDuration = 0;
      getTasks();
    }).catchError((error) {
      printError("addTask", error.toString());
      emit(AppErrorState());
    });
  }

  void setNotification(
      {required BuildContext context, required DateTime date}) {
    if (date.isAfter(DateTime.now())) {
      int id = (DateTime.now().millisecondsSinceEpoch / 1000).floor();
      NotificationsHelper.zonedScheduleNotification(
              context: context, date: date, id: id)
          .then((value) => debugPrint("NOTIFICATION ADDED at $date"))
          .catchError((error) {
        printError("ADD NOTIFICATION", error.toString());
        emit(AppErrorState());
      });
    }
  }

  List<TaskModel> allTasks = [];
  List<Map<String, dynamic>> tasks = [
    {'title': 'All', 'list': <TaskModel>[]},
    {'title': 'Completed', 'list': <TaskModel>[]},
    {'title': 'Uncompleted', 'list': <TaskModel>[]},
    {'title': 'Favorite', 'list': <TaskModel>[]},
  ];
  void getTasks() {
    SqfLiteHelper.getTasks().then((value) {
      allTasks = [];
      for (var element in value) {
        TaskModel task = TaskModel.fromJson(element);
        allTasks.add(task);
      }
      allTasks.sort((a, b) => a.completeDate!.compareTo(b.completeDate!));
      tasks[0]['list'] = allTasks;
      tasks[1]['list'] = allTasks.where((element) => element.completed == 1);
      tasks[2]['list'] = allTasks.where((element) => element.completed == 0);
      tasks[3]['list'] = allTasks.where((element) => element.favorite == 1);
      debugPrint("Get Completed ====> ${allTasks.length}");
      emit(AppGetTasksState());
    }).catchError((error) {
      printError("getTasks", error.toString());
      emit(AppErrorState());
    });
  }

  void updateTask({
    required String id,
    required String field,
    required bool value,
  }) {
    SqfLiteHelper.updateTask(id: id, field: field, value: value).then((value) {
      debugPrint("DONE");
      getTasks();
    }).catchError((error) {
      printError("updateTask", error.toString());
      emit(AppErrorState());
    });
  }

  void deleteTask({
    required String id,
  }) {
    SqfLiteHelper.deleteTask(id: id).then((value) {
      getTasks();
    }).catchError((error) {
      printError("deleteTask", error.toString());
      emit(AppErrorState());
    });
  }

  int selectedDayIndex = 0;
  void changeSelectedDay({required int index}) {
    selectedDayIndex = index;
    emit(AppChangeSelectedDayIndexState());
  }

  int reminderDuration = 0;
  void changeReminderDuration({required int value}) {
    reminderDuration = value;
    emit(AppChangeReminderDurationState());
  }
}
