import 'package:first_app/login/page1.dart';
import 'package:first_app/login/page2.dart';
import 'package:first_app/login/page3.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  String email;
   home({super.key,required this. email});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentindex =0;
  List<Widget>pages =[
    page1(),
    page2(),
    page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
         icon: Icon(Icons.arrow_back_ios)
        ),
      ),
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "page1"),
        BottomNavigationBarItem(icon: Icon(Icons.security),label: "page2"),
        BottomNavigationBarItem(icon: Icon(Icons.more),label: "page3"),

      ],
      onTap: (value) {
        currentindex =value;
        setState(() {
          
        });

      },
      ),
    
    );
  }
}