import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/widgets/login-page.dart';

import 'after_login.dart';

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
      body:SingleChildScrollView(
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
              Text("Let's Create Yours",style: GoogleFonts.aladin(textStyle:TextStyle(fontSize: 45),color: Colors.brown ),
                //
              ),
              // SizedBox(height: 1,),
              Text("Enter Your Personal Information",style: GoogleFonts.aladin(textStyle:TextStyle(color: Colors.black38,fontSize: 18), ),
              ) ,
              SizedBox(height: 30,),
              TextFormField(
                decoration:  InputDecoration(
                  labelText:"User Name",
                  labelStyle: TextStyle(color: Color.fromARGB(255,85,85,85)),
                  hintText: "Full name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 102, 53, 23),
                      ),
                      borderRadius: BorderRadius.circular(17)
                  ),
                  prefixIcon: Icon(Icons.person,color: Color.fromARGB(255,85,85,85)),
                  border: OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(20.0)),

                  ),
                ),

              ),
              SizedBox(height: 25,),
              TextFormField(
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

                  prefixIcon: Icon(Icons.person,color: Color.fromARGB(255, 102, 53, 23),),
                  border: OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(17.0))
                  ),
                ),

              ),
              SizedBox(height: 25,),
              TextFormField(
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
              SizedBox(height: 25,),
              TextFormField(
                obscureText: _passVisible,
                controller:passwordControler,
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
                      },);},

                    icon: Icon(_passVisible? Icons.visibility_off: Icons.visibility),color: Color.fromARGB(255, 102, 53, 23),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius : BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 102, 53, 23),
                    padding: EdgeInsets.symmetric(horizontal: 83,vertical: 17),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                  ),
                  onPressed: () async {

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          after_login(),),);},

                  child: Text( "Sign Up",style: GoogleFonts.aladin(textStyle:
                  TextStyle(fontSize: 28))),
              ),

              Container(
                  margin: EdgeInsets.only(left: 78,top: 17),
                  child:Row(
                    children: [
                      Text("Already have an account? ",style: TextStyle(color: Colors.black38),),
                      InkWell(
                        child:Text("Login",style:GoogleFonts.aladin(textStyle:
                        TextStyle(fontSize: 22,color: Color.fromARGB(255, 102, 53, 23)))) ,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              login(),
                          ),
                          );
                        },
                      )
                    ],
                  )),
            ],
          ),
        ),
      ) ,
    );
  }
}