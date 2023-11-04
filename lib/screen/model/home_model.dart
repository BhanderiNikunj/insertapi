// To parse this JSON data, do
//
//     final insertModel = insertModelFromJson(jsonString);

import 'dart:convert';

InsertModel insertModelFromJson(String str) => InsertModel.fromJson(json.decode(str));

String insertModelToJson(InsertModel data) => json.encode(data.toJson());

class InsertModel {
  String? message;
  bool? status;

  InsertModel({
    this.message,
    this.status,
  });

  factory InsertModel.fromJson(Map<String, dynamic> json) => InsertModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
