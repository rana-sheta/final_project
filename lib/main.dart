
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/widgets/login-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/view/widgets/onboarding.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      // theme: ThemeData(
      // //   fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home:onboarding_screen(),
      //login(),

    );
  }
}
