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

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // //   title: Center(
      // //     child: SizedBox(height: 80,
      // //         width: 150,
      // //         child: Image(image: AssetImage('assets/text.png'),)),
      // //   ),
      // // ),
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
              Text("Let's Create Yours",style: GoogleFonts.aladin(textStyle:TextStyle(fontSize: 45) ),
                //
              ),
              // SizedBox(height: 1,),
              Text("Enter Your Personal Information",style: GoogleFonts.aladin(textStyle:TextStyle(color: Colors.blueGrey,fontSize: 18), ),
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

              ),
              SizedBox(height: 25,),
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

              ),
              SizedBox(height: 25,),
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
              ),
              SizedBox(height: 25,),
              TextFormField(
                obscureText: _passVisible,
                controller:passwordControler,
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
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 83,vertical: 17),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                  ),
                  onPressed: () async {

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          after_login(),),);},

                  child: Text( "Sign Up",style: GoogleFonts.aladin(textStyle:
                  TextStyle(fontSize: 28),)),
              ),

              Container(
                  margin: EdgeInsets.only(left: 78,top: 17),
                  child:Row(
                    children: [
                      Text("Already have an account? ",style: TextStyle(color: Colors.grey),),
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
                  )),
            ],
          ),
        ),
      ) ,
    );
  }
}