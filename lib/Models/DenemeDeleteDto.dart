// To parse this JSON data, do
//
//     final denemeBase = denemeBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/UserBase.dart';

DenemeDeleteDto denemeBaseFromJson(String str) => DenemeDeleteDto.fromJson(json.decode(str));

String denemeBaseToJson(DenemeDeleteDto data) => json.encode(data.toJson());

class DenemeDeleteDto {
  DenemeDeleteDto({
    this.denemeId,
    this.kullaniciId,
    this.tarih,
    this.denemeAdi,
    this.puan,
    this.tytNet,
    this.aytNet,
    this.dilNet,
  });

  int denemeId;
  int kullaniciId;
  DateTime tarih;
  String denemeAdi;
  int puan;
  int tytNet;
  int aytNet;
  int dilNet;

  factory DenemeDeleteDto.fromJson(Map<String, dynamic> json) => DenemeDeleteDto(
    denemeId: json["denemeId"],
    kullaniciId: json["kullaniciId"],
    tarih: DateTime.parse(json["tarih"]),
    denemeAdi: json["denemeAdi"],
    puan: json["puan"],
    tytNet: json["tytNet"],
    aytNet: json["aytNet"],
    dilNet: json["dilNet"],
  );

  Map<String, dynamic> toJson() => {
    "denemeId": denemeId,
    "kullaniciId": kullaniciId,
    "tarih": tarih.toIso8601String(),
    "denemeAdi": denemeAdi,
    "puan": puan,
    "tytNet": tytNet,
    "aytNet": aytNet,
    "dilNet": dilNet,
  };
}