import 'dart:ui';
import 'package:flutter/material.dart';

class ChangePhone extends StatelessWidget {
  String title;
  VoidCallback continueCallBack;

  ChangePhone(this.title, this.continueCallBack);

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
          //content: new Text(content, style: textStyle,),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: "",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.redAccent)),
                    hintText: "رقم هاتف قديم",
                    labelText: 'رقم هاتف قديم',
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,

                  decoration: InputDecoration(
                    counterText: "",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.redAccent)),
                    hintText: "رقم هاتف الجديد",
                    labelText: 'رقم هاتف الجديد',
                    prefixIcon: const Icon(
                      Icons.phone,
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
