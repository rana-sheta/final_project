import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}
class _InfoState extends State<Info> {
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios) , onPressed: () {
          Navigator.of(context).pop();
        },),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30 ,left: 30 ,right: 30),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
             children: [
                  Text("TEAM MEMBERS:", style: GoogleFonts.aladin(textStyle:
                                        TextStyle(fontSize: 36 , fontWeight: FontWeight.w500 ,color:Color.fromARGB(207, 102, 53, 23) ,letterSpacing: 4
                                        ),),),
                  Text("RANA AHMED", style: GoogleFonts.caladea(textStyle:
                                        TextStyle(fontSize: 28 , fontWeight: FontWeight.w300 ,color:Colors.black,letterSpacing: 2
                                        ),),),
                  Text("ALAA KHAIRY", style: GoogleFonts.caladea(textStyle:
                                        TextStyle(fontSize: 28 , fontWeight: FontWeight.w300 ,color:Colors.black ,letterSpacing: 2
                                        ),),),
                 Text("YOMNA ASHRAF", style: GoogleFonts.caladea(textStyle:
                                        TextStyle(fontSize: 28 , fontWeight: FontWeight.w300 ,color:Colors.black ,letterSpacing: 2
                                        ),),),
                  Text("YASMINE MAGDY", style: GoogleFonts.caladea(textStyle:
                                        TextStyle(fontSize: 28 , fontWeight: FontWeight.w300 ,color:Colors.black ,letterSpacing: 2
                                        ),),),
                  Text("HALA ABDELRAHMAN", style: GoogleFonts.caladea(textStyle:
                                        TextStyle(fontSize: 28 , fontWeight: FontWeight.w300 ,color:Colors.black ,letterSpacing: 2
                                        ),),),

            ],
          ),
        ),
        ),
    );
  }
}

