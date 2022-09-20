import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:techlanguages/screens/home.dart';
import 'package:techlanguages/themes/color.dart';
import 'package:techlanguages/widgets/features_model.dart';
import 'package:techlanguages/widgets/features_product.dart';
import 'package:techlanguages/widgets/prod.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: appBgColor,
            primaryColor: Colors.white,
            backgroundColor: Colors.white),
        home: AnimatedSplashScreen(
          splash: Column(
            children: [
              Row(children: [
                Image.asset(
                  'assets/icons/category/splash.png',
                  height: 130,
                  width: 130,
                ),
                SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ProCourse",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Learn today – Lead tomorrow.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ]),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          nextScreen: MyHomePage(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.black,
          splashIconSize: 200,
        ));
  }
}