import 'package:flutter/material.dart';

class DateTimeFormatter{

  static const Map<String,String> _period={
    '00':'12', '01':'1', '02':'2', '03':'3',
    '04':'4','05':'5', '06':'6','07':'7',
    '08':'8','09':'9', '10':'10','11':'11',
    '12':'12', '13':'1', '14':'2', '15':'3',
    '16':'4','17':'5', '18':'6','19':'7',
    '20':'8','21':'9', '22':'10','23':'11',
  };

  static String taskDate(DateTime dateTime){
    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;
    return "$day-$month-$year";
  }

  static String taskTime(TimeOfDay time){

    int min= time.minute;
    int hour= time.hour;

    String x="";
    if(hour<12){
      x = "AM";
    }else{
      x = "PM";
    }
    return "$hour:$min $x";
  }


}