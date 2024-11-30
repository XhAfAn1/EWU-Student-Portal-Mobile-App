// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/FacEvaluation.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:ewu_portal/convo.dart';
import 'package:ewu_portal/curriculumn/Curriculumn.dart';
import 'package:ewu_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DegreeReview.dart';
import 'GradeReport.dart';
import 'InstallmentPayment.dart';
import 'MyAccLeadger.dart';
import 'OfferedCourse.dart';
import 'SemesterDrop.dart';
import 'UploadDoc.dart';
import 'classSche.dart';
import 'logins/loginPage.dart';
import 'logins/mainL.dart';
import 'logins/updatePass.dart';


GlobalKey<ScaffoldState> key = GlobalKey();


class advising extends StatelessWidget {
  const advising({super.key});






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
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                /*trailing: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 20,
                ),*/
              //  onTap: () {},
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

        body: Column(
          children: [


            Container(
              height: 25,

            ),Divider(
              height: 20,
              thickness: 0.3,
              color: Colors.black,
            ),Container(
              height: 20,

            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromARGB(245, 192, 57, 43),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 450,
              child: Center(
                child: Text("YOUR ADVISING SCHEDULE NOT STARTED YET / ADVISING TIME IS OVER.",
                  style: TextStyle(color: Colors.white,fontSize: 17,),textAlign: TextAlign.left,),
              ),
            ),

            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 76, 165, 196),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              onPressed: (){
              showDialog(context: context, builder: (context)=>
                AlertDialog(
                title: Text("Not Available"),
                content: Text("This Feature has not been added yet."),
                  actions: [
                    TextButton(onPressed: (){
                       Navigator.of(context).pop();
                    }, child: Text("Close"))
                  ],
              )

              );
              }, child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Text("      Print Slip     ",
                  style: TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.left,),
              ),),
            
            
            
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 76, 165, 196),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              onPressed: (){

                showAlart(context);

              }, child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Text("  Instructions   ",
                  style: TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.left,),
              ),),
            
            
            
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 76, 165, 196),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> AdvisingRule(),
                ));
              }, child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Text("Advising Rules",
                  style: TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.left,),
              ),),


          ],
        )



    );
  
  }

}
showAlart(BuildContext context){
  showDialog(context: context,
      builder:(context){
        return Dialog(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 50, 138, 69),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                children:[ Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(color: Colors.black,onPressed: (){
                        Navigator.of(context).pop();
                      }, icon: FaIcon(FontAwesomeIcons.close,size: 16,color: Colors.white,),
                        style:IconButton.styleFrom(backgroundColor: Color.fromARGB(255, 0, 0, 0),) ,)
                    ),
                    Container(
                      margin: EdgeInsets.only(left:10,right: 10),
                      child: Text("1. Student must check out his curriculum criteria before starting advising.\n\n2. Student must take minimum credit during self-advising or else he cannot get Print Slip Button. In case of any emergency, if needed to bypass this logic, please contact with assigned adviser.\n\n"
                          "3. Student cannot exceed the maximum credit limit setup by his own department for this advising. In case of any emergency, if needed to bypass this logic, please contact with assigned adviser.\n\n"
                          "4. Student must take course/s from F tab (If any). After taking these courses he will be able to view the next tab courses. In case of any emergency, if needed to bypass this logic, please contact with assigned adviser.\n\n"
                          "5. Click on any section from the left to immediately save it. Saved courses will be shown in right side. No need to click any save button after choosing the section. Section will be immediately saved. You can delete your saved sections using the delete button on the right. Section will be immediately deleted.\n\n"
                          "6. Student cannot take more than 2 classes in same day.\n\n"
                          "7. Student can only view the selected courses as per his completed credit. Completed credit = Earned credit + running semester taken credit (Without Dropped/Withdraw).\n\n"
                          "8. Backlogged courses will be shown in top of the list as per the credit requirement",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),]
              ),

            ),
          ),
        );
      } );
}



