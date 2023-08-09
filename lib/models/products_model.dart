import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String image;
  String name;
  String price;

  ProductModel({required this.image, required this.name, required this.price});

  ProductModel copyWith({
    String? image,
    String? name,
  }) {
    return ProductModel(
      image: image ?? this.image,
      name: name ?? this.name,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
    };
  }
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        image: map['image'] as String,
        name: map['name'] as String,
        price: map['price'] as String);
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductModel(image: $image, name: $name)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.image == image && other.name == name;
  }

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ProductModel(
        image: data['image'], name: data['name'], price: data['price']);
  }

  @override
  int get hashCode => image.hashCode ^ name.hashCode;
}
