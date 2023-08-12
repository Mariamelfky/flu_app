import 'package:first_app/views/login/page1.dart';
import 'package:first_app/views/login/page2.dart';
import 'package:first_app/views/login/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class login extends StatefulWidget {
  
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(width: 200,
          height: 40,
          ),
          Image.asset("asset/download.jpeg"),
          Container(width: 200,
          height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(labelText: "email"),
              validator: (value) {
                if (value == null || value.contains("@")==false) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:TextFormField(
              decoration: InputDecoration(labelText: "passoword"),
              validator: (value) {
                if (value == null || value.length<8) {
                  return 'Please enter valid password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: () async {
              if (_formKey.currentState!.validate()){
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('email', emailcontroller.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => home(
                      email:emailcontroller.text,
                    )),        
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("success"),
                    ),
                );
              }
            },
            child:           Container(
            width: 350,
            height: 60,
            decoration:
              BoxDecoration(color: Color.fromARGB(255, 133, 185, 209),
            borderRadius: BorderRadius.circular(10)
              ),
            child: 
            Center(
              child: Text("login",style:TextStyle(color: const Color.fromARGB(255, 249, 247, 247),fontSize: 25,
          ),
          ),
          ),
          ),

          ),
          Container(
            width: 200,
            height: 40,
          ),
          SizedBox(height: 20,),
          Text(
            "forget password? No yawa.tap me" ,style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 112, 112, 112)),
          ),
          Container(width: 200,
          height: 40,
          ),
          Container(width: 350,
          height: 50,
          color: Color.fromARGB(255, 202, 214, 222),
          child:Center(child: Text("No Accont?sign up",style: TextStyle(fontSize: 20),),)
          ),
          SizedBox(height: 20,),
        ] ),
        ))
    );
  }
}