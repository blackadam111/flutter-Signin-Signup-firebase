import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({
    this.id,
    this.name,
    this.email,
  });

  factory UserModel.fromJason(DocumentSnapshot map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      "name": name,
      "email": email,
    };
  }

  String toJson() => json.encode(toMap());
}
