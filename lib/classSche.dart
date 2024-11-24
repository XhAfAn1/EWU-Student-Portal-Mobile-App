// ignore_for_file: prefer_const_constructors

import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:ewu_portal/advising.dart';
import 'package:ewu_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'DbHelper/Course_Data.dart';
import 'DbHelper/dbh.dart';
import 'DegreeReview.dart';
import 'FacEvaluation.dart';
import 'GradeReport.dart';
import 'InstallmentPayment.dart';
import 'MyAccLeadger.dart';
import 'OfferedCourse.dart';
import 'SemesterDrop.dart';
import 'UploadDoc.dart';
import 'convo.dart';
import 'curriculumn/Curriculumn.dart';


GlobalKey<ScaffoldState> key = GlobalKey();

int s=1;
class classSche extends StatefulWidget {
  const classSche({super.key});

  @override
  State<classSche> createState() => _classScheState();
}

class _classScheState extends State<classSche> {

  List<Map<String, dynamic>> _courses = [];
  List<Map<String, dynamic>> _filter = [];

  @override


  fetchCourses() async {
    var courses = await dbh.instance.queryDatabase();
    setState(() {
      _courses = courses;
      print(_filter);
    });
  }
  filterCourses(String sem) async{
    setState(() {
      _filter = _courses.where((course) => course[dbh.semester].toString() == sem).toList();
      print(_filter);
    });
  }
@override
  void initState() {
    // TODO: implement initState
   insertData();
  fetchCourses();
  }
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
                /*
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),*/
               // onTap: () {},
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

      body:


      Column(
        children: [
          Row(
            children: [
             Drop
            ],
          ),
          ElevatedButton(onPressed: () async{
              await insertData();
            var q= await dbh.instance.queryDatabase();
            // print(q);
              await fetchCourses();
          }, child: Text("Insert")),

          ElevatedButton(onPressed: () async{

            filterCourses("Spring23");
          }, child: Text("Show only Fall24")),




          ElevatedButton(onPressed: () async{
            await dbh.instance.deleteall();
            await fetchCourses();
            await filterCourses("");
          }, child: Text("Delete All")),

             SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                border: TableBorder.all(color: Colors.black),
                columns: [
                DataColumn(label: Text("Serial")),
                DataColumn(label: Text("Course")),
                 DataColumn(label: Text("Section")),
                 DataColumn(label: Text("Credit")),
                DataColumn(label: Text("Timing")),
                DataColumn(label: Text("Faculty Initial")),
                 DataColumn(label: Text("Faculty")),
                DataColumn(label: Text("Faculty Mail")),
               //  DataColumn(label: Text("Semester")),

              ], rows: _filter.map((course) => DataRow(
                  cells: [
                    DataCell(Text((s++).toString())),
                    DataCell(Text(course[dbh.course].toString())),
                    DataCell(Text(course[dbh.section].toString())),
                   DataCell(Text(course[dbh.credit].toString())),
                    DataCell(Text(course[dbh.timing].toString())),
                    DataCell(Text(course[dbh.facultyIni].toString())),
                     DataCell(Text(course[dbh.faculty].toString())),
                    DataCell(Text(course[dbh.facultyMail].toString())),
                   //  DataCell(Text(course[dbh.semester].toString())),
                  ],
                ),
              )
                  .toList(),


              ),
            ),

        ],
      ),

    );
  }
}







/*


                      DataRow(cells: [
                        DataCell( Text('01',style: TextStyle(color:Colors.black),)),
                        DataCell( Text('CSE 246',style: TextStyle(color:Colors.black),)),
                        DataCell( Text('05',style: TextStyle(color:Colors.black),)),
                        DataCell( Text('4',style: TextStyle(color:Colors.black),)),
                        DataCell( Text('TM',style: TextStyle(color:Colors.black),)),

                      ],),
                  DataRow(cells: [
                    DataCell( Text('02',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('CSE 325',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('05',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('4',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('MHMM',style: TextStyle(color:Colors.black),)),

                  ],),
                  DataRow(cells: [
                    DataCell( Text('03',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('CSE 302',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('06',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('4',style: TextStyle(color:Colors.black),)),
                    DataCell( Text('MRJ',style: TextStyle(color:Colors.black),)),

                  ],),


 */