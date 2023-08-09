import 'package:flutter/material.dart';
import 'package:project/view/Screens/aboutus.dart';
import 'package:project/view/Screens/bottom_nav_bar_screen.dart';
import 'package:project/view/Screens/categories_screen.dart';
import 'package:project/view/Screens/home_screen.dart';
import 'package:project/view/Screens/info.dart';
import 'package:project/view/Screens/login-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/view/Screens/onboarding.dart';
import 'package:project/view/Screens/profile_screen.dart';
import 'package:project/view/Screens/signup.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context)=> const onboarding_screen(),
        '/signupScreen': (context) => const signup(),
        '/loginScreen': (context) => const login(),
        '/bottomNavBar': (context) => const BottomNavBar(),
        '/homeScreen': (context) => const Home(),
        '/categoriesScreen': (context) => const CategoriesScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
        '/aboutUsScreen': (context) => const AboutUs(),
        '/developersScreen': (context) => const Info(),
      },

      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
