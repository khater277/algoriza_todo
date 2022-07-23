import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:flutter/material.dart';

class WeeklyCalender extends StatelessWidget {
  final List<String> days;
  const WeeklyCalender({Key? key, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              color: ColorManager.mediumGrey,
              width: 0.5),
          bottom: BorderSide(
              color: ColorManager.mediumGrey,
              width: 0.5),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: days.map((day){
              int index = days.indexOf(day);
              return DayInCalender(day: day,index: index,);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class DayInCalender extends StatelessWidget {
  final String day;
  final int index;
  const DayInCalender({Key? key, required this.day, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppCubit cubit = AppCubit.get(context);

    return GestureDetector(
      onTap: (){
        cubit.changeSelectedDay(index: index);
      },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
            decoration: BoxDecoration(
              color: cubit.selectedDayIndex==index?ColorManager.green:null,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    day.substring(0,3),
                  style: cubit.selectedDayIndex==index?
                  getSemiBoldStyle(fontColor: ColorManager.white)
                  :
                  getMediumStyle(
                      fontColor: ColorManager.black),
                ),
                const SizedBox(height: 10,),
                Text(
                    "${DateTime.now().add(Duration(days: index)).day}",
                  style: cubit.selectedDayIndex==index?
                  getSemiBoldStyle(fontColor: ColorManager.white)
                      :
                  getMediumStyle(
                      fontColor: ColorManager.black),
                ),
              ],
            )
        )
    );
  }
}
