import 'package:first_app/models/todo_model.dart';
import 'package:first_app/service/todo_service.dart';
import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  bool isLoading = true;
  List<Todomodele>todos = [];

  getTodos() async {
    todos = await todoService().gettodo();
    isLoading =false;
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    
    getTodos();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ?
    Center(child: CircularProgressIndicator(),)
    : ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context,int index){
        return ListTile(
          title:Text(todos[index].title??"--"),
          trailing: Icon(Icons.book_sharp),
        );
      },
    );
  }
}
  