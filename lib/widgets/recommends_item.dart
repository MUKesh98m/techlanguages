import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/color.dart';
import '../utils/data.dart';

class recommends_item extends StatelessWidget {
  const recommends_item({
    Key? key,
    required this.data,
    this.onTab,
  }) : super(key: key);
  final data;
  final GestureTapCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1))
            ]),
        child: Row(children: [
          Container(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                imageUrl: data['image']),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data['price'],
                maxLines: 1,
                style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  getAttributes(data['session'],
                      Icons.play_circle_outline, labelColor),
                  SizedBox(
                    width: 10,
                  ),
                  getAttributes(data['duration'],
                      Icons.schedule_outlined, labelColor),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget getAttributes(String info, IconData icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: color,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          style: TextStyle(color: labelColor, fontSize: 13),
        )
      ],
    );
  }
}