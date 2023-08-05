import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/widgets/login-page.dart';
import 'package:regexpattern/regexpattern.dart';

import 'after_login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _passVisible = true;
  final _formKey=GlobalKey<FormState>();
  TextEditingController emailControler=TextEditingController();
  TextEditingController passwordControler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // //   title: Center(
      // //     child: SizedBox(height: 80,
      // //         width: 150,
      // //         child: Image(image: AssetImage('assets/text.png'),)),
      // //   ),
      // // ),
      body:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(

              children: [SizedBox(height: 20,),
                Text("PLANET",style: GoogleFonts.
                aladin
                  (textStyle:
              TextStyle(fontSize: 38,color: Colors.black,letterSpacing: 6
              ),),
                ),
                Text("S H O E S",style: GoogleFonts.aladin(textStyle:
                TextStyle(fontSize: 20,color: Colors.black,letterSpacing: 3,height: 1,fontWeight: FontWeight.bold
                ),),),
                SizedBox(height: 100,width: 100,
                  child: Image(image: AssetImage("assets/logoo.png"),
                  ),

                ),

                SizedBox(height: 20,),
                Text("Let's Create Yours",style: GoogleFonts.aladin(textStyle:TextStyle(fontSize: 45) ),
                  //
                ),
                // SizedBox(height: 1,),
                Text("Enter Your Personal Information",style: GoogleFonts.aladin(textStyle:TextStyle(color:Colors.grey.shade700,fontSize: 18), ),
                ) ,
                SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText:"User Name",
                    hintText: "Full name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius : BorderRadius.all(Radius.circular(20.0))
                    ),
                  ),
                  validator: (value){
                    bool isMatch = value!.isUsername();
                    if ( isMatch ){
                      return null;
                    }
                    else{
                      return 'please enter correct username';
                    }
                  },

                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: emailControler,
                  decoration: const InputDecoration(
                    labelText:"Email",
                    hintText: "Email Address",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius : BorderRadius.all(Radius.circular(20.0))
                    ),
                  ),
                  validator: (value){
                    bool isMatch = value!.isEmail();
                    if ( isMatch ){
                      return null;
                    }
                    else{
                      return 'please enter correct email';
                    }
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  obscureText: _passVisible,
                  controller:passwordControler,
                  decoration: InputDecoration(
                    labelText:"Password",
                    hintText: "Creat new pass",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _passVisible=!_passVisible;
                        },);},

                      icon: Icon(_passVisible? Icons.visibility_off: Icons.visibility),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  validator: (value){
                    bool isMatch = value!.isPasswordEasy() ;
                    if ( isMatch ){
                      return null;
                    }
                    else{
                      return 'please enter correct password';
                    }
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  obscureText: _passVisible,
                  decoration: InputDecoration(
                    hintText: "Confirm your pass",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _passVisible=!_passVisible;
                        },);},

                      icon: Icon(_passVisible? Icons.visibility_off: Icons.visibility),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  validator: (value){
                    if (value == passwordControler.text){
                      return null;
                    }
                    else{
                      return 'not matched';
                    }
                  },
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 83,vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()){
                        firebaseSignUp(emailControler.text, passwordControler.text);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              after_login(),),);
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sign Up Failed')));
                      }

                      },

                    child: Text( "Sign Up",style: GoogleFonts.aladin(textStyle:
                    TextStyle(fontSize: 28),)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",style: TextStyle(color: Colors.grey.shade700),),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child:Text("Login",style:GoogleFonts.aladin(textStyle:
                      TextStyle(color: Colors.blue,fontSize: 22))) ,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            login(),
                        ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
  firebaseSignUp(String email , String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}