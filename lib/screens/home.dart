import 'package:flutter/material.dart';
import 'package:todo_pbg/constants/colors.dart';
import 'package:todo_pbg/screens/about.dart';
import 'package:todo_pbg/screens/homeMain.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: tdBGColor,
        appBar: AppBar(
          backgroundColor: tdBGColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.assignment_turned_in,
                color: tdBlack,
                size: 30,
              ),
              Text(
                "PBG_TODO",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 40,
                width: 40,
                child: InkWell(
                  onTap: _nextPage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/avatar1.jpg"),
                  ),
                ),
              )
            ],
          ),
        ),
        body: HomeMain(),
      ),
    );
  }

  void _nextPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => About())
    );
  }
}
