// import 'package:async/async.dart';
import 'package:algoriza_todo/models/task_model.dart';
import 'package:algoriza_todo/services/local_db/sqflite_constants.dart';
import 'package:algoriza_todo/shared/constants.dart';

class SqfLiteHelper {
  static Future<void> insertTask({required TaskModel task}) async {
    return await database!.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO Task(${SqfLiteConstants.id}, ${SqfLiteConstants.title}, ${SqfLiteConstants.completeDate}, ${SqfLiteConstants.date}, ${SqfLiteConstants.startTime}, ${SqfLiteConstants.endTime}, ${SqfLiteConstants.reminder}, ${SqfLiteConstants.completed}, ${SqfLiteConstants.favorite}, ${SqfLiteConstants.color})'
          ' VALUES("${task.id}", "${task.title}", "${task.completeDate}", "${task.date}", "${task.startTime}", "${task.endTime}", "${task.reminder}", ${task.completed}, ${task.favorite}, ${task.color})');
    });
  }

  static Future<List<Map<String, Object?>>> getTasks() async {
    return await database!.rawQuery('SELECT * FROM Task');
  }

  static Future<int> updateTask({
    required String id,
    required String field,
    required bool value,
  }) async {
    return await database!
        .rawUpdate('UPDATE Task SET $field = ? WHERE id = ?', [value, id]);
  }

  static Future<int> deleteTask({
    required String id,
  }) async {
    return await database!.rawDelete('DELETE FROM Task WHERE id = ?', [id]);
  }
}
