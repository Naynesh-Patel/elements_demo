// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  String? id;
  String? name;
  String? companyId;
  String? contactNo;
  String? password;
  String? userType;
  String? photo;
  String? address;
  String? fingerprint;
  String? isAllowMachinery;
  String? isAllowSpareparts;
  String? isAllowUser;
  String? isAllowCustomer;
  String? isAllowBill;
  DateTime? createAt;
  DateTime? updatedAt;

  ModelUser({
    this.id,
    this.name,
    this.companyId,
    this.contactNo,
    this.password,
    this.userType,
    this.photo,
    this.address,
    this.fingerprint,
    this.isAllowMachinery,
    this.isAllowSpareparts,
    this.isAllowUser,
    this.isAllowCustomer,
    this.isAllowBill,
    this.createAt,
    this.updatedAt,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        id: json["id"],
        name: json["name"],
        companyId: json["company_id"],
        contactNo: json["contact_no"],
        password: json["password"],
        userType: json["user_type"],
        photo: json["photo"],
        address: json["address"],
        fingerprint: json["fingerprint"],
        isAllowMachinery: json["is_allow_machinery"],
        isAllowSpareparts: json["is_allow_spareparts"],
        isAllowUser: json["is_allow_user"],
        isAllowCustomer: json["is_allow_customer"],
        isAllowBill: json["is_allow_bill"],
        createAt: DateTime.parse(json["create_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "company_id": companyId,
        "contact_no": contactNo,
        "password": password,
        "user_type": userType,
        "photo": photo,
        "address": address,
        "fingerprint": fingerprint,
        "is_allow_machinery": isAllowMachinery,
        "is_allow_spareparts": isAllowSpareparts,
        "is_allow_user": isAllowUser,
        "is_allow_customer": isAllowCustomer,
        "is_allow_bill": isAllowBill,
        "create_at": createAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
