// To parse this JSON data, do
//
//     final userBase = userBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/AlanBase.dart';
import 'package:developer_student/Models/BolumBase.dart';
import 'package:developer_student/Models/LiseBase.dart';
import 'package:developer_student/Models/SehirBase.dart';
import 'package:developer_student/Models/SinifBase.dart';
import 'package:developer_student/Models/UniversiteBase.dart';
import 'package:developer_student/Models/UnvanBase.dart';
import 'package:developer_student/Models/VeliBase.dart';

UserBase userBaseFromJson(String str) => UserBase.fromJson(json.decode(str));

String userBaseToJson(UserBase data) => json.encode(data.toJson());

class UserBase {
  UserBase({
    this.data,
    this.success,
    this.message,
  });

  List<User> data;
  bool success;
  dynamic message;

  factory UserBase.fromJson(Map<String, dynamic> json) => UserBase(
    data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class User {
  User({
    this.kullaniciId,
    this.ad,
    this.soyad,
    this.eposta,
    this.sifre,
    this.telefonNo,
    this.sehir,
    this.yas,
    this.unvan,
    this.alan,
    this.bolum,
    this.lise,
    this.universite,
    this.sinif,
    this.veli,
  });

  int kullaniciId;
  String ad;
  String soyad;
  String eposta;
  String sifre;
  String telefonNo;
  Sehir sehir;
  int yas;
  Unvan unvan;
  Alan alan;
  Bolum bolum;
  Lise lise;
  Universite universite;
  Sinif sinif;
  Veli veli;

  factory User.fromJson(Map<String, dynamic> json) => User(
    kullaniciId: json["kullaniciId"],
    ad: json["ad"],
    soyad: json["soyad"],
    eposta: json["eposta"],
    sifre: json["sifre"],
    telefonNo: json["telefonNo"],
    sehir: Sehir.fromJson(json["sehir"]),
    yas: json["yas"],
    unvan: Unvan.fromJson(json["unvan"]),
    alan: Alan.fromJson(json["alan"]),
    bolum: Bolum.fromJson(json["bolum"]),
    lise: Lise.fromJson(json["lise"]),
    universite: Universite.fromJson(json["universite"]),
    sinif: Sinif.fromJson(json["sınıf"]),
    veli: Veli.fromJson(json["veli"]),
  );

  Map<String, dynamic> toJson() => {
    "kullaniciId": kullaniciId,
    "ad": ad,
    "soyad": soyad,
    "eposta": eposta,
    "sifre": sifre,
    "telefonNo": telefonNo,
    "sehir": sehir.toJson(),
    "yas": yas,
    "unvan": unvan.toJson(),
    "alan": alan.toJson(),
    "bolum": bolum.toJson(),
    "lise": lise.toJson(),
    "universite": universite.toJson(),
    "sınıf": sinif.toJson(),
    "veli": veli.toJson(),
  };
}