import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
     // backgroundColor: Colors.brown,
      body:Form   (
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("PLANET",style: GoogleFonts.aladin(textStyle:
                TextStyle(fontSize: 38,color: Colors.black,letterSpacing: 6
                ),),),
                Text("S H O E S",style: GoogleFonts.aladin(textStyle:
                TextStyle(fontSize: 20,color: Colors.black,letterSpacing: 3,height: 1,fontWeight: FontWeight.bold
                ),),),
                 SizedBox(height: 150,width: 150,
                   child: Image(image: AssetImage("assets/logoo.png"),
                   ),
                 ),
                SizedBox(height: 20,),
                   Text("Welcome Back",style: GoogleFonts.aladin(textStyle:
                  TextStyle(fontSize: 47
                  ),),),
               // SizedBox(height: 1,),
                Text("Login to continue using the app",style:  GoogleFonts.aladin(textStyle:
                TextStyle(color: Colors.grey.shade700,fontSize:20),) ,),
                SizedBox(height: 30,),
                TextFormField(
                  controller: emailControler,
                  decoration:  InputDecoration(
                      labelText:"Email",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 85,85,85)),
                      hintText: "input your email",
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
                  obscureText: _passVisible,
                    controller:passwordControler,
                    decoration: InputDecoration(
                      labelText:"Password",
                      //labelStyle: TextStyle(color: Color.fromARGB(255, 102, 53, 23)),
                      hintText: "input your Pass",
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
                Padding(
                  padding: EdgeInsets.only(left: 200,top: 15),
                  child: Text("Forget your password?",style: TextStyle(color: Colors.grey.shade700),),
                ),
                SizedBox(height: 70,),

                ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Color.fromARGB(255, 102, 53, 23),
                        padding: EdgeInsets.symmetric(horizontal: 83,vertical: 14),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),),
                    ),
                    onPressed: () async {
                      // if(formKey.currentState!.validate()){
                        bool result=await firebaseLogin(emailControler.text, passwordControler.text);
                        if(result) {
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('email', emailControler.text);
                          Navigator.pushNamed(context, '/bottomNavBar');
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login Failed",style: TextStyle(fontSize: 20),)));
                        }
                      // }
                    },
                    child: Text( "Log in",style: GoogleFonts.aladin(textStyle:
                    TextStyle( fontSize: 28, color: Colors.white),)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",style: TextStyle(color: Colors.grey.shade700,fontSize: 16),),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child:
                      Text("Register",style: GoogleFonts.aladin(textStyle:
                      TextStyle(color: Color.fromARGB(255, 102, 53, 23),fontSize: 20,fontWeight: FontWeight.bold))) ,
                      onTap: (){
                        Navigator.pushNamed(context, '/signupScreen');
                      },
                    )
                  ],
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