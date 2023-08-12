import 'package:dio/dio.dart';
import 'package:first_app/models/todo_model.dart';
import 'package:flutter/material.dart';

class todoService {
  
  String URL ="https://jsonplaceholder.typicode.com/todos";
  Future<List<Todomodele>>gettodo() async {
    List<Todomodele> todoList =[];
     final response = await Dio().get(URL);
     var data = response .data;
     data.forEach((element){
      Todomodele todo = Todomodele.fromJson(element);
      todoList.add(todo);
     });
     return todoList;

  }
  }
