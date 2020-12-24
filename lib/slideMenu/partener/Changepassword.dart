import 'dart:ui';
import 'package:flutter/material.dart';

class Changepassword extends StatelessWidget {
  String title;
  VoidCallback continueCallBack;
  Changepassword(this.title, this.continueCallBack);
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
          /*content: new TextField(
            obscureText: true,
          ),*/
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(

                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.redAccent)),
                      hintText: " كلمة مرور القديمة",
                      labelText: 'كلمة مرور القديمة',
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.redAccent,
                      ),
                    ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                TextField(

                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.redAccent)),
                    hintText: "كلمة مرور الجديدة",
                    labelText: 'كلمة مرور الجديدة',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.redAccent,
                    ),

                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
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
        )
    );
  }
}
