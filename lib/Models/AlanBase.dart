// To parse this JSON data, do
//
//     final alanBase = alanBaseFromJson(jsonString);

import 'dart:convert';

AlanBase alanBaseFromJson(String str) => AlanBase.fromJson(json.decode(str));

String alanBaseToJson(AlanBase data) => json.encode(data.toJson());

class AlanBase {
  AlanBase({
    this.data,
    this.success,
    this.message,
  });

  List<Alan> data;
  bool success;
  String message;

  factory AlanBase.fromJson(Map<String, dynamic> json) => AlanBase(
    data: List<Alan>.from(json["data"].map((x) => Alan.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Alan {
  Alan({
    this.alanId,
    this.alanAdi,
  });

  int alanId;
  String alanAdi;

  factory Alan.fromJson(Map<String, dynamic> json) => Alan(
    alanId: json["alanId"],
    alanAdi: json["alanAdi"],
  );

  Map<String, dynamic> toJson() => {
    "alanId": alanId,
    "alanAdi": alanAdi,
  };
}
