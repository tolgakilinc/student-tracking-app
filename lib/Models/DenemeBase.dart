// To parse this JSON data, do
//
//     final denemeBase = denemeBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/UserBase.dart';

DenemeBase denemeBaseFromJson(String str) => DenemeBase.fromJson(json.decode(str));

String denemeBaseToJson(DenemeBase data) => json.encode(data.toJson());

class DenemeBase {
  DenemeBase({
    this.data,
    this.success,
    this.message,
  });

  List<Deneme> data;
  bool success;
  String message;

  factory DenemeBase.fromJson(Map<String, dynamic> json) => DenemeBase(
    data: List<Deneme>.from(json["data"].map((x) => Deneme.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Deneme {
  Deneme({
    this.denemeId,
    this.kullanici,
    this.tarih,
    this.denemeAdi,
    this.puan,
    this.tytNet,
    this.aytNet,
    this.dilNet,
  });

  int denemeId;
  User kullanici;
  DateTime tarih;
  String denemeAdi;
  int puan;
  int tytNet;
  int aytNet;
  int dilNet;

  factory Deneme.fromJson(Map<String, dynamic> json) => Deneme(
    denemeId: json["denemeId"],
    kullanici: User.fromJson(json["kullanici"]),
    tarih: DateTime.parse(json["tarih"]),
    denemeAdi: json["denemeAdi"],
    puan: json["puan"],
    tytNet: json["tytNet"],
    aytNet: json["aytNet"],
    dilNet: json["dilNet"],
  );

  Map<String, dynamic> toJson() => {
    "denemeId": denemeId,
    "kullanici": kullanici.toJson(),
    "tarih": tarih.toIso8601String(),
    "denemeAdi": denemeAdi,
    "puan": puan,
    "tytNet": tytNet,
    "aytNet": aytNet,
    "dilNet": dilNet,
  };
}