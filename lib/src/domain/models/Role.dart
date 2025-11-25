

class Role {
    String id;
    String name;
    String route; // 🔑 Permitir null
    String image; // 🔑 Permitir null

    Role({
        required this.id,
        required this.name,
        required this.route, // Ya no es required
        required this.image,// Ya no es required
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        route: json["route"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "route": route,
        "image": image,
    };
}