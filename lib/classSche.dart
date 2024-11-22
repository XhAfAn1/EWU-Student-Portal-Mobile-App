// ignore_for_file: prefer_const_constructors

import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:ewu_portal/main.dart';
import 'package:ewu_portal/provider/MyHomePageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


GlobalKey<ScaffoldState> key = GlobalKey();
String CheckSem="Fall24";

class classSche extends StatelessWidget {
  const classSche({super.key});
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                /*
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
                size: 20,
              ),
              */
                //onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.1),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
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
                      color: Color.fromARGB(255, 96, 96, 96), fontWeight: FontWeight.bold),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),

      body:
      ChangeNotifierProvider<MyHomePageProvider>(
        create: (context) => MyHomePageProvider(),
        child: Consumer<MyHomePageProvider>(
          builder: (context, provider, child) {
            if (provider.data == null) {
              provider.getData(context);
              return Center(child: CircularProgressIndicator());
            }
            // when we have the json loaded... let's put the data into a data table widget
            return Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(height: 100,width: 500,color: Colors.white,alignment: Alignment.topRight,)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      border: TableBorder.all(color: Colors.black),
                      columns: [
                        DataColumn(label: Text('Serial',style: TextStyle(color:Colors.black),)),
                        DataColumn(label: Text('Course',style: TextStyle(color:Colors.black),)),
                        DataColumn(label: Text('Section',style: TextStyle(color:Colors.black),)),
                        DataColumn(label: Text('Credit',style: TextStyle(color:Colors.black),)),
                        DataColumn(label: Text('Faculty Name',style: TextStyle(color:Colors.black),)),
                        DataColumn(label: Text('Semester',style: TextStyle(color:Colors.black),)),
                      ],
                      rows: provider.data!.result!.map((data) =>
                          DataRow(

                              cells: [


                                DataCell(Text(data.serial!)),
                                DataCell(Text(data.course!)),
                                DataCell(Text(data.section!)),
                                DataCell(Text(data.credit!)),
                                DataCell(Text(data.facultyName!)),
                                DataCell(Text(data.semester!)),
                              ])).toList(),
                    ),
                  ),
                ],
              );


          },
        ),
      ),
    /*
        Column(
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
            Container(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(color: Colors.black),
                    columns: [
                      DataColumn(label: Text('Serial',style: TextStyle(color:Colors.black),)),
                      DataColumn(label: Text('Course',style: TextStyle(color:Colors.black),)),
                      DataColumn(label: Text('Section',style: TextStyle(color:Colors.black),)),
                      DataColumn(label: Text('Credit',style: TextStyle(color:Colors.black),)),
                      DataColumn(label: Text('Faculty Name',style: TextStyle(color:Colors.black),)),
                ], rows: provider.data.result.map((data)=>).toList(),
                ),
              )
            ),
            Container(
              height: 30,

            ),
          ],
        )
*/

    );
  }
}

/*
class CourseTime{
  int serial;
  String course;
  int section;
  String facultyN;


  CourseTime({required this.serial,required this.course,required this.section,required this.facultyN,});
   static List<CourseTime> getCourses(){
    return <CourseTime> [
      CourseTime(serial: 01, course: 'CSE 246', section: 05, facultyN: 'TM'),
      CourseTime(serial: 02, course: 'CSE 302', section: 06, facultyN: 'MRJ'),
      CourseTime(serial: 03, course: 'CSE 325', section: 05, facultyN: 'MMHM'),
    ];
}
}


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