import 'dart:async';

import 'package:ewu_portal/logins/createUser.dart';
import 'package:ewu_portal/logins/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';




class mainL extends StatefulWidget {
  const mainL({super.key});

  @override
  State<mainL> createState() => mainLState();
}

class mainLState extends State<mainL> {


  @override
  static const String KEYLOGIN ="login";
  late SharedPreferences sharedPref;
  void initState() {
    // TODO: implement initState
    super.initState();
    createUserState.getSharedPreferences();
      wheretoGo();
  }

  Widget build(BuildContext context) {
    return const loginPage();
  }

  Future<void> wheretoGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isloggedin = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 0),(){
      if(isloggedin!=null){
        if(isloggedin){

          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=>Home(
            ),
          ));
        }
        else{

          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=>loginPage(
            ),
          ));
        }
      }else{


        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>loginPage(
          ),
        ));
      }
    }
    );
  }
}
