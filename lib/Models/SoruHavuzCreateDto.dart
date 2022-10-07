// To parse this JSON data, do
//
//     final denemeBase = denemeBaseFromJson(jsonString);

import 'dart:convert';
SoruHavuzCreateDto denemeBaseFromJson(String str) => SoruHavuzCreateDto.fromJson(json.decode(str));

String denemeBaseToJson(SoruHavuzCreateDto data) => json.encode(data.toJson());

class SoruHavuzCreateDto {
  SoruHavuzCreateDto({
    this.soruId,
    this.dersKategoriId
  });

  int soruId;
  int dersKategoriId;

  factory SoruHavuzCreateDto.fromJson(Map<String, dynamic> json) => SoruHavuzCreateDto(
    dersKategoriId: json["dersKategoriId"],
    soruId: json["dersKategoriId"],
  );

  Map<String, dynamic> toJson() => {
    "dersKategoriId": dersKategoriId,
    "soruId": soruId,
  };
}