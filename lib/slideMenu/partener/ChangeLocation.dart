import 'dart:ui';
import 'package:flutter/material.dart';

class ChangeLocation extends StatelessWidget {
  String title;
  VoidCallback continueCallBack;

  ChangeLocation(this.title, this.continueCallBack);
  TextStyle textStyle = TextStyle(color: Colors.black);
  TextField textField = TextField();
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: new Text(
            title,
            style: textStyle,
          ),
          content: new TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.redAccent)),

            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "تم",
                style: TextStyle(
                    fontSize: 17.5,color: Colors.redAccent
                ),
              ),
              onPressed: () {
                continueCallBack();
              },
            ),
            new FlatButton(
              child: Text(
                "رجوع",
                style: TextStyle(
                    fontSize: 17.5,color: Colors.redAccent
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
