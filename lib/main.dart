import 'package:flutter/material.dart';
import 'package:quiz_task/Home_Screen.dart';
import 'package:quiz_task/Quiz.dart';
import 'package:quiz_task/result.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: HomeScreen(),
            getPages: [
              GetPage(name: '/HomeScreen', page:()=> HomeScreen()),
              GetPage(name: '/QuizScreen',page: ()=>QuizScreen()),
              GetPage(name: '/ResultScreen',page: ()=>Result()),
            ],
            );
          }
    );
  }
}
