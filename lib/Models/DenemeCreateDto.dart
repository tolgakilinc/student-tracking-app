// To parse this JSON data, do
//
//     final denemeBase = denemeBaseFromJson(jsonString);

import 'dart:convert';
DenemeCreateDto denemeBaseFromJson(String str) => DenemeCreateDto.fromJson(json.decode(str));

String denemeBaseToJson(DenemeCreateDto data) => json.encode(data.toJson());

class DenemeCreateDto {
  DenemeCreateDto({
    this.kullaniciId,
    this.tarih,
    this.denemeAdi,
    this.puan,
    this.tytNet,
    this.aytNet,
    this.dilNet,
  });

  int kullaniciId;
  DateTime tarih;
  String denemeAdi;
  int puan;
  int tytNet;
  int aytNet;
  int dilNet;

  factory DenemeCreateDto.fromJson(Map<String, dynamic> json) => DenemeCreateDto(
    kullaniciId: json["kullaniciId"],
    tarih: DateTime.parse(json["tarih"]),
    denemeAdi: json["denemeAdi"],
    puan: json["puan"],
    tytNet: json["tytNet"],
    aytNet: json["aytNet"],
    dilNet: json["dilNet"],
  );

  Map<String, dynamic> toJson() => {
    "kullaniciId": kullaniciId,
    "tarih": tarih.toIso8601String(),
    "denemeAdi": denemeAdi,
    "puan": puan,
    "tytNet": tytNet,
    "aytNet": aytNet,
    "dilNet": dilNet,
  };
}