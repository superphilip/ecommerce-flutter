import 'dart:convert';

Category authResponseFromJson(String str) =>
    Category.fromJson(json.decode(str));

String authResponseToJson(Category data) => json.encode(data.toJson());

class Category {
  int? id;
  String name;
  String description;
  String? image;

  Category({this.id, required this.name, required this.description, this.image});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] ?? 0,
    name: json["name"],
    description: json["description"],
    image: json["image"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "image": image,
  };
}
