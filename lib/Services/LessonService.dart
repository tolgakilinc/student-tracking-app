

import 'dart:convert';

import 'package:developer_student/Models/ClassBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<LessonBase> GetRequestLessons(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return LessonBase.fromJson(jsonDecode(response.body));
  }else{
    print("LessonService, ${response.statusCode}");
  }
}

Future<LessonBase> GetAllLessons() async{
  String requestUri = "${api.baseUrl}/ders";
  return GetRequestLessons(requestUri);
}
