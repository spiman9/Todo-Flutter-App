import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_pbg/constants/colors.dart';
import 'package:todo_pbg/screens/home.dart';
// import 'package:todo_pbg/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: tdBGColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "TODO APP",
              style: TextStyle(
                color: tdBlack,
                decoration: TextDecoration.none
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("-Developed by PBG_error3" , style: TextStyle(
            fontSize: 14,
            color: tdBlack,
            decoration: TextDecoration.none
          ),),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Image.asset("assets/images/avatar_main.png"),
            width: 80,
            height: 80,
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 140,
            child: LinearProgressIndicator()),
        ],
      ),
    );
  }
}
