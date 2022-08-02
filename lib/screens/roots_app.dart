import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techlanguages/screens/home.dart';
import 'package:techlanguages/widgets/bottom_bar.dart';

import '../themes/color.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int activeTab = 0;
  List barItems = [
    {
      "icon": "assets/icons/home.svg",
      "active_icon": "assets/icons/home.svg",
      "page": homepage(),
    },
    {
      "icon": "assets/icons/search.svg",
      "active_icon": "assets/icons/search.svg",
      "page": Container(child: Center(child: Text("search"))),
    },
    {
      "icon": "assets/icons/play.svg",
      "active_icon": "assets/icons/play.svg",
      "page": Container(child: Center(child: Text("play Course"))),
    },
    {
      "icon": "assets/icons/chat.svg",
      "active_icon": "assets/icons/chat.svg",
      "page": Container(
        child: Center(child: Text("Chating")),
      ),
    },
    {
      "icon": "assets/icons/profile.svg",
      "active_icon": "assets/icons/profile.svg",
      "page": Container(child: Center(child: Text("profile"))),
    },
  ];

  void onPageChanged(int index) {
    setState(() {
      activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        bottomNavigationBar: getBottomBar(),
        body: getBarPage());
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children:
            List.generate(barItems.length, (index) => barItems[index]["page"]));
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1))
          ]),
      child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 15,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  barItems.length,
                  (index) => BottomBarItem(
                        barItems[index]["icon"],
                        isActive: activeTab == index,
                        activeColor: primary,
                        onTap: () {
                          onPageChanged(index);
                        },
                      )))),
    );
  }
}