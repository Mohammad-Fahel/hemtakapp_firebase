import 'dart:ui';
import 'package:flutter/material.dart';

class ChangeEmail extends StatelessWidget {
  String title;
  VoidCallback continueCallBack;

  ChangeEmail(this.title, this.continueCallBack);

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
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.redAccent),

                    ),
                    hintText: "البريد الإلكتروني القديم",
                    labelText: 'البريد الإلكتروني القديم',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.redAccent)),
                    hintText: "البريد الإلكتروني الجديد",
                    labelText: 'البريد الإلكتروني الجديد',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
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
