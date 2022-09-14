import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techlanguages/api_var.dart';

import '../api_var.dart';

class features_model extends StatelessWidget {
  features_model({Key? key, required this.image, required this.name})
      : super(key: key);
  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: Text(name),
              ),
              Container(
                  height: 200, width: 200, child: SvgPicture.network(image)),
            ],
          ),
        ));
  }
}