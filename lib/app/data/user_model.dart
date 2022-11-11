// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.actief,
    this.clients,
    this.emailAddress,
    this.firstName,
    this.lastName,
    this.mobile,
    this.password,
    this.performerType,
    this.phone,
    this.profileImage,
    this.userName,
  });

  String? actief;
  List<String>? clients;
  String? emailAddress;
  String? firstName;
  String? lastName;
  String? mobile;
  String? password;
  String? performerType;
  String? phone;
  String? profileImage;
  String? userName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        actief: json["actief"],
        clients: List<String>.from(json["clients"].map((x) => x)),
        emailAddress: json["emailAddress"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobile: json["mobile"],
        password: json["password"],
        performerType: json["performerType"],
        phone: json["phone"],
        profileImage: json["profileImage"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "actief": actief,
        "clients": List<dynamic>.from(clients!.map((x) => x)),
        "emailAddress": emailAddress,
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "password": password,
        "performerType": performerType,
        "phone": phone,
        "profileImage": profileImage,
        "userName": userName,
      };
}
