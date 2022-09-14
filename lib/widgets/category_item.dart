import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/color.dart';

class category_item extends StatelessWidget {
  category_item(
      {Key? key,
      required this.data,
      this.activeColor = Colors.white,
      this.bgColor = Colors.white,
      this.isActive = false})
      : super(key: key);
  final data;
  final Color activeColor;
  final Color bgColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: isActive ? activeColor : bgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(.05),
                spreadRadius: .5,
                blurRadius: .5,
                offset: Offset(1, 1))
          ]),
      child: Row(children: [
        SvgPicture.asset(data["icon"],
            width: 16, height: 16, color: isActive ? Colors.white : darker),
        SizedBox(
          width: 5,
        ),
        Text(
          data["name"],
          style: TextStyle(color: isActive ? Colors.white : darker),
        )
      ]),
    );
  }
}