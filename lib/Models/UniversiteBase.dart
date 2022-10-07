// To parse this JSON data, do
//
//     final universiteBase = universiteBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/SehirBase.dart';

UniversiteBase universiteBaseFromJson(String str) => UniversiteBase.fromJson(json.decode(str));

String universiteBaseToJson(UniversiteBase data) => json.encode(data.toJson());

class UniversiteBase {
  UniversiteBase({
    this.data,
    this.success,
    this.message,
  });

  List<Universite> data;
  bool success;
  dynamic message;

  factory UniversiteBase.fromJson(Map<String, dynamic> json) => UniversiteBase(
    data: List<Universite>.from(json["data"].map((x) => Universite.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Universite {
  Universite({
    this.universiteId,
    this.universiteAdi,
    this.uniTur,
    this.sehir,
  });

  int universiteId;
  String universiteAdi;
  UniTur uniTur;
  Sehir sehir;

  factory Universite.fromJson(Map<String, dynamic> json) => Universite(
    universiteId: json["universiteId"],
    universiteAdi: json["universiteAdi"],
    uniTur: uniTurValues.map[json["uniTur"]],
    sehir: Sehir.fromJson(json["sehir"]),
  );

  Map<String, dynamic> toJson() => {
    "universiteId": universiteId,
    "universiteAdi": universiteAdi,
    "uniTur": uniTurValues.reverse[uniTur],
    "sehir": sehir.toJson(),
  };
}

enum UniTur { YOK, DEVLET, VAKIF }

final uniTurValues = EnumValues({
  "Devlet": UniTur.DEVLET,
  "Vakif": UniTur.VAKIF,
  "YOK": UniTur.YOK
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
