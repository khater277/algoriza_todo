import 'package:algoriza_todo/cubit/app_states.dart';
import 'package:algoriza_todo/models/TaskModel.dart';
import 'package:algoriza_todo/services/local_db/sqflite_helper.dart';
import 'package:algoriza_todo/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void openDB()async{
    emit(AppOpenDBLoadingState());
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    // await deleteDatabase(path);
    openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) {
          db.execute('CREATE TABLE Task (id TEXT PRIMARY KEY, title TEXT, date TEXT, startTime TEXT, endTime TEXT, reminder TEXT, repeat TEXT, completed BOOLEAN, favorite BOOLEAN)');
        })
    .then((value){
      database = value;
      getTasks();
    }).catchError((error){
      printError("openDB", error.toString());
      emit(AppErrorState());
    });
  }

  void addTask({required TaskModel task}){
    SqfLiteHelper.insertTask(task: task).then((value){
      print("ADDED");
      getTasks();
    }).catchError((error){
      printError("addTask", error.toString());
      emit(AppErrorState());
    });
  }

  List<TaskModel> tasks = [];
  void getTasks(){
    SqfLiteHelper.getTasks().then((value){
      for (var element in value) {
        TaskModel task = TaskModel.fromJson(element);
        tasks.add(task);
      }
      print("Get Completed ====> ${tasks.length}");
      emit(AppGetTasksState());
    }).catchError((error){
      printError("getTasks", error.toString());
      emit(AppErrorState());
    });
  }
  
}