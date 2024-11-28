import 'dart:async';

import 'package:ewu_portal/logins/mainL.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'createUser.dart';

String? currentUserId;
String? currentUserPass;
 class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override

  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

   @override
@override
  //datas
  bool? value=false;
  final TextEditingController uidcontroler=TextEditingController();
  final TextEditingController pwcontroler=TextEditingController();
  String uid="";
  String pw="";
  String msg="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/ewu_back_logon.jpg'),fit: BoxFit.fill)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 140,bottom: 20),
            height: 650,
            width: 500,
            color: Colors.white,
            child: ListView(
              children: [

                Container(
                  margin: EdgeInsets.only(top:40,left: 20,right: 20,bottom: 20),
                  //height: 70,
                  width: 450,
                  //color: Colors.red,
                  child: Text("1. If your login ID is activated sign in to your account \n  2.If your login ID is not activated please activate your login ID first",
                    style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),
                Container(
                  height: 40,
                  width: 400,
                  //color: Colors.green,
                  child: Text("SIGN IN TO YOUR ACCOUNT",
                    style: TextStyle(color: Colors.grey[700],fontSize: 19,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40),
                  child: TextField(
                    controller: uidcontroler,
                    obscureText: false,
                    decoration: InputDecoration(
                        hintText: 'user ID'),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40,top:20),
                  child: TextField(
                    controller: pwcontroler,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password'
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(left: 40,right: 40,top: 10),
                  height: 50,
                  width: 500,
                  child: Text(msg,style: TextStyle(color: Colors.blue,),),
                  //color: Colors.yellow[100],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 30,top: 10),
                  height: 50,
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,),
                            child:

                            Checkbox(value: value,activeColor: Colors.blue, onChanged: (newBool){
                              setState(() {
                                value=newBool;
                              });
                            })

                          ),
                          Container(
                              child: Text("Remember me",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10,),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.blue[400],elevation: 0 ),
                              onPressed: (){

                                setState(() async {

                                  uid=uidcontroler.text;
                                  pw=pwcontroler.text;

                                  var a= UserList.any((user)=>user.userId==uid && user.userpass==pw);

                                  print(a);

                                    if (a) {
                                      currentUserId=uid;
                                      currentUserPass=pw;
                                      var sharedPref = await SharedPreferences.getInstance();
                                      sharedPref.setBool(mainLState.KEYLOGIN, true);

                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => Home(),
                                          ));
                                    }
                                    else {
                                      msg="Invalid userID and Password";
                                      Timer(Duration(seconds: 1),(){
                                      Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                      builder: (context) =>
                                      loginPage(),

                                      ));
                                      });

                                    }
                                }
                                );



                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                              )
                          ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40,right: 40,top: 10),
                  height: 50,
                  width: 500,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.blue[800],elevation: 0 ,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),onPressed: (){},
                      child: Center(

                        child: Center(child: Text("Forgot your password? Reset it Now",style: TextStyle(color: Colors.white,fontSize: 13),textAlign: TextAlign.center)),
                      )
                  ),
                ),
                Divider(
                  height: 30,
                  indent: 45,
                  endIndent: 45,
                ),
                Container(
                  margin: EdgeInsets.only(left: 60,right: 60,top: 10),
                  height: 50,
                  width: 500,
                  color: Colors.yellow[100],
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.red,elevation: 0 ,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),onPressed: (){

                    //Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>createUser(),

                    ));

                  },
                      child: Center(

                        child: Center(child: Text("Active Your Account First",style: TextStyle(color: Colors.white,fontSize: 16,),textAlign: TextAlign.center,)),
                      )
                  ),
                ),

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                margin: EdgeInsets.only(top: 70),
                height: 100,
                width: 150,
                color: Colors.white,
                child: Image.asset("assets/Logo_of_EWU.jpg"),
              ),
            ],
          )
        ],
      )

    );
  }
}
