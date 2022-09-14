import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../api.dart';
import '../themes/color.dart';

class see_all extends StatelessWidget {
  const see_all({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Features Products")),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: getfeatures(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Shimmer.fromColors(
                    baseColor: HexColor('#E0E0E0'),
                    highlightColor: HexColor('#F5F5F5'),
                    child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      itemCount: 10,
                    ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 10, top: 15, end: 10),
                          child: Card(
                              elevation: 20,
                              child: Container(
                                height: 100,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                            radius: 30,
                                            child: Lottie.network(
                                                snapshot.data[i].image)),
                                        title: Text(snapshot.data[i].name),
                                        subtitle: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.play_circle_outline,
                                                  color: labelColor,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                    snapshot.data[i].session +
                                                        " Lessons",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text("\$"),
                                                SizedBox(
                                                  width: 1,
                                                ),
                                                Text(snapshot.data[i].price,
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        trailing: InkWell(
                                            onTap: () {},
                                            child: SizedBox(
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.red,
                                                highlightColor: Colors.yellow,
                                                child: Text(
                                                  'See detail',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )),
                                      )
                                    ]),
                              )));
                    });
              }
            },
          ),
        ));
  }
}