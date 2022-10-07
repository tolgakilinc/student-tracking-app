

import 'dart:convert';

import 'package:developer_student/Models/UnvanBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<UnvanBase> GetRequestUnvanlar(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return UnvanBase.fromJson(jsonDecode(response.body));
  }else{
    print("UnvanService, ${response.statusCode}");
  }
}

Future<UnvanBase> GetAllUnvanlar() async{
  String requestUri = "${api.baseUrl}/unvan";
  return GetRequestUnvanlar(requestUri);
}
