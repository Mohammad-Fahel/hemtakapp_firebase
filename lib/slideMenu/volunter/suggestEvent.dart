import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:hemtak_app/slideMenu/volunter/Suggest.dart';
import 'package:ndialog/ndialog.dart';

class SuggestEvent extends StatefulWidget {
  @override
  _SuggestEventState createState() => _SuggestEventState();
}

class _SuggestEventState extends State<SuggestEvent> {
  @override

  Widget _buildWidgetTF(String nameOfWidget, IconData icon) {
    return Container(
        padding: EdgeInsetsDirectional.only(start: 10),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        height: 60,
        width: 375,
        child: TextField(
            textAlign: TextAlign.right,
            obscureText: false,
            decoration: InputDecoration(
                icon: Icon(icon, color: Colors.black38),
                border: InputBorder.none,
                hintText: nameOfWidget)));
  }

  Widget _submitBtn() {
    return FlatButton(
      child: Container(
        width: 375,
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfff44336), Color(0xffe57373)])),
        child: Text(
          'تقديم الطلب',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      onPressed: () {
        NAlertDialog(
          title: Text(
            "تم إرسال النموذج بنجاح",
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text("سيتم إعلامك حال الموافقة على الطلب",
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.w300)),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePageVolunteer())),
              child: Text("موافق", style: TextStyle(color: Colors.redAccent)),
            ),
          ],
          blur: 2,
        ).show(context);
      },
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
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        title: Text(
          "نموذج اقتراح فعالية ريادية جديدة",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30.0),
                  _buildWidgetTF("اسم/عنوان الفعالية الريادية", Icons.title),
                  SizedBox(height: 10),
                  _buildWidgetTF("اسم رئيس الفعالية الريادية", Icons.person),
                  SizedBox(height: 10),
                  _buildWidgetTF("الرقم الوطني", Icons.featured_video),
                  SizedBox(height: 10),
                  _buildWidgetTF("عدد المشاركات الريادية المتوقعة", Icons.people),
                  SizedBox(height: 10),
                  _buildWidgetTF("وصف مختصر للفعالية الريادية", Icons.description),
                  SizedBox(height: 30),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Suggest()),
                        );
                      },
                      child: _submitBtn()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
