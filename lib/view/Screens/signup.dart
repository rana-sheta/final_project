import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shared_preferences/shared_preferences.dart';


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _passVisible = true;
  final formKey=GlobalKey<FormState>();
  TextEditingController emailControler=TextEditingController();
  TextEditingController passwordControler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key:formKey ,
        child: SingleChildScrollView(
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
                Text("Let's Create Yours",
                  style: GoogleFonts.aladin(textStyle:TextStyle(fontSize: 45),color: Colors.black ),
                  //
                ),
                // SizedBox(height: 1,),
                Text("Enter Your Personal Information",
                  style: GoogleFonts.aladin(textStyle:TextStyle(color: Colors.grey.shade700,fontSize: 18), ),
                ) ,
                SizedBox(height: 45,),
                TextFormField(
                  validator: (value){
                    bool isMatch = value!.isEmail();
                    if ( isMatch ){
                      return null;
                    }
                    else{
                      return 'please enter correct email';
                    }
                  },
                  controller: emailControler,
                  decoration:  InputDecoration(
                    labelText:"Email",
                    labelStyle: TextStyle(color: Color.fromARGB(255,85,85,85)),
                    hintText: "Enter the email",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 102, 53, 23),
                        ),
                        borderRadius: BorderRadius.circular(17)
                    ),

                    prefixIcon: Icon(Icons.email,color: Color.fromARGB(255, 102, 53, 23),),
                    border: OutlineInputBorder(
                        borderRadius : BorderRadius.all(Radius.circular(17.0))
                    ),
                  ),

                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value){
                    bool isMatch = value!.isPasswordEasy() ;
                    if ( isMatch ){
                      return null;
                    }
                    else{
                      return 'please enter correct password';
                    }
                  },
                  obscureText: _passVisible,
                  controller:passwordControler,
                  decoration: InputDecoration(
                    labelText:"Password",

                    hintText: "Enter your Pass",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 102, 53, 23),
                        ),
                        borderRadius: BorderRadius.circular(17)
                    ),
                    labelStyle: TextStyle(color: Color.fromARGB(255,85,85,85)),
                    prefixIcon: Icon(Icons.lock,color: Color.fromARGB(255, 102, 53, 23),),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _passVisible=!_passVisible;
                        },);},

                      icon: Icon(_passVisible? Icons.visibility_off: Icons.visibility),color: Color.fromARGB(255, 102, 53, 23),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(17.0)),

                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value){
                    if (value == passwordControler.text){
                      return null;
                    }
                    else{
                      return 'not matched';
                    }
                  },
                  obscureText: _passVisible,
                  decoration: InputDecoration(
                    hintText: "Confirm your pass",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 102, 53, 23),
                        ),
                        borderRadius: BorderRadius.circular(17)
                    ),
                    prefixIcon: Icon(Icons.lock,color: Color.fromARGB(255, 102, 53, 23)),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _passVisible=!_passVisible;
                        },);
                        },

                      icon: Icon(_passVisible? Icons.visibility_off: Icons.visibility),color: Color.fromARGB(255, 102, 53, 23),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(17.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 80,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 102, 53, 23),
                      padding: const EdgeInsets.symmetric(horizontal: 83,vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        firebaseSignUp(emailControler.text, passwordControler.text);
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('email', emailControler.text);
                        Navigator.pushNamed(context, '/bottomNavBar');
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sign Up Failed')));
                      }
                      },

                    child: Text( "Sign Up",style: GoogleFonts.aladin(textStyle:
                    TextStyle(fontSize: 28 , color: Colors.white))),
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",style: TextStyle(color: Colors.grey.shade700),),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child:Text("Login",style:GoogleFonts.aladin(textStyle:
                      TextStyle(fontSize: 22,color: Color.fromARGB(255, 102, 53, 23),fontWeight: FontWeight.bold))) ,
                      onTap: (){
                        Navigator.pushNamed(context, '/loginScreen');
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