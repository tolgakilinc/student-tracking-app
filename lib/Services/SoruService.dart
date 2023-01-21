import 'dart:convert';
import 'package:developer_student/Models/SoruBase.dart';
import 'package:developer_student/Models/SoruCreateDto.dart';
import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;
import 'package:developer_student/Models/ProgramBase.dart';
import 'package:developer_student/Models/ProgramCreateDto.dart';
import 'package:developer_student/Models/ProgramDeleteDto.dart';
import 'package:developer_student/Models/UserBase.dart';
Future<SoruBase> GetRequestSoru(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return SoruBase.fromJson(jsonDecode(response.body));
  }else{
    print("SoruService, ${response.statusCode}");
  }
}

Future<SoruNudeBase> GetRequestSoruNude(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return SoruNudeBase.fromJson(jsonDecode(response.body));
  }else{
    print("SoruService, ${response.statusCode}");
  }
}

Future<void> PostRequestSoru(String requestUri, String body) async{
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
    print("SoruService, ${response.statusCode}");
  }
}

Future<SoruNudeBase> GetBeklenenSoru(int userId, int dersId) async{
  String requestUri = "${api.baseUrl}/soru/beklenen/kullanici/$userId/ders/$dersId";
  print(requestUri);
  return GetRequestSoruNude(requestUri);
}

Future<SoruNudeBase> GetYanitlananSoru(int userId, int dersId) async{
  String requestUri = "${api.baseUrl}/soru/yanitlanan/kullanici/$userId/ders/$dersId";
  return GetRequestSoruNude(requestUri);
}

Future<SoruNudeBase> GetBeklenenSoruOgretmen(int userId, int dersId) async{
  String requestUri = "${api.baseUrl}/soru/beklenen/ogretmen/ders/$dersId";
  return GetRequestSoruNude(requestUri);
}

Future<SoruNudeBase> GetYanitlananSoruOgretmen(int userId, int dersId) async{
  String requestUri = "${api.baseUrl}/soru/yanitlanan/ogretmen/$userId/ders/$dersId";
  return GetRequestSoruNude(requestUri);
}


void CreateSoru(SoruCreateDto soruCreateDto){
  String requestUri = "${api.baseUrl}/soru/add";
  String encoded = jsonEncode(soruCreateDto);
  PostRequestSoru(requestUri, encoded);
}
