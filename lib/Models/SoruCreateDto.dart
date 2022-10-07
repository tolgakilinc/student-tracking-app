/*
* public int SoruId { get; set; }
        public int KullaniciId { get; set; }
        public string Baslik { get; set; }

        public int DersId { get; set; }
        public string Aciklama { get; set; }
* */

// To parse this JSON data, do
//
//     final programCreateDto = programCreateDtoFromJson(jsonString);

import 'dart:convert';

SoruCreateDto programCreateDtoFromJson(String str) => SoruCreateDto.fromJson(json.decode(str));

String programCreateDtoToJson(SoruCreateDto data) => json.encode(data.toJson());

class SoruCreateDto {
  SoruCreateDto({
    this.baslik,
    this.aciklama,
    this.kullaniciId,
    this.dersId,
  });

  String baslik;
  String aciklama;
  int kullaniciId;
  int dersId;

  factory SoruCreateDto.fromJson(Map<String, dynamic> json) => SoruCreateDto(
    baslik: json["Baslik"],
    aciklama: json["Aciklama"],
    kullaniciId: json["KullaniciId"],
    dersId: json["DersId"],

  );

  Map<String, dynamic> toJson() => {
    "Baslik": baslik,
    "Aciklama": aciklama,
    "KullaniciId": kullaniciId,
    "DersId": dersId,
  };
}
