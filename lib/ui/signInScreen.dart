import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:hemtak_app/services/auth.dart';
import 'package:hemtak_app/services/loading.dart';
import 'package:hemtak_app/ui/welcomePage.dart';
import 'package:ndialog/ndialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignInVolunteer extends StatefulWidget {
  @override
  _SignInVolunteerState createState() => _SignInVolunteerState();
}

class _SignInVolunteerState extends State<SignInVolunteer> {
  void initState() {
    super.initState();
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  Widget _backButton() {
    return InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => WelcomePage()));
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

  Widget _buildInfoTF() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
                padding: EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none,
                    hintText: "عنوان البريد الإلكتروني",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 2)),
                  ),
                )),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsetsDirectional.only(start: 20, end: 20),
              child: TextFormField(
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: true,
                style: TextStyle(color: Colors.black, fontFamily: "OpenSans"),
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
                ),
              ),
            )
          ],
        ));
  }

  //
  // Widget _buildPassowrdTF() {
  //   return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       textDirection: TextDirection.rtl,
  //       children: [
  //         // Text("كلمة المرور", style: TextStyle(fontWeight: FontWeight.bold)),
  //         // SizedBox(height: 7.5),
  //         Form(
  //           key: _formkey,
  //           child:
  //         )
  //
  //       ]);
  // }

  Widget _forgotPasswordField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 375,
      alignment: Alignment.centerRight,
      child: TextButton(
          child: Text('هل نسيت كلمة المرور؟',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          onPressed: () => NAlertDialog(
                title: Text(
                  "استعادة كلمة المرور",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.redAccent),
                    ),
                    hintText: "ادخل عنوان البريد الاكتروني",
                    labelText: 'عنوان البريد الاكتروني',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => SignInVolunteer())),
                    child: Text("موافق",
                        style: TextStyle(color: Colors.redAccent)),
                  ),
                ],
                blur: 2,
              ).show(context)),
    );
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
            'تسجيل الدخول',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() => loading = true);
            dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                loading = false;
                error = 'Could not sign in with those credentials';
                _showAlertDialogError();
              });
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageVolunteer()));
            }
          }
        });
  }

  Widget _showAlertDialogError() {
    Widget okButton = FlatButton(
      child: Text("تم",style: TextStyle(color: Colors.redAccent)),
      onPressed: () => Navigator.pop(context),
    );
    AlertDialog alert = AlertDialog(
      title: Text("حاول مرة أخرى",style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text("نعتذز منك، لم نتمكن من تسجيل الدخول",style: TextStyle(fontWeight: FontWeight.w300)),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
          ),
          Text('أو', style: TextStyle(color: Colors.white)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6)
                ],
                image: DecorationImage(image: logo))));
  }

  Widget _buildSocialBtnRow() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildSocialBtn(() => print("Login with Facebook"),
              AssetImage("assets/logos/facebook.jpg")),
          _buildSocialBtn(() => print("Login with Google"),
              AssetImage("assets/logos/google.jpg")),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
            child: Stack(
              children: <Widget>[
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Image.asset(
                                "assets/images/hemtak.png",
                                height: 175,
                                width: 175,
                              ),
                              SizedBox(height: 60),
                              _buildInfoTF(),
                              // _buildPassowrdTF(),
                              _forgotPasswordField(),
                              // _emailPasswordWidget(),
                              SizedBox(height: 20),

                              _submitBtn(),
                              _divider(),
                              _buildSocialBtnRow(),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          ));
  }
}
