import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';


Database? database;

void printError(String? funName,String? error){
  debugPrint("error in $funName ====> $error");
}