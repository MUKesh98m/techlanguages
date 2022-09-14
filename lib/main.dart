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
        ),
        home: MyHomePage());
  }
}