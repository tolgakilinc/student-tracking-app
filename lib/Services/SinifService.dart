import 'dart:convert';
import 'package:developer_student/Models/SinifBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;


Future<SinifBase> GetRequestSinif(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return SinifBase.fromJson(jsonDecode(response.body));
  }else{
    print("SinifService, ${response.statusCode}");
  }
}

Future<SinifBase> GetAllSinif() async{
  String requestUri = "${api.baseUrl}/sınıf";
  return GetRequestSinif(requestUri);
}
