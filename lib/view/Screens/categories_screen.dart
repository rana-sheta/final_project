import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/models/categories_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CollectionReference categoriesRef =
  FirebaseFirestore.instance.collection('categories');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text("Categories" , style: GoogleFonts.aladin(textStyle:
          TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),),),
          centerTitle: true,
          leading: const Icon(Icons.menu,color: Colors.black,),
          actions: const [
            Icon(Icons.search_outlined,color: Colors.black),
            SizedBox(width: 18,),
          ],
          bottom:  TabBar(
            automaticIndicatorColorAdjustment: false,
            indicatorColor: const Color.fromARGB(255, 102, 53, 23),
            labelColor: const Color.fromARGB(255, 102, 53, 23),
            unselectedLabelColor: Colors.grey.shade700,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const <Widget>[
              Tab(
                child: Text('All'),
              ),
              Tab(
                child: Text('Men'),
              ),
              Tab(
                child: Text('Women'),
              ),
              Tab(
                child: Text('Kids'),
              ),
            ],
          ),
        ) ,
        body: StreamBuilder<QuerySnapshot>(
          stream: categoriesRef.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final List<CategoryModel> categories = snapshot.data!.docs
                .map((DocumentSnapshot document) => CategoryModel.fromSnapshot(document))
                .toList();

            return GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Handle category selection
                    print('Selected category: ${categories[index].name}');
                  },
                  child: Card(
                    shadowColor:const Color.fromARGB(255, 102, 53, 23) ,
                    color: const Color.fromARGB(255, 250, 240, 230),
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: 15,vertical: 5),
                    shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(17)) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            width: 180,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text("${categories[index].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,))),
                        // SizedBox(width: 115,),
                        Image.network(
                          "${categories[index].imagePath}",
                          width: 164,
                          height:140,
                          alignment: const AlignmentDirectional(0.0, 1.0),
                        ),


                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),


      ),
    );
  }
}