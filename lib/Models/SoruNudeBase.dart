// To parse this JSON data, do
//
//     final soruNudeBase = soruNudeBaseFromJson(jsonString);

import 'dart:convert';

SoruNudeBase soruNudeBaseFromJson(String str) => SoruNudeBase.fromJson(json.decode(str));

String soruNudeBaseToJson(SoruNudeBase data) => json.encode(data.toJson());

class SoruNudeBase {
  SoruNudeBase({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  List<SoruNude> data;

  factory SoruNudeBase.fromJson(Map<String, dynamic> json) => SoruNudeBase(
    success: json["success"],
    message: json["message"],
    data: List<SoruNude>.from(json["data"].map((x) => SoruNude.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SoruNude {
  SoruNude({
    this.soruId,
    this.kullaniciId,
    this.baslik,
    this.dersId,
    this.aciklama,
  });

  int soruId;
  int kullaniciId;
  String baslik;
  int dersId;
  String aciklama;

  factory SoruNude.fromJson(Map<String, dynamic> json) => SoruNude(
    soruId: json["soruId"],
    kullaniciId: json["kullaniciId"],
    baslik: json["baslik"],
    dersId: json["dersId"],
    aciklama: json["aciklama"],
  );

  Map<String, dynamic> toJson() => {
    "soruId": soruId,
    "kullaniciId": kullaniciId,
    "baslik": baslik,
    "dersId": dersId,
    "aciklama": aciklama,
  };
}
