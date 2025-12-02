import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  int idCategory;
  String name;
  String description;
  String? image1;
  String? image2;
  double price;

  Product({
    this.id,
    required this.idCategory,
    required this.name,
    required this.description,
    this.image1,
    this.image2,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    idCategory: json["id_category"] is String
        ? int.parse(json["id_category"])
        : json["id_category"],
    name: json["name"] ?? '',
    description: json["description"] ?? '',
    image1: json["image1"],
    image2: json["image2"],
    price: json["price"] is String
        ? double.parse(json["price"])
        : json["price"] is int
            ? (json["price"] as int).toDouble()
            : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_category": idCategory,
    "name": name,
    "description": description,
    "image1": image1,
    "image2": image2,
    "price": price,
  };
}
