import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return  Scaffold(

      body: SingleChildScrollView(
        child: Stack(
          children:[ Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(

              children: [
                Image(image: AssetImage("assets/ground.png") ,fit: BoxFit.fill,height: 833,width: 400,
                ),

                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100,vertical: 17),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        login(),),);
                }, child: Text( "Login",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 28),),

                  ),
                SizedBox(height: 30,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white60,
                    shadowColor: Colors.black,

                    padding: EdgeInsets.symmetric(horizontal: 90,vertical: 17),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          signup(),),);
                  }, child: Text( "Register",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 28,color: Colors.black),),

                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
