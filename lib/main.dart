import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemtak_app/services/auth.dart';
import 'package:hemtak_app/services/user.dart';
import 'package:hemtak_app/ui/welcomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Customer>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: "Flutter Demo",
        localizationsDelegates:[
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        theme: ThemeData(
          primaryColor: Colors.grey[300],
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage()));
  }
}

// loading Screen classes
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset(
                "assets/images/hemtak.png",
                height: 240,
                width: 240,
                alignment: AlignmentDirectional.center,
              ),
              // SizedBox(height: 10),
              // Text("نوّرت..",
              //     style: TextStyle(color: Colors.black, fontSize: 40)),
              SizedBox(height: 200),
              Image.asset("assets/images/loader.gif",
                  alignment: AlignmentDirectional.bottomEnd)
            ],
          )
    );

  }
}
