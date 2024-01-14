import 'package:flutter/material.dart';
import 'package:todo_pbg/constants/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    // void _nextPage() {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => About()));
    // }

    void _todoPage() {
      Navigator.of(context).pop();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: tdBGColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _todoPage();
                },
                child: Icon(
                  Icons.assignment_turned_in,
                  color: tdBlack,
                  size: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _todoPage();
                },
                child: Text(
                  "PBG_TODO",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                child: InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/avatar1.jpg"),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    child: Image.asset("assets/images/avatar1.jpg"),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pritham Baswani Giryalkar",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Software Developer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    )),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                  )),
                  child: Text("Programming has always been my interest in life. I am technology enthusiast pursuing a bachelor in computer science and Engineering. I believe in the thought that the things that challenge you are the ones that improves you.\n\nI am looking forward to learning new skills that will both enrich and help me grow. I have good problem solving skills, good at coding and likes exploring the new things. I am Team-oriented personality, dedicated team player and enjoys working closely with others.\n\nBelieves in the strategy of learning and applying..",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
