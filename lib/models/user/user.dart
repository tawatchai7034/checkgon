import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String userId;
    String userName;
    String permission;

    UserModel({
        required this.userId,
        required this.userName,
        required this.permission,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        userName: json["userName"],
        permission: json["permission"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "permission": permission,
    };
}