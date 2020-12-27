import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hemtak_app/HomePage/HomePageOfPartner.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';

//import 'SuggestList.dart';
import 'suggestEvent.dart';

bool showicon = false;
String Subject = 'عنوان الفعالية الريادية:';
String Date = 'تاريخ الفعالية الريادية:';

class Suggest extends StatefulWidget {
  @override
  _SuggestState createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {
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

  /* Container buildlist(bool bg) {
    if (bg) {
      return new Container(
        child: Listcard(),
      );
    } else {
      return new Container(
        child: Text(''),
      );
    }
  }*/

  _icon(BuildContext context, bool show) {
    if (show == true) {
      return IconButton(
        icon: Icon(
          Icons.arrow_drop_down,
          size: 40,
        ),
        onPressed: () {
          setState(() {
            showicon = false;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.arrow_drop_up,
          size: 40,
        ),
        onPressed: () {
          setState(() {
            showicon = true;
          });
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add,size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuggestEvent()),
            );
          }),
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
          "اقتراح فعالية ريادية جديدة",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.add,
          //     size: 30,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => SuggestEvent()),
          //     );
          //   },
          // ),
        ],
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
                    'الفعاليات الريادية المقبولة مسبقًا:',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Image.asset(
                    'assets/images/Hands.png',
                    height: 30.0,
                    width: 30.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(' $Subject '),
                          ),
                          SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text('$Date'),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
