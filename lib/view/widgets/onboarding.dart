import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/widgets/login-page.dart';
import 'package:project/view/widgets/signup.dart';

class onboarding_screen extends StatefulWidget {
  const onboarding_screen({super.key});

  @override
  State<onboarding_screen> createState() => _onboarding_screenState();
}

class _onboarding_screenState extends State<onboarding_screen> {
  @override
  Widget build(BuildContext context) {
    return  Container(constraints: BoxConstraints.expand(),
      //margin: EdgeInsets.all(value),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/Background.png"),fit: BoxFit.cover),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 30,left: 60),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 60,),
                  Text("PLANET",style: GoogleFonts.aladin(textStyle:
                TextStyle(fontSize: 60,color: Colors.black,letterSpacing: 6
              ),),),
                  Text("S H O E S",style: GoogleFonts.aladin(textStyle:
               TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 3,height: 1,fontWeight: FontWeight.bold
              ),),),
               SizedBox(height: 540,),
               ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 102, 53, 23),
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 17),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              login(),),);
                      }, child: Text( "Start",style: GoogleFonts.aladin(textStyle:
                      TextStyle(fontSize: 32,letterSpacing: 2),),),

                        ),
            ],
          ),
        ),
      ),
    );
  }
}
