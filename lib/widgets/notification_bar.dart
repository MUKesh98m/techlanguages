import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/color.dart';

class notification_bar extends StatelessWidget {
  const notification_bar({Key? key, this.notificationnumber = 0})
      : super(key: key);

  final int notificationnumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      height: 30,
      width: 30,
      child: notificationnumber > 0
          ? Badge(
              badgeColor: primary,
              position: BadgePosition(top: -7, end: 0),
              badgeContent: Text(''),
              padding: EdgeInsets.all(3),
              child: SvgPicture.asset(
                "assets/icons/bell.svg",
                height: 20,
                width: 20,
              ),
            )
          : SvgPicture.asset(
              "assets/icons/bell.svg",
              height: 20,
              width: 20,
            ),
    );
  }
}