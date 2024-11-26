import 'package:ewu_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Advising_rule.dart';
import '../DegreeReview.dart';
import '../FacEvaluation.dart';
import '../GradeReport.dart';
import '../InstallmentPayment.dart';
import '../MyAccLeadger.dart';
import '../OfferedCourse.dart';
import '../Profile.dart';
import '../SemesterDrop.dart';
import '../UploadDoc.dart';
import '../advising.dart';
import '../classSche.dart';
import '../convo.dart';
import '../curriculumn/Curriculumn.dart';
import 'createUser.dart';
import 'loginPage.dart';
import 'mainL.dart';
GlobalKey<ScaffoldState> key = GlobalKey();

class updatePass extends StatefulWidget {
  const updatePass({super.key});

  @override
  State<updatePass> createState() => _updatePassState();
}

class _updatePassState extends State<updatePass> {
  //datas
  bool? cvalue=false;

  final TextEditingController cpcontroler=TextEditingController();

  final TextEditingController npwcontroler=TextEditingController();

  final TextEditingController cnpwcontroler=TextEditingController();

  String cp="";

  String npw="";

  String cnpw="";

  String cmsg="";

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
              builder: (context)=> Home(),
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
          PopupMenuButton(
            // style: ,
            itemBuilder: (context)=>[

              PopupMenuItem(child: Row(
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


            ],icon: FaIcon(FontAwesomeIcons.userCog,size: 25,color: Colors.white,),color: Colors.white,)
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
      body:
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),

          child: Column(
            //padding: EdgeInsets.only(top:20),
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
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 0,bottom: 20,left: 35),
                height: 40,
                width: 400,
                //color: Colors.green,
                child: Text("CHANGE PASSWORD",
                  style: TextStyle(color: Colors.grey[800],fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40),
                child: TextField(
                  controller: cpcontroler,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Enter Old Password'),

                ),
              ),
              Container(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40,top:20),
                child: TextField(
                  controller: npwcontroler,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter New Password'
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40,top:20),
                child: TextField(
                  controller: cnpwcontroler,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Confirm New Password'
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 40,right: 40,top: 10),
                height: 50,
                width: 500,
                child: Text(cmsg,style: TextStyle(color: Colors.blue,),),
                //color: Colors.yellow[100],
              ),




              Container(
                margin: EdgeInsets.only(left: 40,right: 40,top: 10),
                height: 50,
                width: 500,
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.blue[800],elevation: 0 ,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),onPressed: (){

                  setState(() {

                    cp=cpcontroler.text;
                    npw=npwcontroler.text;
                    cnpw=cnpwcontroler.text;

                    bool a=cnpw==npw;


                    print(a);
                    for (var obj in UserList) {
                      print('${obj.userId}, ${obj.userpass}');}

                    if(cp=="" || npw=="" || cnpw==""){
                    cmsg="Please enter Pssword";
                    }
                    else if(cp!=currentUserPass){
                      cmsg="Wrong old password";
                    }
                    else if(npw!=cnpw){
                      cmsg="New Password does not Match";
                    }
                    else if(cnpw==npw  && npw!="" && cp==currentUserPass){
                      for (var obj in UserList) {
                        if( '${obj.userId}'==currentUserId && '${obj.userpass}'==cp){
                          obj.userpass=npw;
                          //print("Found");
                          currentUserPass=npw;
                          cmsg="Password changed Successfully";

                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>Home(),
                          ));
                        };

                      }
                      createUserState.saveIntoSp();


                    }
                    else
                      cmsg="invalid Pssword";
                  }

                  );

                },
                    child: Center(
                      child: Center(child: Text("Create Account",style: TextStyle(color: Colors.white,fontSize: 19),textAlign: TextAlign.center)),
                    )
                ),
              ),
              Divider(
                height: 30,
                indent: 45,
                endIndent: 45,
              ),


            ],
          ),
        ),
      ),




    );;
  }
}
