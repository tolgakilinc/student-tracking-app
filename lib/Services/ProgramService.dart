import 'dart:convert';
import 'package:developer_student/Models/ProgramBase.dart';
import 'package:developer_student/Models/ProgramCreateDto.dart';
import 'package:developer_student/Models/ProgramDeleteDto.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<ProgramBase> GetRequestProgram(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return ProgramBase.fromJson(jsonDecode(response.body));
  }else{
    print("ProgramService, ${response.statusCode}");
  }
}

Future<void> PostRequestProgram(String requestUri, String body) async{
  final response = await http.post(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      },
      body: body
  );
  if(response.statusCode == 200){
    Map json = jsonDecode(response.body);
  }else if(response.statusCode == 401){
  }else{
    print("ProgramService, ${response.statusCode}");
  }
}

Future<ProgramBase> GetProgram(int userId, String date) async{
  String requestUri = "${api.baseUrl}/program/$userId/tarih/$date";
  return GetRequestProgram(requestUri);
}

void CreateProgram(ProgramCreateDto programCreateDto){
  String requestUri = "${api.baseUrl}/program/add";
  String encoded = jsonEncode(programCreateDto);
  PostRequestProgram(requestUri, encoded);
}

void DeleteProgram(ProgramDeleteDto programDelete){
  String requestUri = "${api.baseUrl}/program/delete";
  String encoded = jsonEncode(programDelete);
  print(encoded);
  PostRequestProgram(requestUri, encoded);
}