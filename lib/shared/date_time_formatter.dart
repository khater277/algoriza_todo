import 'package:flutter/material.dart';

class DateTimeFormatter{

  static const Map<int,String> days={
    1:"Monday",
    2:"Tuesday",
    3:"Wednesday",
    4:"Thursday",
    5:"Friday",
    6:"Saturday",
    7:"Sunday",
  };


  static const Map<int,String> cal={
    1 : 'Jan', 2 : 'Feb',
    3 : 'Mar', 4 : 'Apr',
    5 : 'May', 6 : 'Jun',
    7 : 'Jul', 8 : 'Aug',
    9 : 'Sep', 10 : 'Oct',
    11 : 'Nov', 12 : 'Dec',
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

    String stringMin = min<10?"0$min":min.toString();

    String x="";
    if(hour<12){
      x = "AM";
    }else{
      if(hour!=12) {
        hour-=12;
      }
      x = "PM";
    }
    return "${hour==0?"12":hour}:$stringMin $x";
  }

  static String completeDate(DateTime date){
    int day = date.day;
    int month = date.month;
    int year = date.year;

    return "$day ${cal[month]}, $year";
  }

}