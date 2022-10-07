// To parse this JSON data, do
//
//     final lessonBase = lessonBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/DersKategoriBase.dart';

LessonBase lessonBaseFromJson(String str) => LessonBase.fromJson(json.decode(str));

String lessonBaseToJson(LessonBase data) => json.encode(data.toJson());

class LessonBase {
  LessonBase({
    this.data,
    this.success,
    this.message,
  });

  List<Lesson> data;
  bool success;
  String message;

  factory LessonBase.fromJson(Map<String, dynamic> json) => LessonBase(
    data: List<Lesson>.from(json["data"].map((x) => Lesson.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Lesson {
  Lesson({
    this.dersId,
    this.dersAdi,
    this.dersKategori,
  });

  int dersId;
  String dersAdi;
  DersKategori dersKategori;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    dersId: json["dersId"],
    dersAdi: json["dersAdi"],
    dersKategori: DersKategori.fromJson(json["dersKategori"]),
  );

  Map<String, dynamic> toJson() => {
    "dersId": dersId,
    "dersAdi": dersAdi,
    "dersKategori": dersKategori.toJson(),
  };
}