import 'dart:convert';
import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/DenemeCreateDto.dart';
import 'package:developer_student/Models/DenemeDeleteDto.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<DenemeBase> GetRequestDeneme(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return DenemeBase.fromJson(jsonDecode(response.body));
  }else{
    print("DenemeService, ${response.statusCode}");
  }
}

Future<void> PostRequestDeneme(String requestUri, String body) async{
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
    print("DenemeService, ${response.statusCode}");
  }
}

Future<DenemeBase> GetAllDeneme() async{
  String requestUri = "${api.baseUrl}/deneme";
  return GetRequestDeneme(requestUri);
}

void DeleteDeneme(DenemeDeleteDto denemeDeleteDto){
  String requestUri = "${api.baseUrl}/deneme/delete";
  String encoded = jsonEncode(denemeDeleteDto);
  PostRequestDeneme(requestUri, encoded);
}

void CreateDeneme(DenemeCreateDto denemeCreateDto){
  String requestUri = "${api.baseUrl}/deneme/add";
  String encoded = jsonEncode(denemeCreateDto);
  PostRequestDeneme(requestUri, encoded);
}