import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Round Image with Button"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1663577142~exp=1663577742~hmac=ab769f2e20868bd4f4b21b506e42b4463dc16332d4c97fd482d8e166a3cc0d9d"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Mukesh Mahajan  ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            Text("Software developer"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.github),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                  label: Text(
                    "GitHub",
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.linkedin),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                  label: Text(
                    "LinkedIn",
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.twitter),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                  label: Text(
                    "Twitter",
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                  label: Text(
                    "Facebook",
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}