// To parse this JSON data, do
//
//     final programDeleteDto = programDeleteDtoFromJson(jsonString);

import 'dart:convert';

ProgramDeleteDto programDeleteDtoFromJson(String str) => ProgramDeleteDto.fromJson(json.decode(str));

String programDeleteDtoToJson(ProgramDeleteDto data) => json.encode(data.toJson());

class ProgramDeleteDto {
  ProgramDeleteDto({
    this.programId,
    this.kullaniciId,
    this.programAdi,
    this.tarih,
    this.baslangicTarih,
    this.bitisTarih,
    this.icerik,
  });

  int programId;
  int kullaniciId;
  String programAdi;
  String tarih;
  String baslangicTarih;
  String bitisTarih;
  String icerik;

  factory ProgramDeleteDto.fromJson(Map<String, dynamic> json) => ProgramDeleteDto(
    programId: json["ProgramId"],
    kullaniciId: json["KullaniciId"],
    programAdi: json["ProgramAdi"],
    tarih: json["Tarih"],
    baslangicTarih: json["baslangicTarih"],
    bitisTarih: json["bitisTarih"],
    icerik: json["Icerik"],
  );

  Map<String, dynamic> toJson() => {
    "ProgramId": programId,
    "KullaniciId": kullaniciId,
    "ProgramAdi": programAdi,
    "Tarih": tarih,
    "baslangicTarih": baslangicTarih,
    "bitisTarih": bitisTarih,
    "Icerik": icerik,
  };
}
