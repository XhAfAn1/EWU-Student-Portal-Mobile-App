// ignore_for_file: prefer_const_constructors

import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:ewu_portal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'classSche.dart';


GlobalKey<ScaffoldState> key = GlobalKey();


class Curriculumn extends StatelessWidget {
  const Curriculumn({super.key});
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  margin: EdgeInsets.only(right: 3),height: 40,width: 230,
                  child: ElevatedButton.icon(onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
                    label: Text("Show My Program Curriculumn",style: TextStyle(color: Colors.white,fontSize: 12),),
                      icon: FaIcon(FontAwesomeIcons.bookOpen,color: Colors.white,size: 10,),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4),height: 40,width: 150,
                  child: ElevatedButton.icon(onPressed: (){

                  },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
                    label: Text("Show Blue Book",style: TextStyle(color: Colors.white,fontSize: 12),),
                    icon: FaIcon(FontAwesomeIcons.book,color: Colors.white,size: 10,),),
                )
              ],
            ),
          ),
          Container(
            height: 30,

          ),
        ],
      )


    );
  }
}
