import 'package:ewu_portal/Advising_rule.dart';
import 'package:ewu_portal/Curriculumn.dart';
import 'package:ewu_portal/Profile.dart';
import 'package:ewu_portal/classSche.dart';
import 'package:ewu_portal/logins/createUser.dart';
import 'package:ewu_portal/logins/loginPage.dart';
import 'package:ewu_portal/logins/mainL.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class Home extends StatelessWidget {
  const Home({super.key});

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
            PopupMenuButton(itemBuilder: (context)=>[

              PopupMenuItem(child: TextButton.icon(icon: FaIcon(FontAwesomeIcons.user,size: 16,color: Colors.black,),onPressed:(){

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> profile(),
                ));
              } ,
                label: Text("   Profile      ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),)
              ),


              PopupMenuItem(child: TextButton.icon(icon: FaIcon(FontAwesomeIcons.signInAlt,size: 16,color: Colors.black,),onPressed:() async {

                var sharedPref= await SharedPreferences.getInstance();
                sharedPref.setBool(mainLState.KEYLOGIN, false);

                Navigator.pop(context);
                Navigator.of(context).pop(true);
                //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Home(),),(route) => false);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>loginPage(
                  ),

                ));
              } ,
                label: Text("   LogOut      ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),)
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

        body:StackExample()

        );
  }
}

class StackExample extends StatefulWidget {
  @override
  _StackExampleState createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  List<Widget> _stackWidgets = [];

  @override
  void initState() {
    super.initState();
    _stackWidgets = [
      Container(
        margin: const EdgeInsets.all(10.0),
        width: 800,
        height: 50,
        color: Color.fromARGB(255, 217, 237, 247),
      ),
      Container(
        margin: const EdgeInsets.all(25.0),
        width: 800,
        height: 50,
        child: Text(
          'Welcome to East West University Student Portal!',
          style: TextStyle(
              color: Color.fromARGB(255, 49, 112, 169),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(12.0),
        child: Builder(
          builder: (context) {
            return Container(
              child: TextButton(
                onPressed: () {
                  _removeAllWidgets();
                },
                child: FaIcon(
                  FontAwesomeIcons.close,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            );
          },
        ),
      ),

    ];
  }

  void _removeAllWidgets() {
    setState(() {
      _stackWidgets.clear();
    });
  }

  Widget build(BuildContext context) {
    // Define the stack as a variable
    Widget stack = Stack(
      alignment: Alignment.topRight,
      children: _stackWidgets,
    );
    // Use the stack variable in your widget tree

    return stack;
  }
}


