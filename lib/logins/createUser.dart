
import 'dart:convert';

import 'package:ewu_portal/logins/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'createUser.dart';

class user{
  String? userId;
  String? userpass;
  user({this.userId,this.userpass});

  factory user.fromJson(Map<String, dynamic> json) => user(
    userId: json["userId"],
    userpass: json["userpass"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userpass": userpass,
  };

}
//List<user> UserList = List.empty(growable: true);

List<user> UserList=[user(userId: 'admin',userpass: 'admin'),
  user(userId: 'admin',userpass: 'password'),
];






class createUser extends StatefulWidget {
  const createUser({super.key});

  @override

  State<createUser> createState() => createUserState();

}

class createUserState extends State<createUser> {

  //datas
  bool? cvalue=false;
  final TextEditingController uidcontroler=TextEditingController();
  final TextEditingController pwcontroler=TextEditingController();
  final TextEditingController cpwcontroler=TextEditingController();
  String uid="";
  String pw="";
  String cpw="";
  String cmsg="";
 bool obscuretext1=true;
  bool obscuretext2=true;

  //storing the userinfo in sharedPref


  @override
  static late SharedPreferences sp;
  void initState() {
    super.initState();
    getSharedPreferences();
  }
  static getSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
    readFromSp();
  }
  static saveIntoSp(){
  List<String>spuserList= UserList.map((user)=>jsonEncode(user.toJson())).toList();
  sp.setStringList('userData', spuserList);
  }
  static readFromSp(){
    List<String>? spuserList= sp.getStringList('userData');

    if (spuserList != null) {
      UserList = spuserList.map((userString) => user.fromJson(jsonDecode(userString))).toList();
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body:


        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 170,bottom: 20),
            height: 650,
            width: 500,
            color: Colors.white,
            child: Column(
              //padding: EdgeInsets.only(top:20),
              children: [
                Container(
          
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  height: 100,
                  width: 150,
                  color: Colors.white,
                  child: Image.asset("assets/Logo_of_EWU.jpg"),
                ),
          
                Container(
                  margin: EdgeInsets.only(top: 0,bottom: 20),
                  height: 40,
                  width: 400,
                  //color: Colors.green,
                  child: Text("CREATE ACCOUNT",
                    style: TextStyle(color: Colors.grey[800],fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40),
                  child: TextField(
                    controller: uidcontroler,
                    obscureText: false,
                    decoration: InputDecoration(
                        hintText: 'Enter UserID'),
          
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40,top:20),
                  child: TextField(
                    controller: pwcontroler,
                    obscureText: obscuretext1,
                    decoration: InputDecoration(
                        hintText: 'Enter Password',
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            obscuretext1=!obscuretext1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FaIcon((obscuretext1? FontAwesomeIcons.solidEye:
                          FontAwesomeIcons.eye ),size: 20,),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40,top:20),
                  child: TextField(
                    controller: cpwcontroler,
                    obscureText: obscuretext2,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            obscuretext2=!obscuretext2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FaIcon((obscuretext2? FontAwesomeIcons.solidEye:
                          FontAwesomeIcons.eye ),size: 20,),
                        ),
                      ),
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

                      uid=uidcontroler.text;
                      pw=pwcontroler.text;
                      cpw=cpwcontroler.text;

                      bool a=cpw==pw;


                      print(a);

                      if(cpw==pw && uid!="" && pw!=""){
                        UserList.add(user(userId: uid,userpass: pw));
                        saveIntoSp();
                        for (var obj in UserList) {
                          print('${obj.userId}, ${obj.userpass}');
                        }
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>loginPage(),
                        ));

                      }
                      else if(uid=="" || pw=="" || cpw==""){
                        cmsg="Please enter UserID and Pssword";
                      }
                      else
                        cmsg="invalid UserID and Pssword";
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




    );
  }
}
