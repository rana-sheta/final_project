import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/Screens/login-page.dart';
import 'package:project/view/Screens/signup.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/Background.png"),fit: BoxFit.cover),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child:SingleChildScrollView(
            child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 60,),
                  Text("PLANET",style: GoogleFonts.aladin(textStyle:
                const TextStyle(fontSize: 60,color: Colors.black,letterSpacing: 6
              ),),),
                  Text("S H O E S",style: GoogleFonts.aladin(textStyle:
               const TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 3,height: 1,fontWeight: FontWeight.bold
              ),),),
               const SizedBox(height: 540,),
               ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 102, 53, 23),
                        padding: EdgeInsets.symmetric(horizontal: 83,vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signupScreen');
                      },
                 child: Text( "Start",style: GoogleFonts.aladin(textStyle:
                      const TextStyle(fontSize: 28,letterSpacing: 2, color: Colors.white),),),

                        ),
            ],
          ),

          ),
                  ),
      ),
    );
  }
}
