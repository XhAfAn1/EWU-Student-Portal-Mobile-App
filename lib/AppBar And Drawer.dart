
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Profile.dart';
import 'logins/loginPage.dart';
import 'logins/mainL.dart';

class myAppbar extends StatefulWidget {
  const myAppbar({super.key});

  @override
  State<myAppbar> createState() => _myAppbarState();
}

class _myAppbarState extends State<myAppbar> {
  bool isVisible = true;
  void truMsg() {
    setState(() {
      isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      title: TextButton(
        child: Image.asset(
          "assets/logonn.png",
          width: 200,
          height: 50,
          alignment: Alignment.topLeft,

        ),
        onPressed: (){truMsg();
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
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 40, 65, 111),
                Color.fromARGB(255, 40, 65, 111),
              ],
            )),
      ),
      iconTheme:IconThemeData(color: Colors.black, size: 40),

      actions: [
        PopupMenuButton(itemBuilder: (context)=>[

          PopupMenuItem(child: TextButton.icon(icon: FaIcon(FontAwesomeIcons.user,size: 16,color: Colors.black,),onPressed:(){

            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=> profile(),
            ));
          } ,
            label: Text("   Profile      ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),),


          ),

          PopupMenuItem(child: TextButton.icon(icon: FaIcon(FontAwesomeIcons.signInAlt,size: 16,color: Colors.black,),onPressed:() async {

            var sharedPref= await SharedPreferences.getInstance();
            sharedPref.setBool(mainLState.KEYLOGIN, false);

            // Navigator.pop(context);
            Navigator.of(context).pop(true);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context)=>loginPage(
              ),

            ));
          } ,
            label: Text("   LogOut      ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),)
          ),
        ],icon: FaIcon(FontAwesomeIcons.userCog,size: 25,color: Colors.white,),color: Colors.white,)
      ],
    );
  }
}
