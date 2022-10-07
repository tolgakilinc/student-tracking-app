// To parse this JSON data, do
//
//     final sinifBase = sinifBaseFromJson(jsonString);

import 'dart:convert';

SinifBase sinifBaseFromJson(String str) => SinifBase.fromJson(json.decode(str));

String sinifBaseToJson(SinifBase data) => json.encode(data.toJson());

class SinifBase {
  SinifBase({
    this.data,
    this.success,
    this.message,
  });

  List<Sinif> data;
  bool success;
  String message;

  factory SinifBase.fromJson(Map<String, dynamic> json) => SinifBase(
    data: List<Sinif>.from(json["data"].map((x) => Sinif.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Sinif {
  Sinif({
    this.sinifId,
    this.sinif,
  });

  int sinifId;
  String sinif;

  factory Sinif.fromJson(Map<String, dynamic> json) => Sinif(
    sinifId: json["sınıfId"],
    sinif: json["sınıff"],
  );

  Map<String, dynamic> toJson() => {
    "sınıfId": sinifId,
    "sınıff": sinif,
  };
}
