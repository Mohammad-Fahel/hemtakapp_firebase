import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'Changepassword.dart';

class CodeRedeeming extends StatefulWidget {
  @override
  _CodeRedeemingState createState() => _CodeRedeemingState();
}

_CheckPinOk(BuildContext context) {
  VoidCallback continueCallBack = () => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };

  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          title: Center(child: Text('تم قبول الرمز',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.green[800],

          ),)),
content: Image.asset("assets/logos/Ok.png",
height: 100.0,
width: 100.0,),
        );
      });
}
_CheckPinNo(BuildContext context) {
  VoidCallback continueCallBack = () => {
    Navigator.of(context).pop(),
    // code on continue comes here
  };

  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          title: Center(child: Text('تأكد من صحة الرمز',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.red,

            ),)),
          content: Image.asset("assets/logos/No.png",
            height: 100.0,
            width: 100.0,),
        );
      });
}



final String requiredNumber = '';
String pin = '';

class _CodeRedeemingState extends State<CodeRedeeming> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
            onPressed: () =>  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePageVolunteer())),
        ),
        centerTitle: true,
        title:
            Text(
              "تحصيل نقاط",
                style: TextStyle(color: Colors.white, fontSize: 23)
            ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.0),
              Text(
                'اكتب الرمز هنا للحصول على نقاطك',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold, // light
                ),
              ),
              SizedBox(height: 30.0),
              PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6,
                onChanged: (value) {
                  pin = value;
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveColor: Colors.black,
                  activeColor: Colors.red,
                  selectedColor: Colors.green,
                ),
                onCompleted: (value) {
                  if (value == requiredNumber) {
                  } else {}
                },
              ),
              Divider(
                height: 30.0,
                thickness: 2,
                color: Colors.black54,
              ),
              GestureDetector(
                onTap: () {
                  _CheckPinNo(context);
                },
                child: Container(
                  margin: EdgeInsets.all(60.0),
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
                    'تحصيل',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(height: 100.0),
              Text(
                'يرجى عدم مشاركة الرمز الخاص بك مع أحد آخر.*',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
