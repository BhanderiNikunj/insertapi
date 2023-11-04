// To parse this JSON data, do
//
//     final readModel = readModelFromJson(jsonString);

import 'dart:convert';

List<ReadModel> readModelFromJson(String str) => List<ReadModel>.from(json.decode(str).map((x) => ReadModel.fromJson(x)));

String readModelToJson(List<ReadModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadModel {
  String? id;
  String? name;
  String? desc;
  String? status;
  DateTime? insertDate;
  String? dName;

  ReadModel({
    this.id,
    this.name,
    this.desc,
    this.status,
    this.insertDate,
    this.dName,
  });

  factory ReadModel.fromJson(Map<String, dynamic> json) => ReadModel(
    id: json["id"],
    name:json["name"],
    desc: json["desc"],
    status: json["status"],
    insertDate: json["insert_date"] == null ? null : DateTime.parse(json["insert_date"]),
    dName:json["d_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "desc": desc,
    "status": status,
    "insert_date": "${insertDate!.year.toString().padLeft(4, '0')}-${insertDate!.month.toString().padLeft(2, '0')}-${insertDate!.day.toString().padLeft(2, '0')}",
    "d_name": nameValues.reverse[dName],
  };
}

enum Name {
  CARDIOLOGY,
  EMPTY,
  RADIOLOGY,
  UROLOGY,
  WDW
}

final nameValues = EnumValues({
  "Cardiology": Name.CARDIOLOGY,
  "": Name.EMPTY,
  "Radiology": Name.RADIOLOGY,
  "Urology": Name.UROLOGY,
  "wdw": Name.WDW
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
