// To parse this JSON data, do
//
//     final ortalamaBase = ortalamaBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/UserBase.dart';

OrtalamaBase ortalamaBaseFromJson(String str) => OrtalamaBase.fromJson(json.decode(str));

String ortalamaBaseToJson(OrtalamaBase data) => json.encode(data.toJson());

class OrtalamaBase {
  OrtalamaBase({
    this.genelAytOrt,
    this.genelTytOrt,
    this.genelDilOrt,
    this.genelPuanOrt,
    this.ortalama,
    this.isExpanded,
  });

  int genelAytOrt;
  int genelTytOrt;
  int genelDilOrt;
  int genelPuanOrt;
  bool isExpanded;
  List<Ortalama> ortalama;

  factory OrtalamaBase.fromJson(Map<String, dynamic> json) => OrtalamaBase(
    genelAytOrt: json["genelAytOrt"],
    genelTytOrt: json["genelTytOrt"],
    genelDilOrt: json["genelDilOrt"],
    genelPuanOrt: json["genelPuanOrt"],
    isExpanded: json["isExpanded"],
    ortalama: List<Ortalama>.from(json["ortalama"].map((x) => Ortalama.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "genelAytOrt": genelAytOrt,
    "genelTytOrt": genelTytOrt,
    "genelDilOrt": genelDilOrt,
    "genelPuanOrt": genelPuanOrt,
    "isExpanded" : isExpanded,
    "ortalama": List<dynamic>.from(ortalama.map((x) => x.toJson())),
  };
}

class Ortalama {
  Ortalama({
    this.aytOrt,
    this.tytOrt,
    this.dilOrt,
    this.puanOrt,
    this.kullanici,
    this.isExpanded,
  });

  int aytOrt;
  int tytOrt;
  int dilOrt;
  int puanOrt;
  User kullanici;
  bool isExpanded;

  factory Ortalama.fromJson(Map<String, dynamic> json) => Ortalama(
    aytOrt: json["aytOrt"],
    tytOrt: json["tytOrt"],
    dilOrt: json["dilOrt"],
    puanOrt: json["puanOrt"],
    isExpanded: json["isExpanded"],
    kullanici: User.fromJson(json["kullanici"]),
  );

  Map<String, dynamic> toJson() => {
    "aytOrt": aytOrt,
    "tytOrt": tytOrt,
    "dilOrt": dilOrt,
    "puanOrt": puanOrt,
    "kullanici": kullanici.toJson(),
    "isExpanded" : isExpanded,
  };
}