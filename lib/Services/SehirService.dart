

import 'dart:convert';

import 'package:developer_student/Models/SehirBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<SehirBase> GetRequestSehir(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return SehirBase.fromJson(jsonDecode(response.body));
  }else{
    print("SehirService, ${response.statusCode}");
  }
}

Future<SehirBase> GetAllSehir() async{
  String requestUri = "${api.baseUrl}/sehir";
  return GetRequestSehir(requestUri);
}
