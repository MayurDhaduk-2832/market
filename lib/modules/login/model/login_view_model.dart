// class LoginModel {
//   bool? isSuccess;
//   String? message;
//   String? id;
//   String? username;
//   String? mobileNumber;
//   String? email;
//   String? role;
//
//   LoginModel(
//       {this.isSuccess,
//         this.message,
//         this.id,
//         this.username,
//         this.mobileNumber,
//         this.email,
//         this.role});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     isSuccess = json['isSuccess'];
//     message = json['message'];
//     id = json['id'];
//     username = json['username'];
//     mobileNumber = json['mobileNumber'];
//     email = json['email'];
//     role = json['role'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isSuccess'] = this.isSuccess;
//     data['message'] = this.message;
//     data['id'] = this.id;
//     data['username'] = this.username;
//     data['mobileNumber'] = this.mobileNumber;
//     data['email'] = this.email;
//     data['role'] = this.role;
//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? isSuccess;
  String? message;
  String? id;
  String? username;
  String? mobileNumber;
  String? email;
  String? role;

  LoginModel({
    this.isSuccess,
    this.message,
    this.id,
    this.username,
    this.mobileNumber,
    this.email,
    this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    isSuccess: json["isSuccess"],
    message: json["message"],
    id: json["id"],
    username: json["username"],
    mobileNumber: json["mobileNumber"],
    email: json["email"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "id": id,
    "username": username,
    "mobileNumber": mobileNumber,
    "email": email,
    "role": role,
  };
}
