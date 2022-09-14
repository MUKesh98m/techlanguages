import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/color.dart';
import '../utils/data.dart';

class Features_item extends StatelessWidget {
  Features_item({Key? key, required this.data, required this.onTap})
      : super(key: key);
  final data;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 290,
        width: 270,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 5, top: 5),
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
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: 190,
            child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                imageUrl: data['image']),
          ),
          Positioned(
              top: 170,
              right: 15,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(20)),
                child:
                    Text(data['price'], style: TextStyle(color: Colors.white)),
              )),
          Positioned(
            top: 210,
            child: Container(
              width: 270,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      getAttributes(data['session'], Icons.play_circle_outline,
                          labelColor),
                      SizedBox(
                        width: 10,
                      ),
                      getAttributes(data['duration'], Icons.schedule_outlined,
                          labelColor),
                      SizedBox(
                        width: 10,
                      ),
                      getAttributes(data['review'], Icons.star, yellow),
                    ],
                  )
                ],
              ),
            ),
          ),
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