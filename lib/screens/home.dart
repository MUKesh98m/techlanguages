import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techlanguages/themes/color.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: getappbar(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }

  AppBar getappbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mukesh",
                  style: TextStyle(color: labelColor, fontSize: 14),
                ),
                Text(
                  "Good Morning!",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appBarColor,
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                "assets/icons/bell.svg",
              ),
            )
          ],
        ),
      ),
    );
  }
}