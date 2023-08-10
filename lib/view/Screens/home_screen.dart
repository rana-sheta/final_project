import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/view/cubit/products_cubit.dart';
import 'package:project/view/cubit/products_state.dart';
import '../../models/products_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..GetProduct(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title:Text("Home" , style: GoogleFonts.aladin(textStyle:
                TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),),),
                // Text('Home',style:
                // TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
                backgroundColor: Colors.white,
                leading: Icon(Icons.menu,color: Colors.black,),
                actions: const [
                  Icon(Icons.favorite,color: Colors.black,),
                  SizedBox(width: 12,),
                  Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                  SizedBox(width: 15,)
                ],
              ),
              drawer:Drawer(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Container(
                      height: 55,
                      padding: EdgeInsets.only(top:3),

                      decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 102, 53, 23)),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(17))

                      ),

                      child: Row(children: [
                        SizedBox(width: 20,),
                        Icon(Icons.search),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(left: 5),
                          height: 50,
                          width: 300,
                          child: const TextField(
                            decoration: InputDecoration(
                              border:InputBorder.none ,
                              hintText: "  Search here .. ",
                            ),),
                        ),],),
                    ),
                    Container(
                      height: 60,
                      child:const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                          child: Row(
                              children: [
                                Text(
                                  'Our Latest Products',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_circle_down_rounded,
                                  size: 35,
                                  color: Colors.black,
                                ),
                              ]
                          ) ,
                        ),
                      ),
                    ),
                    Container(
                      height: 550,
                      child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.69),
                          //itemBuilder: (context, index)=> SizedBox(height: 20),
                          itemBuilder: (context, index) => buildItem(
                            context.read<ProductCubit>().products[index],),
                          itemCount: context.read<ProductCubit>().products.length
                      ),
                    ),
                  ],),
                ),
              ));
        },
      ),
    );
  }

  Widget buildItem(ProductModel model) => Container(
    child: Column(
      children: [
        InkWell(
          onTap: (){
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color.fromARGB(255, 250, 240, 230),
              ),
              child: Column(
                children: [
                  Container(
                    height: 160,
                    width: 170,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(height: 39,
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(onPressed: (){
                            }, icon: Icon(
                              Icons.favorite_outline
                            ),)),
                        Image.network(
                          "${model.image}",
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 45,
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        "${model.name}\nPrice: ${model.price} ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color:Color.fromARGB(255, 102, 53, 23) ),
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
          ),
          onPressed: (){},
          child: Text( "Add to cart",style:
          TextStyle(fontSize: 16 , color: Color.fromARGB(255, 102, 53, 23))
          )
        ),
       // ),
      ],
    ),
  );
}