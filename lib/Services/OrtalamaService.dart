import 'dart:convert';
import 'package:developer_student/Models/OrtalamaBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<OrtalamaBase> GetRequestOrtalama(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return OrtalamaBase.fromJson(jsonDecode(response.body));
  }else{
    print("OrtalamaService, ${response.statusCode}");
  }
}

Future<OrtalamaBase> GetAllOrtalamas() async{
  String requestUri = "${api.baseUrl}/deneme/ortalamalar";
  return GetRequestOrtalama(requestUri);
}
