import 'dart:convert';
import 'package:developer_student/Models/AlanBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;


Future<AlanBase> GetRequestAlan(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return AlanBase.fromJson(jsonDecode(response.body));
  }else{
    print("AlanService, ${response.statusCode}");
  }
}

Future<AlanBase> GetAllAlan() async{
  String requestUri = "${api.baseUrl}/alan";
  return GetRequestAlan(requestUri);
}
