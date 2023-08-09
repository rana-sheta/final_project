import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? name;
  String? imagePath;

  CategoryModel({
    this.name,
    this.imagePath,
  });

  factory CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CategoryModel(
      name: data['name'],
      imagePath: data['imagePath'],
    );
  }

}