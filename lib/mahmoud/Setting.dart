import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:hemtak_app/mahmoud/ChangeEmail.dart';
import 'package:hemtak_app/mahmoud/ChangePhone.dart';
import 'package:hemtak_app/mahmoud/Changepassword.dart';
import 'package:hemtak_app/mahmoud/ChangeLocation.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

TextEditingController emailController = new TextEditingController();

_Changepassword(BuildContext context) {
  VoidCallback continueCallBack = () => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };
  Changepassword alert = Changepassword("تغيير كلمة المرور", continueCallBack);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_ChangeEmail(BuildContext context) {
  VoidCallback continueCallBack = () => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };
  ChangeEmail alert = ChangeEmail("تغيير البريد الإلكتروني", continueCallBack);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_ChangePhone(BuildContext context) {
  VoidCallback continueCallBack = () => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };
  ChangePhone alert = ChangePhone("تغيير رقم الهاتف", continueCallBack);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_ChangeLocation(BuildContext context) {
  VoidCallback continueCallBack = () => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };
  ChangeLocation alert = ChangeLocation("تغيير مكان السكن", continueCallBack);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _SettingState extends State<Setting> {
  @override
  bool pressAttentionnight = false;
  bool pressAttentionalert = false;

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
        title: Text("الإعدادات",
            style: TextStyle(color: Colors.white, fontSize: 23)),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 15,left: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'الوضع الليلي',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                RaisedButton(
                    child: Icon(
                      Icons.nights_stay,
                      size: 30.0,
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: pressAttentionnight ? Colors.grey : Colors.redAccent,
                    onPressed: () {
                      setState(
                          () => pressAttentionnight = !pressAttentionnight);
                      darkTheme:
                      ThemeData.dark();
                    }),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15,left: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'تلقي الإشعارات',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                RaisedButton(
                    child: Icon(
                      Icons.add_alert,
                      size: 30.0,
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: pressAttentionalert ? Colors.grey : Colors.redAccent,
                    onPressed: () {
                      setState(
                          () => pressAttentionalert = !pressAttentionalert);
                    }),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15,left: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'تغيير كلمة المرور',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _Changepassword(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15,left: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'تغيير البريد الإلكتروني',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _ChangeEmail(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15,left: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'تغيير رقم الهاتف',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _ChangePhone(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15,left: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'تغيير مكان السكن',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _ChangeLocation(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
