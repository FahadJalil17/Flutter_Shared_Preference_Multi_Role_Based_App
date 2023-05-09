import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muti_role_based_app/view/home_screen.dart';
import 'package:muti_role_based_app/view/student_screen.dart';
import 'package:muti_role_based_app/view/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserLogin();
  }

  void isUserLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin") ?? false;
    String userType = sp.getString("userType") ?? '';

    if(isLogin){ // here it is true
      if(userType == 'student'){
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      }
      else if(userType == 'teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }
      else{
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }

    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Image(
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
        image: NetworkImage("https://images.pexels.com/photos/13988977/pexels-photo-13988977.jpeg?auto=compress&cs=tinysrgb&w=600"),
      ),
    );
  }
}

