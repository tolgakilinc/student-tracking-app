// To parse this JSON data, do
//
//     final bolumBase = bolumBaseFromJson(jsonString);

import 'dart:convert';

BolumBase bolumBaseFromJson(String str) => BolumBase.fromJson(json.decode(str));

String bolumBaseToJson(BolumBase data) => json.encode(data.toJson());

class BolumBase {
  BolumBase({
    this.data,
    this.success,
    this.message,
  });

  List<Bolum> data;
  bool success;
  String message;

  factory BolumBase.fromJson(Map<String, dynamic> json) => BolumBase(
    data: List<Bolum>.from(json["data"].map((x) => Bolum.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Bolum {
  Bolum({
    this.bolumId,
    this.bolumAdi,
  });

  int bolumId;
  String bolumAdi;

  factory Bolum.fromJson(Map<String, dynamic> json) => Bolum(
    bolumId: json["bolumId"],
    bolumAdi: json["bolumAdi"],
  );

  Map<String, dynamic> toJson() => {
    "bolumId": bolumId,
    "bolumAdi": bolumAdi,
  };
}
