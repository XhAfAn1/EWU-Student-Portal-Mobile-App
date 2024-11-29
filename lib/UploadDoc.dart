// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/DbHelper/DatabasehelperTest.dart';
import 'package:ewu_portal/DegreeReview.dart';
import 'package:ewu_portal/FacEvaluation.dart';
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

import 'SemesterDrop.dart';
import 'classSche.dart';


GlobalKey<ScaffoldState> key = GlobalKey();


class Uploaddoc extends StatefulWidget {
  const Uploaddoc({super.key});

  @override
  State<Uploaddoc> createState() => _UploaddocState();
}

class _UploaddocState extends State<Uploaddoc> {


  List<Map<String, dynamic>> _courses1 = [];


  List<Map<String, dynamic>> _courses2 = [];

  List<Map<String, dynamic>> _courses3 = [];

  String? valueChosen;
  List SemList=["Fall24","Summer24","Spring24","Fall23","Summer23","Spring23","Fall22"];
  @override


  fetchCourses1() async {
    try{await databasTest2.instance.deleteall3();}catch(e){};

    await databasTest2.instance.insert1({
      databasTest2.course: "ENG101",
      databasTest2.section: 22,
      databasTest2.credit: 3,
      databasTest2.timing: "TR 3:10PM-4:40PM",
      databasTest2.faculty: "Ms. Ruhul Asfia",
      databasTest2.facultyIni: "ASFIA"
      ,databasTest2.facultyMail: "ruhul.asfia@ewubd.edu",
      databasTest2.semester: "Fall22"
    });
    await databasTest2.instance.insert1({
      databasTest2.course: "ENG",
      databasTest2.section: 2,
      databasTest2.credit: 2,
      databasTest2.timing: "TR 3:10PM-4:40PM",
      databasTest2.faculty: "Ms. Ruhul Asfi",
      databasTest2.facultyIni: "ASFI"
      ,databasTest2.facultyMail: "ruhul.asfia@ewubd.ed",
      databasTest2.semester: "Fall22"
    });
    var courses = await databasTest2.instance.queryDatabase1();
    setState(() {
      _courses1 = courses;
      print(_courses1);
    });
  }




  fetchCourses2() async {
    try{await databasTest2.instance.deleteall2();}catch(e){};
    await databasTest2.instance.insert2({
      databasTest2.course: "ACT101",
      databasTest2.section: 1,
      databasTest2.faculty: "NYN",
      databasTest2.timing: "ST 09:25 AM - 10:40 AM",
      databasTest2.roomNo: "336",
      databasTest2.capacity: "41/41",
      databasTest2.department: "Department of BA",
      databasTest2.semester: "Fall23"
    });
    await databasTest2.instance.insert2({
      databasTest2.course: "ACT101",
      databasTest2.section: 3,
      databasTest2.faculty: "NYN",
      databasTest2.timing: "ST 09:25 AM - 10:40 AM",
      databasTest2.roomNo: "336",
      databasTest2.capacity: "41/41",
      databasTest2.department: "Department of BA",
      databasTest2.semester: "Fall24"
    });
    var courses = await databasTest2.instance.queryDatabase2();
    setState(() {
      _courses2 = courses;
      print(_courses2);
    });
  }

  fetchCourses3() async {
    try{await databasTest2.instance.deleteall3();}catch(e){};

    await databasTest2.instance.insert3({
      databasTest2.course: "Asfsd11",
      databasTest2.faculty: "NYN",
      databasTest2.department: "Departmenfsdt of BA",

    });
    await databasTest2.instance.insert3({
      databasTest2.course: "Adfsd11",
      databasTest2.faculty: "NsfsdN",
      databasTest2.department: "Depadsfsf of BA",

    });
    var courses = await databasTest2.instance.queryDatabase3();
    setState(() {
      _courses3 = courses;
      print(_courses3);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
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
                builder: (context)=>Home(
                ),

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
                alignment: Alignment.topLeft,
                color: Color.fromARGB(255, 75, 164, 200), // Set the background color here
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
            IconButton(
              icon: FaIcon(FontAwesomeIcons.user,color: Color.fromARGB(255, 40, 65, 111),size: 20,),
              style: IconButton.styleFrom(backgroundColor: Color.fromARGB(
                  124, 255, 255, 255),),//style: ,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> profile(),
                ));
              },
            ),
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

                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>Degreereview(
                    ),
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
                     builder: (context)=>Facevaluation(
                     ),
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
                    builder: (context)=>convo(
                    ),

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
                ),/*
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),*/
               // onTap: () {},
              ),

            ],
          ),
        ),

        body: Column(
          children: [


            Container(
              height: 25,

            ),Divider(
              height: 20,
              thickness: 0.3,
              color: Colors.black,
            ),Container(
              height: 30,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  width: 240,
                  child: DropdownButton2(
                    hint: Text("Select Semester"),
                    value: valueChosen,
                    isExpanded: true,
                    onChanged: (newValue) {
                      setState(() {
                        valueChosen = newValue as String;
                      });
                    },
                    items: SemList.map((valueItem){
                      return DropdownMenuItem(value: valueItem,child: Text(valueItem));
                    }).toList(),

                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 76, 165, 196),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: () async{

                   //  await databasTest2.instance.deleteall1();

                    //await databasTest2.instance.rawRun2();
                    //await databasTest.instance.rawRun2();


                     //
                     // await databasTest2.instance.deleteall2();
                     // //
                     // await databasTest2.instance.insert2({
                     //   databasTest2.course: "ACT101",
                     //   databasTest2.section: 1,
                     //   databasTest2.faculty: "NYN",
                     //   databasTest2.timing: "ST 09:25 AM - 10:40 AM",
                     //   databasTest2.roomNo: "336",
                     //   databasTest2.capacity: "41/41",
                     //   databasTest2.department: "Department of BA",
                     //   databasTest2.semester: "Fall23"
                     // });
                     // await databasTest2.instance.insert2({
                     //   databasTest2.course: "ACT101",
                     //   databasTest2.section: 3,
                     //   databasTest2.faculty: "NYN",
                     //   databasTest2.timing: "ST 09:25 AM - 10:40 AM",
                     //   databasTest2.roomNo: "336",
                     //   databasTest2.capacity: "41/41",
                     //   databasTest2.department: "Department of BA",
                     //   databasTest2.semester: "Fall24"
                     // });
                     // await databasTest2.instance.deleteall3();
                     // await databasTest2.instance.insert3({
                     //   databasTest2.course: "Asfsd11",
                     //   databasTest2.faculty: "NYN",
                     //   databasTest2.department: "Departmenfsdt of BA",
                     //
                     // });
                     // await databasTest2.instance.insert3({
                     //   databasTest2.course: "Adfsd11",
                     //   databasTest2.faculty: "NsfsdN",
                     //   databasTest2.department: "Depadsfsf of BA",
                     //
                     // });


                     await fetchCourses1();
                       await fetchCourses2();
                     await fetchCourses3();
                  }, child: Text("SHOW COURSES",
                  style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.left,),),



              ],
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(color: Colors.black),
                  columns: [
                    DataColumn(label: Text("Serial",style: TextStyle(fontWeight: FontWeight.bold),),),
                    DataColumn(label: Text("Course",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Section",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Credit",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Timing",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Faculty Initial",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Faculty",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Faculty Mail",style: TextStyle(fontWeight: FontWeight.bold),)),
                    //  DataColumn(label: Text("Semester",style: TextStyle(fontWeight: FontWeight.bold),)),

                  ],
                  rows: _courses1.map((course) => DataRow(
                    cells: [
                      DataCell(Text((s++).toString())),
                      DataCell(Text(course[databasTest2.course].toString()),),
                      DataCell(Text(course[databasTest2.section].toString())),
                      DataCell(Text(course[databasTest2.credit].toString())),
                      DataCell(Text(course[databasTest2.timing].toString())),
                      DataCell(Text(course[databasTest2.facultyIni].toString())),
                      DataCell(Text(course[databasTest2.faculty].toString())),
                      DataCell(Text(course[databasTest2.facultyMail].toString())),
                      //  DataCell(Text(course[dbh.semester].toString())),
                    ],
                  ),
                  )
                      .toList(),


                ),
              ),
            ),








            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  //border: TableBorder.all(color: Colors.black),
                  columns: [

                    DataColumn(label: Text("Course",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Section",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Timing",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Room No",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Capacity",style: TextStyle(fontWeight: FontWeight.bold),)),
                    //DataColumn(label: Text("Department",style: TextStyle(fontWeight: FontWeight.bold),)),
                    //DataColumn(label: Text("Semester",style: TextStyle(fontWeight: FontWeight.bold),)),

                  ],
                  rows: _courses2.map((course) => DataRow(
                    cells: [

                      DataCell(Text(course[databasTest2.course].toString())),
                      DataCell(Text(course[databasTest2.section].toString())),
                      DataCell(Text(course[databasTest2.timing].toString())),
                      DataCell(Text(course[databasTest2.roomNo].toString())),
                      DataCell(Text(course[databasTest2.capacity].toString())),
                      //DataCell(Text(course[dbh2.department].toString())),
                      //DataCell(Text(course[dbh2.semester].toString())),
                    ],
                  ),
                  )
                      .toList(),




                ),
              ),
            ),

            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  //border: TableBorder.all(color: Colors.black),
                  columns: [

                    DataColumn(label: Text("Course",style: TextStyle(fontWeight: FontWeight.bold),)),

                    DataColumn(label: Text("Faculty",style: TextStyle(fontWeight: FontWeight.bold),)),


                    DataColumn(label: Text("Department",style: TextStyle(fontWeight: FontWeight.bold),)),


                  ],
                  rows: _courses3.map((course) => DataRow(
                    cells: [

                      DataCell(Text(course[databasTest2.course].toString())),

                      DataCell(Text(course[databasTest2.faculty].toString())),

                      DataCell(Text(course[databasTest2.department].toString())),

                    ],
                  ),
                  )
                      .toList(),




                ),
              ),
            )



          ],
        )



    );
  }
}


