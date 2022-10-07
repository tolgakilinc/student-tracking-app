import 'dart:convert';
import 'package:developer_student/Models/ProgramBase.dart';
import 'package:developer_student/Models/ProgramCreateDto.dart';
import 'package:developer_student/Models/ProgramDeleteDto.dart';
import 'package:developer_student/Models/SoruBase.dart';
import 'package:developer_student/Models/SoruCreateDto.dart';
import 'package:developer_student/Models/SoruHavuzBase.dart';
import 'package:developer_student/Models/SoruHavuzCreateDto.dart';
import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<SoruHavuzBase> GetRequestSoruHavuz(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return SoruHavuzBase.fromJson(jsonDecode(response.body));
  }else{
    print(response.body);

    print("SoruHavuz, ${response.statusCode}");
  }
}

Future<void> PostRequestSoruHavuz(String requestUri, String body) async{
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
    print("SoruHavuzService, ${response.statusCode}");
  }
}

Future<SoruHavuzBase> GetAllSoruHavuzByDersId(int dersId) async{
  String requestUri = "${api.baseUrl}/soruHavuz/ders/$dersId";
  return GetRequestSoruHavuz(requestUri);
}

void CreateSoruHavuz(SoruHavuzCreateDto soruHavuzCreateDto){
  String requestUri = "${api.baseUrl}/soruHavuz/add";
  String encoded = jsonEncode(soruHavuzCreateDto);
  PostRequestSoruHavuz(requestUri, encoded);
}