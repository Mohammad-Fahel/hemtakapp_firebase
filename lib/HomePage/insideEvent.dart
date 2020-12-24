import 'package:flutter/material.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:hemtak_app/ui/signInScreen.dart';
import 'package:ndialog/ndialog.dart';

class InsideEvent extends StatefulWidget {
  @override
  _InsideEventState createState() => _InsideEventState();
}

class _InsideEventState extends State<InsideEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomePageVolunteer())),
          ),
          title: Text("تفاصيل الفعالية",
              style: TextStyle(color: Colors.white, fontSize: 23)),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(start: 20,end: 20, top: 5),
          child: Column(
            children: [
              Image.asset(
                "assets/images/disability.jpeg",
                width: 370,
                height: 270,
              ),
              Text("مساعدة ذوي الاحتياجات الخاصة في ممارسة الرياضة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
              SizedBox(height: 10),
              Container(
                color: Colors.black45,
                width: double.maxFinite,
                height: 1.5,
              ),
              SizedBox(height: 10),
              Text("يقوم المتطوعيون بالانقسام إلى قسمين، القسم الأول بمساعدة الأشخاص ذوي الاحتياجات الخاصةفي ممارسة أنواع جديدة من الرياضة وبطرق مبتكرة تناسيهم وتناسب احتياجاتهم، والقسم الثاني يقوم بترتيب وتنظيم الحدث",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17.5),textAlign: TextAlign.center),
              SizedBox(height: 10),
              Container(
                color: Colors.black45,
                width: double.maxFinite,
                height: 1.5,
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(right: 15,left: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text("الموقع: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("عمان - صالة الشباب"),
                          ],
                        ),
                        SizedBox(width: 15),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined),
                            Text("الموعد: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("16:00 - 18:00"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.date_range),
                            Text("التاريخ: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("29/12/2020"),
                          ],
                        ),
                        SizedBox(width: 35),
                        Row(
                          children: [
                            Icon(Icons.people),
                            Text("المتطوعون: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("20-30 "),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star),
                            Text("عدد النقاط: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("35 نقطة"),
                          ],
                        ),
                        SizedBox(width: 45),
                        Row(
                          children: [
                            Icon(Icons.category),
                            Text("الفئة: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("جميع الفئات"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    NAlertDialog(
                      title: Text(
                        "تم استلام طلبك بنجاح",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Text("سيتم التواصل معك حال الموافقة على الطلب",
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
                      'تطوع الآن',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
              SizedBox(height: 30),
              Text("شركاؤنا الرسميين لهذا الحدث:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logos/fireFly.png",
                      height: 100, width: 100),
                  Container(
                    color: Colors.black,
                    height: 75,
                    width: 1,
                  ),
                  SizedBox(width: 15),
                  Image.asset("assets/logos/GoldenGym.png",
                      height: 90, width: 80)
                ],
              )
            ],
          ),
        ));
  }
}
