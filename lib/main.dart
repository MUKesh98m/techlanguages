import 'package:flutter/material.dart';
import 'package:techlanguages/screens/roots_app.dart';
import 'package:techlanguages/themes/color.dart';

void main() {
  runApp(const MyApp());
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
        ),
        home: RootApp());
  }
}