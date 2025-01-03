import 'package:ewu_portal/advising.dart';
import 'package:ewu_portal/curriculumn/Curriculumn.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logins/loginPage.dart';
import 'logins/mainL.dart';
import 'logins/updatePass.dart';
GlobalKey<ScaffoldState> key = GlobalKey();


class AdvisingRule extends StatelessWidget {
  const AdvisingRule({super.key});
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
            Container(
              height: 50,
              width: 50,
              color: Color.fromARGB(255, 240, 244, 245),
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child:
              Text("ADVISING RULES",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 30,

            ),
            Container(
              margin: EdgeInsets.only(left: 50,right: 50),
              child: Center(
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                      text: "Program Type: ",children: [
                        TextSpan(text: "Undergraduation",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Department: ",children: [
                            TextSpan(text: "Depertment of CSE",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Completed Credit: ",children: [
                            TextSpan(text: "63",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Max Courses per day: ",children: [
                            TextSpan(text: "3",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Minimum CGPA Required: ",children: [
                            TextSpan(text: "2.16",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Max CGPA Required:  ",children: [
                            TextSpan(text: "4.0",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Stydent ID: ",children: [
                            TextSpan(text: "2022-3-60-045",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Unique ID: ",children: [
                            TextSpan(text: "00922305101045",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Max Credit: ",children: [
                            TextSpan(text: "21",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Min Credit: ",children: [
                            TextSpan(text: "12",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Max Course: ",children: [
                            TextSpan(text: "6",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),
                    ListTile( visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text.rich(TextSpan(style:
                      TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          text: "Min Course: ",children: [
                            TextSpan(text: "3",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal))
                          ]),),
                    ),

                  ],
                ),
              ),
            ),

            Divider(
              height: 20,
              thickness: 0.3,
              color: Colors.black,
            ),
            Container(height: 100,width: 50,),

          ],

        ),
      ),


    );
  }
}
