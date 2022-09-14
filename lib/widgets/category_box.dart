import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/color.dart';

class category_box extends StatelessWidget {
  const category_box({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: shadowColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1))
              ]),
          child: SvgPicture.asset(
            data['icon'],
            height: 28,
            width: 28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          data['name'],
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.fade,
        )
      ],
    );
  }
} 