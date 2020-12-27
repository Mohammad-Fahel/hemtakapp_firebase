import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hemtak_app/HomePage/HomePageOfPartner.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:hemtak_app/slideMenu/partener/insideEvent.dart';

//import 'SuggestList.dart';
import 'suggestEvent.dart';

bool showicon = false;
String Subject = 'عنوان الفعالية الريادية:';
String Date = 'تاريخ الفعالية الريادية:';

class AcceptableEvents extends StatefulWidget {
  @override
  _AcceptableEventsState createState() => _AcceptableEventsState();
}

class _AcceptableEventsState extends State<AcceptableEvents> {
  @override
  ExpandableController _controller;

  final GlobalKey<AnimatedListState> titleList = GlobalKey();
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void initState() {
    super.initState();
    _controller = ExpandableController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _eventCard() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => InsideEvent())),
      child: Container(
        height: 110,
        width: (MediaQuery.of(context).size.width) - 30,
        child: ListView(
          primary: false,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 4),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                  color: Colors.lightGreen[100]),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/Leadership.jpg",
                    width: 75,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عنوان الفعالية",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "شرح عن محتوى الفعالية",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Container(height: 70, width: 1.0, color: Colors.black),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, size: 20),
                          SizedBox(width: 10),
                          Text("المكان - الحي"),
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.date_range, size: 20),
                          SizedBox(width: 10),
                          Text("تاريخ الفعالية"),
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.access_time_outlined, size: 20),
                          SizedBox(width: 10),
                          Text("توقيت الفعالية"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePagePartner())),
        ),
        centerTitle: true,
        title: Text(
          "الفعاليات الريادية",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              color: Colors.grey[400],
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Text(
                    'الفعاليات الريادية التي تمت الموافقة عليها:',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          _eventCard(),
          SizedBox(height: 5),
          _eventCard(),
          SizedBox(height: 5),
          _eventCard(),
        ],
      ),
    );
  }
}
