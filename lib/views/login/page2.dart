import 'package:first_app/models/todo_model.dart';
import 'package:first_app/service/todo_service.dart';
import 'package:first_app/views/login/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context) => TodoCubit(),
      child: BlocConsumer<TodoCubit,TodoState>(
        builder:(context,state){
          if(state is TodoLoading){
            return Center(
              child: CircularProgressIndicator(),
              );
          }
          if(state is TodoErorr){
            return Center(
              child: Text("Error"),
              );
          }
          return ListView.builder(
      itemCount: context.watch<TodoCubit>().todo.length,
      itemBuilder: (BuildContext context,int index){
        return ListTile(
          title:
            Text(context.watch<TodoCubit>().todo[index].title??"--"),
          trailing: Icon(Icons.book_sharp),
        );
      },
    );
  } ,
  listener: (context, state) {},
        )
);
    
   
  }
}
  