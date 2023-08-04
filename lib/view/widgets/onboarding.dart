import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Center(
                child:Image(image: AssetImage("assets/shoes.png") ,
              ),
              ),
              SizedBox(height: 30,),
              Text("Every Purchase Will Be Made With Pleasure",style: TextStyle(fontSize: 38,fontStyle: FontStyle.italic),),
              SizedBox(height: 15,),
              Text("Buying goods services using the internet"
              ,style: TextStyle(color: Colors.blueGrey,fontStyle: FontStyle.italic,fontSize:15),),
            ],
          ),
        ),
      ),
    );
  }
}
