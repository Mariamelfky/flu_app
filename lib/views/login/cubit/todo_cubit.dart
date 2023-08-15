import 'package:bloc/bloc.dart';
import 'package:first_app/models/todo_model.dart';
import 'package:first_app/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()){
    getTodo();

  }
  List<Todomodele> todo =[];
  getTodo() async {
    try{
      emit(TodoLoading());
      todo =await todoService().gettodo();
      emit(TodoSuccess());
    }catch(e){
      emit(TodoErorr());
    }
  }
}
