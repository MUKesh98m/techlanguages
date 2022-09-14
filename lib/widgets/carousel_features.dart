import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../api.dart';
import '../themes/color.dart';

class carousel_slider extends StatelessWidget {
  const carousel_slider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsetsDirectional.only(top: 100),
      child: FutureBuilder(
        future: getfeatures(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_suvqt7by.json',
            );
          } else {
            return CarouselSlider(
              items: [
                for (var i = 0; i < snapshot.data.length; i++)
                  Container(
                    height: 200,
                    width: 200,
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
                        child: Card(
                            color: Colors.white60,
                            child: Lottie.network(snapshot.data[i].image)),
                      ),
                      Positioned(
                          top: 170,
                          right: 15,
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("\$" + snapshot.data[i].price,
                                style: TextStyle(color: Colors.white)),
                          )),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 270,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data[i].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: labelColor,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                          snapshot.data[i].session + " Lessons",
                                          style: TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.schedule_outlined,
                                        color: labelColor,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(snapshot.data[i].duration +
                                          " duration"),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(snapshot.data[i].review),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
              ],
              options: CarouselOptions(
                  height: 320,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: 0.9,
                  autoPlay: true),
            );
          }
        },
      ),
    ));
  }
}