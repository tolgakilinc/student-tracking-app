

import 'dart:convert';

import 'package:developer_student/Models/BolumBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<BolumBase> GetRequestBolums(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return BolumBase.fromJson(jsonDecode(response.body));
  }else{
    print("BolumService, ${response.statusCode}");
  }
}

Future<BolumBase> GetAllBolums() async{
  String requestUri = "${api.baseUrl}/bolum";
  return GetRequestBolums(requestUri);
}
