// To parse this JSON data, do
//
//     final veliBase = veliBaseFromJson(jsonString);

import 'dart:convert';

VeliBase veliBaseFromJson(String str) => VeliBase.fromJson(json.decode(str));

String veliBaseToJson(VeliBase data) => json.encode(data.toJson());

class VeliBase {
  VeliBase({
    this.data,
    this.success,
    this.message,
  });

  List<Veli> data;
  bool success;
  String message;

  factory VeliBase.fromJson(Map<String, dynamic> json) => VeliBase(
    data: List<Veli>.from(json["data"].map((x) => Veli.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Veli {
  Veli({
    this.veliId,
    this.veliAdi,
    this.veliSoyadi,
    this.veliEposta,
  });

  int veliId;
  String veliAdi;
  String veliSoyadi;
  String veliEposta;

  factory Veli.fromJson(Map<String, dynamic> json) => Veli(
    veliId: json["veliId"],
    veliAdi: json["veliAdi"],
    veliSoyadi: json["veliSoyadi"],
    veliEposta: json["veliEposta"],
  );

  Map<String, dynamic> toJson() => {
    "veliId": veliId,
    "veliAdi": veliAdi,
    "veliSoyadi": veliSoyadi,
    "veliEposta": veliEposta,
  };
}
