import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/widgets/info.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}
class _AboutUsState extends State<AboutUs> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios) , onPressed: () {
          Navigator.of(context).pop();
        },),
          title: Text("ABOUT US" , style: GoogleFonts.aladin(textStyle:
                TextStyle(fontSize: 60,color: Color.fromARGB(207, 102, 53, 23),letterSpacing: 6 
                ),),),
                centerTitle: true,
        ),
        body:Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20 ,left: 40 ,right: 30),
              child: Column(
                children: [
                  SizedBox(height: 10,),

                Container(
                  child: Text(
                  " We started an excitement journey in 2005. In this journey we set off to bring a fresh new perspective to Turkish fashion and bring together our brand new, quality and unique designs with consumers at four corners of the World, we put our signature under very important Works and achievements." , style: GoogleFonts.caladea(textStyle: 
                  TextStyle(fontSize: 20 , fontWeight: FontWeight.w300 ,color: Colors.black,letterSpacing: 3 , 
                  ),),),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 20 ,left: 30 ,right: 30),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("AVAILABLE IN :", style: GoogleFonts.aladin(textStyle: 
                                      TextStyle(fontSize: 45 , fontWeight: FontWeight.w500 ,color:Color.fromARGB(207, 102, 53, 23) ,letterSpacing: 6 
                                      ),),),

                        Text("33 COUNTRIES", style: GoogleFonts.caladea(textStyle: 
                                      TextStyle(fontSize: 30 , fontWeight: FontWeight.w400 ,color:Colors.black ,letterSpacing: 3 
                                      ),),),
                        
                
                        Text("& 300 STORE",style: GoogleFonts.caladea(textStyle: 
                                      TextStyle(fontSize: 30 , fontWeight: FontWeight.w400 ,color:Colors.black,letterSpacing: 3 
                                      ),),),
                        
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                  Padding(
                  padding:EdgeInsets.only(top: 20 ,left: 30 ,right: 30),
                  child: Container(
                    child: Text("Most important of all; we were born in Turkey and realized our purpose to become a global brand. We have adopted innovation and renewal as a corporate culture. In this line, we have created sub-brands aimed to needs of everyone. Today, we touch lives of our consumers in more than 100 countries at more than 500 stores with our DeFacto Baby, DeFacto COOOL, DeFacto Fit, DeFacto STUDIO, DF LIFE, DF Plus sub-brands. we made room for DeFacto brand which we placed as the founder of Accessible Fashion concept and Pioneer of innovation, in wardrobes in everyone. With our experienced, innovative design team and important cooperation, we offer range of products which will allow our consumers to feel the change with quality product and affordable prices and we work hard to ensure that this mission is sustainable." ,
                    style: GoogleFonts.caladea(textStyle: 
                                    TextStyle(fontSize: 20 , fontWeight: FontWeight.w300 ,color: Colors.black,letterSpacing: 3 
                                    ),),),
                  ),
                   ),

                   SizedBox(height:40),
                   Container(
                    child:Column(
                      children: [
                        Text("CONTACT US :", style: GoogleFonts.aladin(textStyle: 
                                      TextStyle(fontSize: 45 , fontWeight: FontWeight.w500 ,color:Color.fromARGB(207, 102, 53, 23) ,letterSpacing: 6 
                                      ),),),
                        Row( 
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.facebook_rounded), color: Colors.black, iconSize: 50,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.phone_android_rounded), color: Colors.black, iconSize: 50,),
                          ],
                        ),

                        SizedBox(height: 40),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Color.fromARGB(255, 102, 53, 23),
                        padding: EdgeInsets.symmetric(horizontal: 83,vertical: 14),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                    ),
                     onPressed: () async {
              if(_formkey.currentState!.validate()){

                Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  Info(
                //UserName: UserNamecontroller.text,
                )),
                );
              }
            },
                     child: Text( "NEXT",style: GoogleFonts.aladin(textStyle:
                    TextStyle( fontSize: 28, color: Colors.white,),)),
                ),
                        
                        ],
                    ),
                   ),
                ],
              ),
              
            ),
          ),
        ) ,
        
    );
  }
}
