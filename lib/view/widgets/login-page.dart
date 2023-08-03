//import 'dart:html';

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/view/widgets/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _passVisible = true;

  final formKey=GlobalKey<FormState>();
  TextEditingController emailControler=TextEditingController();
  TextEditingController passwordControler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Form   (
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                    child:Image(image: AssetImage("assets/lock.jpg")
                    ),
                 // child: Image.asset("lock.jpg",width: 220
                 //   ,alignment: Alignment.centerLeft,),

                 // child:CircleAvatar(
                 //   radius: 120,
                 //     backgroundImage: AssetImage("lock.jpg"),
                 //  // backgroundColor: Colors.white,
                 // ),
               ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20,bottom: 6),
                      child:Text("Login",style: TextStyle(fontSize: 45
                      )),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20,bottom: 20),
                      child:Text("Login to continuo using the app",style: TextStyle(color: Colors.blueGrey),) ,
                    ),

                  ],
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: emailControler,
                      decoration: const InputDecoration(
                          labelText:"Email",
                          hintText: "input your email",
                          prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius : const BorderRadius.all(Radius.circular(17.0))
                        ),
                      ),


                    ),

                ),
                Container(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: TextFormField(
                      obscureText: _passVisible,
                        controller:passwordControler,
                        decoration: InputDecoration(
                          labelText:"Password",
                          hintText: "input your Pass",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                             onPressed: (){
                               setState(() {
                                 _passVisible=!_passVisible;
                               },);
                             },

                              icon: Icon(_passVisible? Icons.visibility_off: Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderRadius : const BorderRadius.all(Radius.circular(17.0)),

                          ),
                        ),
                    ),

                ),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: 30),
                    child:Row(
                      children: [
                        Text("Don't hane an account? ",style: TextStyle(color: Colors.grey),),
                        InkWell(
                          child:Text("Register",style: TextStyle(color: Colors.blue)) ,
                        )
                      ],
                    )),
                SizedBox(height: 20,),

                ElevatedButton(
                     style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 80,vertical: 17),
                    ),
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content:Text('submitting login')),);


                        bool result=await firebaseLogin(emailControler.text, passwordControler.text);
                        if(result) {
                          final SharedPreferences prefs = await SharedPreferences
                              .getInstance();
                          await prefs.setString('email', emailControler.text);

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                signup(
                                  //email:emailControler.text)),
                                ),),);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("login faild")));
                        }
                      }
                    },
                    child: Text( "Log in",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 24),)
                ),


              ],

            ),
          ),
        ),
      ),
    );
  }
  Future<bool> firebaseLogin(String email,String password) async {
    try {
      final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(credential.user !=null){
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}