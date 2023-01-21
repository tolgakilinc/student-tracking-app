// To parse this JSON data, do
//
//     final userBase = userBaseFromJson(jsonString);

import 'dart:convert';

/*import 'package:developer_student/Models/AlanBase.dart';
import 'package:developer_student/Models/BolumBase.dart';
import 'package:developer_student/Models/LiseBase.dart';
import 'package:developer_student/Models/SehirBase.dart';
import 'package:developer_student/Models/SinifBase.dart';
import 'package:developer_student/Models/UniversiteBase.dart';
import 'package:developer_student/Models/UnvanBase.dart';
import 'package:developer_student/Models/VeliBase.dart';*/

SignUpCreateDto signUpBaseFromJson(String str) => SignUpCreateDto.fromJson(json.decode(str));

String signUpBaseToJson(SignUpCreateDto data) => json.encode(data.toJson());


class SignUpCreateDto {
  SignUpCreateDto({
    this.ad,
    this.soyad,
    this.eposta,
    this.sifre,
    this.telefonNo,
    this.sehirId,
    this.yas,
    this.unvanId,
    this.alanId,
    this.bolumId,
    this.liseId,
    this.universiteId,
    this.sinifId,
    this.veliId,
  });

  String ad;
  String soyad;
  String eposta;
  String sifre;
  String telefonNo;
  int sehirId;
  int yas;
  int unvanId;
  int alanId;
  int bolumId;
  int liseId;
  int universiteId;
  int sinifId;
  int veliId;

  factory SignUpCreateDto.fromJson(Map<String, dynamic> json) => SignUpCreateDto(
    ad: json["ad"],
    soyad: json["soyad"],
    eposta: json["eposta"],
    sifre: json["sifre"],
    telefonNo: json["telefonNo"],
    sehirId: json["sehirId"],
    yas: json["yas"],
    unvanId: json["unvanId"],
    alanId: json["alanId"],
    bolumId: json["bolumId"],
    liseId: json["liseId"],
    universiteId: json["universiteId"],
    sinifId: json["sınıfId"],
    veliId: json["veliId"],
  );

  Map<String, dynamic> toJson() => {
    "ad": ad,
    "soyad": soyad,
    "eposta": eposta,
    "sifre": sifre,
    "telefonNo": telefonNo,
    "sehirId": sehirId,
    "yas": yas,
    "unvanId": unvanId,
    "alanId": alanId,
    "bolumId": bolumId,
    "liseId": liseId,
    "universiteId": universiteId,
    "sınıfId": sinifId,
    "veliId": veliId,
  };
}