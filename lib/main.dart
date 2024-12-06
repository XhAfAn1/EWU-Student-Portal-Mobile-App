import 'dart:async';

import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/DegreeReview.dart';
import 'package:ewu_portal/GradeReport.dart';
import 'package:ewu_portal/InstallmentPayment.dart';
import 'package:ewu_portal/MyAccLeadger.dart';
import 'package:ewu_portal/OfferedCourse.dart';
import 'package:ewu_portal/SemesterDrop.dart';
import 'package:ewu_portal/UploadDoc.dart';
import 'package:ewu_portal/advising.dart';
import 'package:ewu_portal/convo.dart';
import 'package:ewu_portal/curriculumn/Curriculumn.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:ewu_portal/classSche.dart';
import 'package:ewu_portal/logins/loginPage.dart';
import 'package:ewu_portal/logins/mainL.dart';
import 'package:ewu_portal/logins/updatePass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FacEvaluation.dart';

GlobalKey<ScaffoldState> key = GlobalKey();

void main() => runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      //home: Home(),
  //home: loginPage(),
    home:mainL(),
    // home: classSche(),


    builder:(context,child){
      return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!);
    }


    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}




class _HomeState extends State<Home> {
  @override

  Future<void> refresh (){
    Timer(const Duration(seconds: 1), truMsg);
    return Future.delayed(Duration(seconds: 1));
  }void truMsg() {
    setState(() {
      isVisible = true;
    });
  }

  bool isVisible = true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible = true;
  }
  Widget build(BuildContext context) {

    return Scaffold(
        key: key,

        appBar: AppBar(
          titleSpacing: 0.0,
          toolbarHeight: 55,
          title: TextButton(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/logonn.png",
                    width: 210,
                    height: 50,
                    alignment: Alignment.bottomLeft,

                  ),
                ),
                Divider(
                  indent: 0,
                  height: 5,
                  endIndent: 30,
                )
              ],
            ),
          onPressed: (){
              truMsg();
          },
            style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                )
            ),
            ),
          ),

          leading: Builder(
            builder: (context) {

              return Container(
                height: 50,
                width: 40,
                alignment: Alignment.topLeft,
                color: Color.fromARGB(255, 75, 164, 200),
                //color: Color.fromARGB(255, 255, 0, 0),
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,

          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 40, 65, 111),
                Color.fromARGB(255, 40, 65, 111),
              ],
            )),
          ),
          iconTheme: IconThemeData(color: Colors.black, size: 40),

          bottom: AppBar(
            toolbarHeight: 45,
            automaticallyImplyLeading: false,

            title: Row(
              children: [

                Container(
                child: IconButton(onPressed: (){}, icon: Badge.count(
                    count: 0,
                    padding: EdgeInsets.all(0.1),
                    child: FaIcon(FontAwesomeIcons.bell,size: 20,color: Colors.white,)),color: Colors.white,),
              ),
                Container(
                  width: 5,
                ),
                Container(
                  child: Text("Hi, Md. Saiful Islam",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                Container(
                  width: 5,
                ),
                PopupMenuButton(
                    offset: Offset(0, 50),
                    itemBuilder: (context)=>[

                      PopupMenuItem(
                        child: Row(
                          children: [
                            Container(margin: EdgeInsets.only(left: 10,right: 10),child: FaIcon(FontAwesomeIcons.user,size: 16,color: Colors.black,)),
                            Container(child: Text("Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),),
                          ],
                        ), onTap: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=> profile(),
                        ));
                      },

                      ),

                      PopupMenuItem(child: Row(
                        children: [
                          Container(margin: EdgeInsets.only(left: 10,right: 10),child: FaIcon(FontAwesomeIcons.exchange,size: 16,color: Colors.black,)),
                          Container(child: Text("Change Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),),
                        ],
                      ), onTap: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=> updatePass(),
                        ));
                      },

                      ),

                      PopupMenuItem(child: Row(
                        children: [
                          Container(margin: EdgeInsets.only(left: 10,right: 10),child: FaIcon(FontAwesomeIcons.signInAlt,size: 16,color: Colors.black,)),
                          Container(child: Text("LogOut",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),),
                        ],
                      ), onTap: () async{

                        var sharedPref= await SharedPreferences.getInstance();
                        sharedPref.setBool(mainLState.KEYLOGIN, false);
                        //Navigator.of(context).pop(true);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context)=>loginPage(),
                        ));
                      },
                      ),


                    ],icon: CircleAvatar(
                    backgroundImage: AssetImage("assets/bateman.jpg",),radius: 19,
                )
                  //FaIcon(FontAwesomeIcons.userCog,size: 25,color: Colors.white,),color: Colors.white,
                ),

              ],
            ),


            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 40, 65, 111),
                      Color.fromARGB(255, 40, 65, 111),
                    ],
                  )),
            ),




          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 40, 65, 111),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  Icons.dehaze,
                  color: Colors.white,
                  size: 40,
                ),
                onTap: () {
                  key.currentState!.closeDrawer();
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.solidRegistered,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'ADVISING',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> advising(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.school,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'MY CLASS SCHEDULE',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> classSche(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.book,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'ADVISING RULE',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {

                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> AdvisingRule(),
                  ));

                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.sortNumericAsc,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'GRADE REPORT',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> GradeReport(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'SEMESTER DROP',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Semesterdrop(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.bookOpenReader,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'CURRICULUMN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {


                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Curriculumn(),
                  ));

                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.coins,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'INSTALLEMNT PAYMENT',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.1),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Installmentpayment(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.moneyCheck,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'MY ACCOUNT LEADGER',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Myaccleadger(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.bookOpen,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'OFFERED COURSES',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Offeredcourse(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.book,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'DEGREE REVIEW',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Degreereview(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.fill,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'FACULTY EVALUATION',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Facevaluation(),
                  ));
                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.userGraduate,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'CONVOCATION APPLY',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {



                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> convo(),
                  ));



                },
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.fileUpload,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'UPLOAD DOCUMENT',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> Uploaddoc(),
                  ));
                },
              ),

            ],
          ),
        ),

        body:  // DismissableContainer(),
      RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          children: [ Column(
            children: [Visibility(

              visible: isVisible,
              child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 217, 237, 247),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 2,top: 2,bottom: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: RichText(text:TextSpan(
                          children: <TextSpan> [
                            TextSpan(text: "Welcome ",style: TextStyle(
                                color: Color.fromARGB(255, 49, 112, 169),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),),
                            TextSpan(text:'to East West University Student Portal!',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 49, 112, 169),
                                  fontSize: 14,
                                  ),
                            )
                          ]
                        ))
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isVisible = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),replacement: Container(
              color: Colors.black,
            ),
            ),],
          ),]
        ),
      )



        );
  }

}

