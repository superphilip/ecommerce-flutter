import 'package:ecommerce_flutter/src/domain/models/User.dart';

class AuthResponse {
    User user;
    String? token;
    String? message;


    AuthResponse({
        required this.user,
        this.token,
        this.message,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["user"] as Map<String, dynamic>? ?? {}),
        token: json["token"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "message": message,
    };
}