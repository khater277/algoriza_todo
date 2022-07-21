import 'package:algoriza_todo/presentation/screens/home/home_screen.dart';
import 'package:algoriza_todo/presentation/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      home: const HomeScreen(),
    );
  }
}
