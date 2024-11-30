import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/advising.dart';
import 'package:ewu_portal/curriculumn/Curriculumn.dart';
import 'package:ewu_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DegreeReview.dart';
import 'FacEvaluation.dart';
import 'GradeReport.dart';
import 'InstallmentPayment.dart';
import 'MyAccLeadger.dart';
import 'OfferedCourse.dart';
import 'SemesterDrop.dart';
import 'UploadDoc.dart';
import 'classSche.dart';
import 'convo.dart';
import 'logins/loginPage.dart';
import 'logins/mainL.dart';
import 'logins/updatePass.dart';

GlobalKey<ScaffoldState> key = GlobalKey();


class profile extends StatelessWidget {
  const profile({super.key});
  @override

  Future<void> refresh (){
    prRld();
    return Future.delayed(Duration(seconds: 1));
  }
  prRld() {
    return profile();
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

        body: Center(
          child: RefreshIndicator(
            onRefresh: refresh,
            child: ListView(
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
                Column( children: [
                  Container(
                  margin: EdgeInsetsDirectional.all(20),
                  height: 500,
                  width: 380,
                  color: Color.fromARGB(255, 240, 244, 245),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          height: 280,
                          width: 200,
                          child: Image.asset(
                            "assets/bateman.jpg",

                          ) ,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child:  Column(
                            children: [
                              ListTile( title: Text(getpfName(), textAlign: TextAlign.center,style:
                              TextStyle(color: Color.fromARGB(255, 74, 72, 72),fontSize: 20,fontWeight: FontWeight.bold),),),
                              ListTile(
                                title: Text("Student ID: "+ getId() + "\n Unique ID: 00922305101045\n Program: CSE\n Department: CSE\n Credits completed: 63\n CGPA: 4.20", textAlign: TextAlign.center,style:
                                TextStyle(color: Colors.black45,fontSize: 14,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          )


                        ),

                      ],
                    ),
                  ),


                ),


                ]),


                Container(
                  margin:EdgeInsets.only(left: 5),
                  //margin: EdgeInsetsDirectional.all(5),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("CONTACT INFORMATION",style:
                        TextStyle(color: Colors.grey[700],fontSize: 18,fontWeight: FontWeight.bold),),
                      ),

                      ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        leading:FaIcon(FontAwesomeIcons.phone,size: 18,color: Colors.green,),
                        title: Text("01839228924",style:
                        TextStyle(color: Colors.grey[700],fontSize: 14),),
                      ),
                      SizedBox(height: 0),
                      ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        leading:FaIcon(FontAwesomeIcons.envelope,size: 18,color: Colors.blue,),
                        title: Text("2022-3-60-045@std.ewubd.edu",style:
                        TextStyle(color: Colors.grey[700],fontSize: 14),),
                      ),
                      SizedBox(height: 15),
                      ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("PRESENT ADDRESS",style:
                        TextStyle(color: Colors.grey[700],fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("House # 109 (6th Floor),Agamashi Lane,Bongshal,Dhaka",style:
                        TextStyle(color: Colors.grey[700],fontSize: 14),),
                      ),
                      SizedBox(height: 15),
                      ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("PARMANET ADDRESS",style:
                        TextStyle(color: Colors.grey[700],fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("Wayne Manor, 1007 Mountain Drive, Gotham",style:
                        TextStyle(color: Colors.grey[700],fontSize: 14),),
                      ),
                      SizedBox(height: 15),
                      ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                        title: Text("OTHER DETAILS",style:
                        TextStyle(color: Colors.grey[700],fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        height: 60, width: 1200, color: Color.fromARGB(255, 240, 244, 245),
                        child: Container( margin: EdgeInsets.only(top: 20,left: 20),
                          child:Text("Admitted Semester",style:
                          TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.bold),),
                        )
                      ),
                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 248, 250, 250),
                          child: Container(
                            margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("Fall 2022",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,),),
                          )
                      ),

                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 240, 244, 245),
                          child: Container( margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("Date of Birth",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.bold),),
                          )
                      ),
                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 248, 250, 250),
                          child: Container(
                            margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("29-01-2001",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,),),
                          )
                      ),

                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 240, 244, 245),
                          child: Container( margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("Blood Group",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.bold),),
                          )
                      ),
                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 248, 250, 250),
                          child: Container(
                            margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("A+",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,),),
                          )
                      ),


                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 240, 244, 245),
                          child: Container( margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("Marital Status",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.bold),),
                          )
                      ),
                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 248, 250, 250),
                          child: Container(
                            margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("Single",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,),),
                          )
                      ),

                      Container(
                          height: 60, width: 1200, color: Color.fromARGB(255, 240, 244, 245),
                          child: Container( margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("Advisor",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.bold),),
                          )
                      ),
                      Container(
                          height: 90, width: 1200, color: Color.fromARGB(255, 248, 250, 250),
                          child: Container(
                            margin: EdgeInsets.only(top: 20,left: 20),
                            child:Text("Dr. Md. Tauhid Bin Iqbal(DTBI) \ntauhid.iqbal@ewubd.edu",style:
                            TextStyle(color: Colors.grey[700],fontSize: 16,),),
                          )
                      ),


                    ],


                  )
                ),

              ],

            ),
          ),
        ),


    );
  }

}

String getpfName(){
  return "MD. Saiful Islam";
}
String getId(){
  return "2022-3-60-045";
}