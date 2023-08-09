import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/products_model.dart';
import 'package:project/view/cubit/products_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitState());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void GetProduct() {
    emit(ProductInitState());
    FirebaseFirestore.instance.collection('Products').get().then((QuerySnapshot querySnapshot) {
      products = [];
      querySnapshot.docs.forEach((doc) {
        ProductModel product = ProductModel.fromFirestore(doc);
        products.add(product);
      });
      print("${products.length}");
      emit(ProductSuccessState());
    });
  }
}