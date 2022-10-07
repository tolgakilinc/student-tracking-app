// To parse this JSON data, do
//
//     final unvanBase = unvanBaseFromJson(jsonString);

import 'dart:convert';

UnvanBase unvanBaseFromJson(String str) => UnvanBase.fromJson(json.decode(str));

String unvanBaseToJson(UnvanBase data) => json.encode(data.toJson());

class UnvanBase {
  UnvanBase({
    this.data,
    this.success,
    this.message,
  });

  List<Unvan> data;
  bool success;
  String message;

  factory UnvanBase.fromJson(Map<String, dynamic> json) => UnvanBase(
    data: List<Unvan>.from(json["data"].map((x) => Unvan.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Unvan {
  Unvan({
    this.unvanId,
    this.unvanAdi,
  });

  int unvanId;
  String unvanAdi;

  factory Unvan.fromJson(Map<String, dynamic> json) => Unvan(
    unvanId: json["unvanId"],
    unvanAdi: json["unvanAdi"],
  );

  Map<String, dynamic> toJson() => {
    "unvanId": unvanId,
    "unvanAdi": unvanAdi,
  };
}
