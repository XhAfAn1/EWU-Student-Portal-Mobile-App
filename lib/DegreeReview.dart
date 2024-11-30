// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/GradeReport.dart';
import 'package:ewu_portal/InstallmentPayment.dart';
import 'package:ewu_portal/MyAccLeadger.dart';
import 'package:ewu_portal/OfferedCourse.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:ewu_portal/advising.dart';
import 'package:ewu_portal/convo.dart';
import 'package:ewu_portal/curriculumn/Curriculumn.dart';
import 'package:ewu_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'FacEvaluation.dart';
import 'SemesterDrop.dart';
import 'UploadDoc.dart';
import 'classSche.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logins/loginPage.dart';
import 'logins/mainL.dart';
import 'logins/updatePass.dart';

GlobalKey<ScaffoldState> key = GlobalKey();


class Degreereview extends StatelessWidget {
  const Degreereview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar:  AppBar(
          toolbarHeight: 60,
          title: TextButton(
            child: Image.asset(
              "assets/logonn.png",
              width: 200,
              height: 50,
              alignment: Alignment.topLeft,

            ),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>Home(),
              ));

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

          actions: [
            Container(
              child: IconButton(onPressed: (){}, icon: Badge.count(
                  count: 0,
                  padding: EdgeInsets.all(2),
                  child: FaIcon(FontAwesomeIcons.bell,size: 25,color: Colors.white,)),color: Colors.white,),
            )
            ,
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
                backgroundImage: AssetImage("assets/bateman.jpg",)
            )
              //FaIcon(FontAwesomeIcons.userCog,size: 25,color: Colors.white,),color: Colors.white,
            )
          ],
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
                onLongPress: (){
                  Navigator.of(context).pop();
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
                    builder: (context)=>Curriculumn(
                    ),

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
                    builder: (context)=>Installmentpayment(
                    ),

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
                    builder: (context)=>Myaccleadger(
                    ),
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
                    builder: (context)=>Offeredcourse(
                    ),
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
                /*
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),*/
                //onTap: () {},
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

        body: Container(
          color: Colors.white,
          child: ListView(
            children: [


              Container(
                height: 25,

              ),Divider(
                height: 20,
                thickness: 0.3,
                color: Colors.black,
              ),Container(
                height: 50,

              ),
              Stack(
                children: [
                  Container(

                    margin: EdgeInsets.only(left:20,right: 20,top:15,bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey,width: 1.0),

                    ),
                    width: 450,
                    //height: 1500,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text("B.Sc. in Computer Science and Engineering",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                        ),

                        Container(
                          child: Stack(
                            children: [
                              Container(

                                margin: EdgeInsets.only(left:20,right: 20,top:15,bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey,width: 1.0),

                                ),
                                width: 450,
                                height: 530,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left:30),
                                            height: 40,
                                            width: 120,
                                            padding: EdgeInsets.all(8),
                                            child: Text("Student Id"),),
                                          Container(
                                            height: 40,
                                            width: 120,
                                            margin: EdgeInsets.only(right:30),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.grey,width: 1.0
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                              color: Colors.grey[300]
                                            ),
                                            child: Text("2022-3-60-045",//textAlign: TextAlign.center,
                                            ),),
                                        ],
                                      )
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 120,
                                              margin: EdgeInsets.only(left:30),
                                              padding: EdgeInsets.all(8),
                                              child: Text("Student Name"),),
                                            Container(
                                              height: 40,
                                              width: 120,
                                              margin: EdgeInsets.only(right:30),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  border:
                                                  Border.all(color: Colors.grey,width: 1.0
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  color: Colors.grey[300]
                                              ),
                                              child: Text("Saif Islam",textAlign: TextAlign.center,
                                              ),),
                                          ],
                                        )
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(left:40,top: 50),
                                      child: Text("CGPA"),
                                    ),
                                    Container(
                                      width: 280,
                                      height: 40,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.grey,width: 1.0
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          color: Colors.grey[300]
                                      ),
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text("4.20"),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left:40,top: 10),
                                      child: Text("Cr Atr"),
                                    ),
                                    Container(
                                      width: 280,
                                      height: 40,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.grey,width: 1.0
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          color: Colors.grey[300]
                                      ),
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text("63"),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left:40,top: 10),
                                      child: Text("Cr Earn"),
                                    ),
                                    Container(
                                      width: 280,
                                      height: 40,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.grey,width: 1.0
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          color: Colors.grey[300]
                                      ),
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text("63"),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 150,
                                              margin: EdgeInsets.only(left:30),
                                              padding: EdgeInsets.all(8),
                                              child: Text("Min Credit Required"),),
                                            Container(
                                              height: 40,
                                              width: 60,
                                              margin: EdgeInsets.only(right:30),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  border:
                                                  Border.all(color: Colors.grey,width: 1.0
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  color: Colors.grey[300]
                                              ),
                                              child: Text("140",textAlign: TextAlign.center,
                                              ),),
                                          ],
                                        )
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 150,
                                              margin: EdgeInsets.only(left:30),
                                              padding: EdgeInsets.all(8),
                                              child: Text("Remaining Credit"),),
                                            Container(
                                              height: 40,
                                              width: 60,
                                              margin: EdgeInsets.only(right:30),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  border:
                                                  Border.all(color: Colors.grey,width: 1.0
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  color: Colors.grey[300]
                                              ),
                                              child: Text("77",textAlign: TextAlign.center,
                                              ),),
                                          ],
                                        )
                                    ),


                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 185,
                                margin: EdgeInsets.only(left: 45),
                                color: Colors.white,
                                child: Text("Student Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),textAlign: TextAlign.center,),),

                            ],
                          ),
                        ),

                        Container(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left:20,right: 20,top:15,bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey,width: 1.0),

                                ),
                                child: Column(
                                  children: [
                                    Container(

                                      padding: EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 50),
                                      width: 450,
                                      height: 535,
                                      child: Table(
                                       // border:  TableBorder.all(color: Colors.black),
                                        children: [
                                          TableRow(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200]
                                              ),
                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Basic Science Courses"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("11 (Out of 11)"),
                                                )),
                                              ]
                                          ),
                                          TableRow(
                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Mathematics and Statistics Courses"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("15 (Out of 15)"),
                                                )),
                                              ]
                                          ),
                                          TableRow(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200]
                                              ),
                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Compulsory Language and General Education Courses"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("9 (Out of 9)"),
                                                )),
                                              ]
                                          ),
                                          TableRow(

                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Elective General Education Courses"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("3 (Out of 9)"),
                                                )),
                                              ]
                                          ),
                                          TableRow(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200]
                                              ),
                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Core Computer Science and Engineering Courses"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("25 (Out of 62)"),
                                                )),
                                              ]
                                          ),
                                          TableRow(

                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Capstone Project"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("0 (Out of 6)"),
                                                )),
                                              ]
                                          ),
                                          TableRow(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200]
                                              ),
                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Non-major Elective Computer Science and Engineering Courses"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("25 (Out of 62)"),
                                                )),
                                              ]
                                          ),
                                          TableRow(

                                              children:[
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Major"),
                                                )),
                                                TableCell(child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("0 (Out of 20)"),
                                                )),
                                              ]
                                          ),
                                        ],
                                      ),
                                    ),

                                    Divider(
                                      height: 30,
                                      indent: 40,
                                      endIndent: 40,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 30,bottom: 10),
                                      alignment: Alignment.topLeft,
                                      child: Text("Total Transfer & Waiver: 0\nAt EWU:63"),
                                    ),
                                    Divider(
                                      height: 20,
                                      indent: 40,
                                      endIndent: 40,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20,top: 20),
                                      child: Text("Total Credits Earned:63 (Out of 140)"),
                                    ),
                                    Divider(
                                      height: 20,
                                      indent: 40,
                                      endIndent: 40,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),

                                    ),


                                  ],
                                ),
                              ),

                              Container(
                                height: 30,
                                width: 250,
                                margin: EdgeInsets.only(left: 45),
                                color: Colors.white,
                                child: Text("Credit Completion Summary",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),textAlign: TextAlign.center,),),

                            ],)
                        ),



                        //Results

                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(top: 20),
                          height: 150,
                          width: 450,
                          color: Color.fromARGB(255, 95, 158, 160),
                          child: RichText(textAlign: TextAlign.center,text: TextSpan(
                            text: "Compulsory Language and General Education Courses\n",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),
                          children: [
                            TextSpan(
                              text: "Compulsory Language and General Education Courses\n",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                            TextSpan(
                              text: "Completed:9",
                              style: TextStyle(backgroundColor: Colors.green,color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                            TextSpan(
                              text: "   ",

                            ),
                            TextSpan(
                              text: "Remaining:0",
                              style: TextStyle(backgroundColor: Colors.yellow,color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                          ]
                          ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              border: TableBorder.all(color: Colors.black),
                              columns: [
                              DataColumn(label: Text("Sl.")),
                              DataColumn(label: Text("Course")),
                              DataColumn(label: Text("Title")),
                              DataColumn(label: Text("Credit")),
                              DataColumn(label: Text("Grade")),
                              DataColumn(label: Text("Factor")),
                              DataColumn(label: Text("Grd Point")),
                              DataColumn(label: Text("Crd Earn")),
                            ], rows: [
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("ENG101")),
                                DataCell(Text("Basic English")),
                                DataCell(Text("3")),
                                DataCell(Text("B")),
                                DataCell(Text("3")),
                                DataCell(Text("9")),
                                DataCell(Text("3")),

                              ]),
                              DataRow(cells: [
                                DataCell(Text("2")),
                                DataCell(Text("ENG102",),),
                                DataCell(Text("Composition and Communication Skills")),
                                DataCell(Text("3")),
                                DataCell(Text("B-")),
                                DataCell(Text("2.7")),
                                DataCell(Text("8.1")),
                                DataCell(Text("3")),

                              ]),
                            ],
                              
                            ),
                          ),
                        )


                      ],
                    ),

                  ),
                  Container(
                    height: 30,
                    width: 145,
                    margin: EdgeInsets.only(left: 45),
                    color: Colors.white,
                    child: Text("Degree Analysis",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),textAlign: TextAlign.center,),),

                ],
              )


            ],
          ),
        )



    );
  }

}


