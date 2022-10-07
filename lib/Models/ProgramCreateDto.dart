// To parse this JSON data, do
//
//     final programCreateDto = programCreateDtoFromJson(jsonString);

import 'dart:convert';

ProgramCreateDto programCreateDtoFromJson(String str) => ProgramCreateDto.fromJson(json.decode(str));

String programCreateDtoToJson(ProgramCreateDto data) => json.encode(data.toJson());

class ProgramCreateDto {
  ProgramCreateDto({
    this.kullaniciId,
    this.programAdi,
    this.tarih,
    this.baslangicTarih,
    this.bitisTarih,
    this.icerik,
  });

  int kullaniciId;
  String programAdi;
  String tarih;
  String baslangicTarih;
  String bitisTarih;
  String icerik;

  factory ProgramCreateDto.fromJson(Map<String, dynamic> json) => ProgramCreateDto(
    kullaniciId: json["KullaniciId"],
    programAdi: json["ProgramAdi"],
    tarih: json["Tarih"],
    baslangicTarih: json["baslangicTarih"],
    bitisTarih: json["bitisTarih"],
    icerik: json["Icerik"],
  );

  Map<String, dynamic> toJson() => {
    "KullaniciId": kullaniciId,
    "ProgramAdi": programAdi,
    "Tarih": tarih,
    "baslangicTarih": baslangicTarih,
    "bitisTarih": bitisTarih,
    "Icerik": icerik,
  };
}
