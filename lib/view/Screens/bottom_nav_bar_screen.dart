import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/view/Screens/categories_screen.dart';
import 'package:project/view/Screens/home_screen.dart';
import 'package:project/view/Screens/profile_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    Home(),
    CategoriesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:
      Container(
        height: 85,
        width: 200,
        decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(11)),color: Color.fromARGB(255, 102, 53, 23)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: GNav(
            iconSize: 28,
            tabActiveBorder: Border.all(color: Colors.white),
            //tabShadow: [BoxShadow(blurStyle: BlurStyle.outer)],
            tabBorderRadius: 18,
            backgroundColor: Color.fromARGB(255, 102, 53, 23),
            color: Colors.white,
            activeColor: Colors.white,
            gap: 10,
            padding: EdgeInsets.all(12),
            tabs: const [
              GButton(

                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.category_outlined,
                text: 'Categories',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
