import 'dart:ui';
import 'package:hemtak_app/services/auth.dart';
import 'package:hemtak_app/services/loading.dart';
import 'package:hemtak_app/services/user.dart';
import 'package:hemtak_app/ui/signInScreen.dart';
import 'package:hemtak_app/ui/welcomePage.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

class SignUpVolunteer extends StatefulWidget {
  @override
  _SignUpVolunteerState createState() => _SignUpVolunteerState();
}

class _SignUpVolunteerState extends State<SignUpVolunteer> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  // text field state
  String email = '';
  String password = '';
  String error = '';

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  Widget _backButton() {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 20, top: 5, bottom: 10),
                  child: Icon(Icons.keyboard_arrow_left,
                      color: Colors.redAccent, size: 45))
            ])));
  }

  Widget _buildWidgetTF(String nameOfWidget, IconData icon, bool state) {
    return Form(
        child: Container(
            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
            // alignment: AlignmentDirectional.center,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5)),
            //     boxShadow: <BoxShadow>[
            //       BoxShadow(
            //           color: Color(0xFFFFCDD2).withAlpha(100),
            //           offset: Offset(2, 4),
            //           blurRadius: 8,
            //           spreadRadius: 2)
            //     ],
            //     color: Colors.white),
            child: TextFormField(
                textAlign: TextAlign.right,
                obscureText: state,
                decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintText: nameOfWidget,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2)),
                ))));
  }

  Widget _buildEmailPasswordTF() {
    return Form(
      key: _formKey,
      child: Column(children: [
        Container(
            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
            // alignment: AlignmentDirectional.center,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5)),
            //     boxShadow: <BoxShadow>[
            //       BoxShadow(
            //           color: Color(0xFFFFCDD2).withAlpha(100),
            //           offset: Offset(2, 4),
            //           blurRadius: 8,
            //           spreadRadius: 2)
            //     ],
            //     color: Colors.white),
            // height: 60,
            // width: 375,
            child: TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
                textAlign: TextAlign.right,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "عنوان البريد الالكتروني",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2)),
                ))),
        SizedBox(height: 10),
        Container(
            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
            // alignment: AlignmentDirectional.center,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(5)),
            //     boxShadow: <BoxShadow>[
            //       BoxShadow(
            //           color: Color(0xFFFFCDD2).withAlpha(100),
            //           offset: Offset(2, 4),
            //           blurRadius: 8,
            //           spreadRadius: 2)
            //     ],
            //     color: Colors.white),
            // height: 60,
            // width: 375,
            child: TextFormField(
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                textAlign: TextAlign.right,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "كلمة المرور",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2)),
                )))
      ]),
    );
  }

  Widget _submitBtn() {
    return FlatButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            dynamic result =
                await _auth.registerWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                error = 'Please supply a valid email';
                loading = false;
              });
            } else {
              NAlertDialog(
                title: Text(
                  "تم إنشاء حسابك بنجاح",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Text("هل تود تسجيل الدخول؟",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w300)),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => SignInVolunteer())),
                    child: Text("موافق",
                        style: TextStyle(color: Colors.redAccent)),
                  ),
                  FlatButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => WelcomePage())),
                      child: Text("إلغاء",
                          style: TextStyle(color: Colors.redAccent))),
                ],
                blur: 2,
              ).show(context);
            }
          }
        },
        child: Column(children: [
          Container(
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
              'اشترك الآن',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            error,
            style: TextStyle(color: Colors.red, fontSize: 14.0),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    Customer user = Provider.of<Customer>(context);

    return Scaffold(
        body: Container(
            alignment: AlignmentDirectional.center,
            child: Stack(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/jordan.jpeg"),
                          fit: BoxFit.fill)),
                  child: ClipRRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 6.5, sigmaX: 6.5),
                          child: SingleChildScrollView(
                              child: Column(children: <Widget>[
                            SizedBox(height: 20),
                            Image.asset(
                              "assets/images/hemtak.png",
                              height: 175,
                              width: 175,
                            ),
                            SizedBox(height: 60),
                            _buildWidgetTF(
                                "الاسم الرباعي", Icons.person, false),
                            SizedBox(height: 10),
                            _buildWidgetTF("الرقم الوطني",
                                Icons.credit_card_rounded, false),
                            SizedBox(height: 10),
                            _buildWidgetTF(
                                "مكان الإقامة", Icons.location_on, false),
                            SizedBox(height: 10),
                            _buildWidgetTF("رقم الجوال", Icons.phone, false),
                            SizedBox(height: 10),
                            _buildEmailPasswordTF(),
                            SizedBox(height: 10),
                            _buildWidgetTF(
                                "تأكيد كلمة المرور", Icons.vpn_key, true),
                            SizedBox(height: 40),
                            _submitBtn(),
                            SizedBox(height: 20),
                          ]))))),
              Positioned(top: 40, left: 0, child: _backButton()),
            ])));
  }
}
