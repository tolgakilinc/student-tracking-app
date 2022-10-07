// To parse this JSON data, do
//
//     final denemeBase = denemeBaseFromJson(jsonString);

import 'dart:convert';
SoruYanitCreateDto denemeBaseFromJson(String str) => SoruYanitCreateDto.fromJson(json.decode(str));

String denemeBaseToJson(SoruYanitCreateDto data) => json.encode(data.toJson());

class SoruYanitCreateDto {
  SoruYanitCreateDto({
    this.kullaniciId,
    this.soruId,
    this.yanit
  });

  String yanit;
  int soruId;
  int kullaniciId;

  factory SoruYanitCreateDto.fromJson(Map<String, dynamic> json) => SoruYanitCreateDto(
    kullaniciId: json["kullaniciId"],
    yanit: json["yanit"],
    soruId: json["soruId"],
  );

  Map<String, dynamic> toJson() => {
    "kullaniciId": kullaniciId,
    "yanit": yanit,
    "soruId": soruId,
  };
}