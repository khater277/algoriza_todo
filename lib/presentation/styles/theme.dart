import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeManager{
  static ThemeData lightTheme = ThemeData(
      primarySwatch: ColorManager.generateMaterialColor(Colors.black87),
      scaffoldBackgroundColor: Colors.white,

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[500],
      )
  );
}