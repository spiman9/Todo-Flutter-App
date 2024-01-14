import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_pbg/screens/splashScreen.dart';
// import 'package:todo_pbg/screens/home.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner:false, home: MainApp()) );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    // return Home();
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
