import 'dart:convert';
import 'package:developer_student/Models/UniversiteBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;


Future<UniversiteBase> GetRequestUniversite(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return UniversiteBase.fromJson(jsonDecode(response.body));
  }else{
    print("UniversiteService, ${response.statusCode}");
  }
}

Future<UniversiteBase> GetAllUniversite() async{
  String requestUri = "${api.baseUrl}/universite";
  return GetRequestUniversite(requestUri);
}
