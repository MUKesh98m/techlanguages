import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:techlanguages/widgets/features_model.dart';

import '../api.dart';

class product_model extends StatelessWidget {
  const product_model({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: FutureBuilder(
          future: getadata(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Text("data");
            } else {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Card(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      // var snackBar = SnackBar(
                                      //   elevation: 0,
                                      //   behavior: SnackBarBehavior.floating,
                                      //   backgroundColor: Colors.transparent,
                                      //   content: AwesomeSnackbarContent(
                                      //     title: 'Thank Tou User!',
                                      //     message: snapshot.data[i].name,
                                      //     contentType: ContentType.success,
                                      //   ),
                                      // );
                                      //
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(snackBar);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  features_model(
                                                    name: snapshot.data[i].name,
                                                    image:
                                                        snapshot.data[i].image,
                                                  )));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      height: 50,
                                      width: 50,
                                      child: SvgPicture.network(
                                          snapshot.data[i].image),
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(snapshot.data[i].name),
                              )
                            ],
                          )
                        ]);
                  });
            }
          },
        ));
  }
}