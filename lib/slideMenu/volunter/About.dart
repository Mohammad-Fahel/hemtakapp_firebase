import 'dart:ui';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:hemtak_app/slideMenu/volunter/Setting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

const url_f = 'https://www.facebook.'
    'com/MoYJordan';
const url_t = 'https://twitter.com/MoY_JO'
    '?ref_src=twsrc%5Etfw%7Ctwcamp'
    '%5Eembeddedtimeline%'
    '7Ctwterm%5Eprofile%3AM'
    'oY_JO&ref_url=http%3A%'
    '2F%2Fmoy.gov.jo%2F';
const url_y = 'https://www.youtube.com/chann'
    'el/UCI7EQEFVNTuXzo1nk2Ey-ng';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

_launchURL(String a) async {
  if (await canLaunch(a)) {
    await launch(a);
  } else {
    throw 'Could not launch $a';
  }
}

Widget _GestureDetector(String path, String url) {
  return GestureDetector(
    onTap: () {
      _launchURL(url);
    },
    child: CircleAvatar(
      radius: 35.0,
      backgroundImage: ExactAssetImage(path),
      backgroundColor: Colors.transparent,
    ),
  );
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePageVolunteer())),
        ),
        centerTitle: true,
        title: Text("عن التطبيق",
            style: TextStyle(color: Colors.white, fontSize: 23)),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/hemtak.png",
                ),
                backgroundColor: Colors.transparent,
                radius: 100.0,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "يقوم تطبيق همتك على تعزيز الروح الريادية "
                  " لدى الشباب الأردني وذلك عن طريق إجراء "
                  "فعاليات ريادية في مجالات عدة، بهدف دعم "
                  "أصحاب المشاريع الناشئة والأفكار المبتكرة.",
              style: TextStyle(
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 70),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _GestureDetector('assets/logos/facebook.jpg', url_f),
                  _GestureDetector('assets/logos/twitter3.jpg', url_t),
                  _GestureDetector('assets/logos/youtube2.png', url_y),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
