// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  String? id;
  String? contactNo;
  String? password;
  String? userType;
  dynamic photo;
  dynamic address;
  String? fingerprint;
  DateTime? createAt;
  DateTime? updatedAt;

  ModelUser({
    this.id,
    this.contactNo,
    this.password,
    this.userType,
    this.photo,
    this.address,
    this.fingerprint,
    this.createAt,
    this.updatedAt,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        id: json["id"],
        contactNo: json["contact_no"],
        password: json["password"],
        userType: json["user_type"],
        photo: json["photo"],
        address: json["address"],
        fingerprint: json["fingerprint"],
        createAt: DateTime.parse(json["create_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contact_no": contactNo,
        "password": password,
        "user_type": userType,
        "photo": photo,
        "address": address,
        "fingerprint": fingerprint,
        "create_at": createAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
