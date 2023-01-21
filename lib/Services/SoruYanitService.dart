import 'dart:convert';
import 'package:developer_student/Models/SoruYanitBase.dart';
import 'package:developer_student/Models/SoruYanitCreateDto.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;
import 'package:developer_student/Models/ProgramBase.dart';
import 'package:developer_student/Models/ProgramCreateDto.dart';
import 'package:developer_student/Models/ProgramDeleteDto.dart';
import 'package:developer_student/Models/UserBase.dart';
Future<SoruYanitBase> GetRequestSoruYanit(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return SoruYanitBase.fromJson(jsonDecode(response.body));
  }else{
    print("SoruYanitService, ${response.statusCode}");
  }
}

Future<void> PostRequestSoruYanit(String requestUri, String body) async{
  final response = await http.post(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      },
      body: body
  );
  print(response.body);
  if(response.statusCode == 200){
    Map json = jsonDecode(response.body);
  }else if(response.statusCode == 401){
  }else{
    print("SoruYanitService, ${response.statusCode}");
  }
}

void CreateSoruYanit(SoruYanitCreateDto soruYanitCreateDto){
  String requestUri = "${api.baseUrl}/soruYanit/add";
  String encoded = jsonEncode(soruYanitCreateDto);
  PostRequestSoruYanit(requestUri, encoded);
}

Future<SoruYanitBase> GetSoruYanit(int soruId) async{
  String requestUri = "${api.baseUrl}/soruYanit/soru/$soruId";
  return GetRequestSoruYanit(requestUri);
}


