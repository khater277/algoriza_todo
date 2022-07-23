// import 'package:async/async.dart';
import 'package:algoriza_todo/models/TaskModel.dart';
import 'package:algoriza_todo/shared/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteHelper{

  static Future<void> insertTask({required TaskModel task}) async{
    return await database!.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO Task(id, title, date, startTime, endTime, reminder, completed, favorite, color)'
              ' VALUES("${task.id}", "${task.title}", "${task.date}", "${task.startTime}", "${task.endTime}", "${task.reminder}", ${task.completed}, ${task.favorite}, ${task.color})'
      );
    });
  }

  static Future<List<Map<String, Object?>>> getTasks() async{
    return await database!.rawQuery('SELECT * FROM Task');
  }


}