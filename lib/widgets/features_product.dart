import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../api.dart';
import '../themes/color.dart';
import 'features_model.dart';

class features_product extends StatefulWidget {
  const features_product({Key? key}) : super(key: key);

  @override
  State<features_product> createState() => _features_productState();
}

class _features_productState extends State<features_product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 350,
          width: 270,
          padding: EdgeInsets.only(top: 50),
          child: FutureBuilder(
            future: getfeatures(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_suvqt7by.json',
                    height: 200,
                    width: 200);
              } else {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        child: Container(
                          height: 500,
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
                              child: Card(
                                  color: Colors.white60,
                                  child:
                                      Lottie.network(snapshot.data[i].image)),
                            ),
                            Positioned(
                                top: 170,
                                right: 15,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                      "\$" + snapshot.data[i].price + ".00",
                                      style: TextStyle(color: Colors.white)),
                                )),
                          ]),
                        ),
                      );
                    });
              }
            },
          )),
    );
  }
}