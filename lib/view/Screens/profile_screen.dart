import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/widgets/profile_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = "";

  Future<void> getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '--';
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCachedEmail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Profile" , style: GoogleFonts.aladin(textStyle:
        TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),),),
        leading: Icon(Icons.menu,color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage("assets/profile.jpeg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xff6d4508)),
                      child: const Icon(Icons.edit_outlined,
                          color: Color(0xffffffff), size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text((email),
                  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 250, 240, 230),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0),),),
                  onPressed: () {},
                  child: Text(
                    "Edite Profile",
                    style: TextStyle(color: Color(0xff6d4508)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Divider(),

              /// -- MENU
              ProfileMenuWidget(
                  title: "My Order",
                  icon: (Icons.shopping_cart),
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Reviews",
                  icon: Icons.question_mark_sharp,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Payment",
                  icon: Icons.credit_card,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Developers",
                  icon: Icons.edit_square,
                  onPress: () {
                    Navigator.pushNamed(context, '/developersScreen');
                  }),
              ProfileMenuWidget(
                  title: "About Us",
                  icon: Icons.info_outline,
                  onPress: () {
                    Navigator.pushNamed(context, '/aboutUsScreen');
                  }),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout_outlined,
                textColor: Colors.red,
                endIcon: false,
                onPress: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, '/loginScreen');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}