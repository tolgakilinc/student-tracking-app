// To parse this JSON data, do
//
//     final sehirBase = sehirBaseFromJson(jsonString);

import 'dart:convert';

SehirBase sehirBaseFromJson(String str) => SehirBase.fromJson(json.decode(str));

String sehirBaseToJson(SehirBase data) => json.encode(data.toJson());

class SehirBase {
  SehirBase({
    this.data,
    this.success,
    this.message,
  });

  List<Sehir> data;
  bool success;
  String message;

  factory SehirBase.fromJson(Map<String, dynamic> json) => SehirBase(
    data: List<Sehir>.from(json["data"].map((x) => Sehir.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Sehir {
  Sehir({
    this.sehirId,
    this.sehirAdi,
  });

  int sehirId;
  String sehirAdi;

  factory Sehir.fromJson(Map<String, dynamic> json) => Sehir(
    sehirId: json["sehirId"] ?? 0,
    sehirAdi: json["sehirAdi"],
  );

  Map<String, dynamic> toJson() => {
    "sehirId": sehirId,
    "sehirAdi": sehirAdi,
  };
}
