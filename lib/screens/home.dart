import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:techlanguages/api.dart';
import 'package:techlanguages/screens/explore.dart';
import 'package:techlanguages/screens/profile_page.dart';
import 'package:techlanguages/screens/searchbar.dart';
import 'package:techlanguages/themes/color.dart';
import 'package:techlanguages/utils/data.dart';

import 'package:techlanguages/widgets/notification_bar.dart';
import 'package:techlanguages/widgets/prod.dart';
import 'package:techlanguages/widgets/recommends_item.dart';
import 'package:techlanguages/widgets/se_All.dart';

import '../widgets/category_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  int tabIndex = 0;
  List<Widget>? listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [buildBody(), SearchBar(), profile_page()];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: tabIndex, children: listScreens!),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }

  Widget buildBody() {
    return Scaffold(
      appBar: getappbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // getCategory(),
            product_model(),

            // getFeatures1(),
            menu(),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                var snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'Recommended!',
                    message:
                        'CONNECT WITH FRIENDS.EARN FORTNITE “XANDER” IN-GAME COSMETIC OUTFIT AND OTHER IN-GAME REWARDS!',
                    contentType: ContentType.failure,
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Image.asset("assets/icons/refer.png"),
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                  InkWell(
                    child: Text(
                      "See all",
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                    onTap: () {
                      var snackBar = SnackBar(
                        /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Recommended!',
                          message: 'Recommended Is comming Soon!',

                          /// Recommended Is comming Soon!
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ],
              ),
            ),
            getRecommended(),
          ],
        ),
      ),
    );
  }

  getRecommended() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            recommends.length,
            (index) => Container(
                  margin: EdgeInsets.only(right: 15, bottom: 5),
                  child: recommends_item(
                    data: recommends[index],
                    onTab: () {
                      print(index);
                    },
                  ),
                )),
      ),
    );
  }

  getRecommended1() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            recommends.length,
            (index) => Container(
                  margin: EdgeInsets.only(right: 15, bottom: 5),
                  child: recommends_item(
                    data: recommends[index],
                    onTab: () {
                      print(index);
                    },
                  ),
                )),
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

  // Widget getFeatures() {
  //   return CarouselSlider(
  //       items: List.generate(
  //           features.length,
  //           (index) => Features_item(
  //                 data: features[index],
  //                 onTap: () {
  //                   print(index);
  //                 },
  //               )),
  //       options: CarouselOptions(
  //           height: 290,
  //           enlargeCenterPage: true,
  //           disableCenter: true,
  //           autoPlay: true));
  // }

  Widget getCategory() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              categories.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: category_box(
                      data: categories[index],
                    ),
                  ))),
    );
  }

  AppBar getappbar() {
    return AppBar(
      elevation: 0,
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
            notification_bar(
              notificationnumber: 2,
            )
          ],
        ),
      ),
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 60,
      this.width = 50,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
  }
}

class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(),
      child: FutureBuilder(
        future: getfeatures(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_suvqt7by.json',
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Features",
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        InkWell(
                          child: Text(
                            "See all",
                            style: TextStyle(color: textColor, fontSize: 14),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => see_all(
                                      getApi: getfeatures(),
                                    )));
                          },
                        ),
                      ]),
                ),
                CarouselSlider(
                  items: [
                    for (var i = 0; i < 3; i++)
                      Container(
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
                                elevation: 10,
                                color: Colors.grey[200],
                                child: Lottie.network(snapshot.data[i].image,
                                    height: 300, width: 300)),
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
                                child: Text("\$ " + snapshot.data[i].price,
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
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                              snapshot.data[i].session +
                                                  " Lessons",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey)),
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
                                          Text(
                                              snapshot.data[i].duration +
                                                  " duration",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey)),
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
                                          Text(snapshot.data[i].review,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey)),
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
                      height: 310,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: 0.9,
                      autoPlay: true),
                )
              ],
            );
          }
        },
      ),
    );
  }
}