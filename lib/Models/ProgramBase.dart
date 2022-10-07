// To parse this JSON data, do
//
//     final programBase = programBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/AlanBase.dart';
import 'package:developer_student/Models/BolumBase.dart';
import 'package:developer_student/Models/LiseBase.dart';
import 'package:developer_student/Models/SehirBase.dart';
import 'package:developer_student/Models/SinifBase.dart';
import 'package:developer_student/Models/UniversiteBase.dart';
import 'package:developer_student/Models/UnvanBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Models/VeliBase.dart';

ProgramBase programBaseFromJson(String str) => ProgramBase.fromJson(json.decode(str));

String programBaseToJson(ProgramBase data) => json.encode(data.toJson());

class ProgramBase {
  ProgramBase({
    this.data,
    this.success,
    this.message,
  });

  List<Program> data;
  bool success;
  String message;

  factory ProgramBase.fromJson(Map<String, dynamic> json) => ProgramBase(
    data: List<Program>.from(json["data"].map((x) => Program.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Program {
  Program({
    this.programId,
    this.kullanici,
    this.programAdi,
    this.tarih,
    this.baslangicTarih,
    this.bitisTarih,
    this.icerik,
  });

  int programId;
  User kullanici;
  String programAdi;
  DateTime tarih;
  DateTime baslangicTarih;
  DateTime bitisTarih;
  String icerik;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    programId: json["programId"],
    kullanici: User.fromJson(json["kullanici"]),
    programAdi: json["programAdi"],
    tarih: DateTime.parse(json["tarih"]),
    baslangicTarih: DateTime.parse(json["baslangicTarih"]),
    bitisTarih: DateTime.parse(json["bitisTarih"]),
    icerik: json["icerik"],
  );

  Map<String, dynamic> toJson() => {
    "programId": programId,
    "kullanici": kullanici.toJson(),
    "programAdi": programAdi,
    "tarih": tarih.toIso8601String(),
    "baslangicTarih": baslangicTarih.toIso8601String(),
    "bitisTarih": bitisTarih.toIso8601String(),
    "icerik": icerik,
  };
}