// To parse this JSON data, do
//
//     final dersKategoriBase = dersKategoriBaseFromJson(jsonString);

import 'dart:convert';

DersKategoriBase dersKategoriBaseFromJson(String str) => DersKategoriBase.fromJson(json.decode(str));

String dersKategoriBaseToJson(DersKategoriBase data) => json.encode(data.toJson());

class DersKategoriBase {
  DersKategoriBase({
    this.data,
    this.success,
    this.message,
  });

  List<DersKategori> data;
  bool success;
  String message;

  factory DersKategoriBase.fromJson(Map<String, dynamic> json) => DersKategoriBase(
    data: List<DersKategori>.from(json["data"].map((x) => DersKategori.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class DersKategori {
  DersKategori({
    this.dersKategoriId,
    this.dersKategorisi,
  });

  int dersKategoriId;
  String dersKategorisi;

  factory DersKategori.fromJson(Map<String, dynamic> json) => DersKategori(
    dersKategoriId: json["dersKategoriId"],
    dersKategorisi: json["dersKategorisi"],
  );

  Map<String, dynamic> toJson() => {
    "dersKategoriId": dersKategoriId,
    "dersKategorisi": dersKategorisi,
  };
}
