import 'dart:convert';
import 'package:developer_student/Models/LiseBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;


Future<LiseBase> GetRequestLise(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return LiseBase.fromJson(jsonDecode(response.body));
  }else{
    print("LiseService, ${response.statusCode}");
  }
}

Future<LiseBase> GetAllLise() async{
  String requestUri = "${api.baseUrl}/lise";
  return GetRequestLise(requestUri);
}
