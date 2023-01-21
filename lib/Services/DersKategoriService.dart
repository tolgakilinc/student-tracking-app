import 'dart:convert';
import 'package:developer_student/Models/DersKategoriBase.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;
import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/DenemeCreateDto.dart';
import 'package:developer_student/Models/DenemeDeleteDto.dart';
Future<DersKategoriBase> GetRequestDersKategori(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return DersKategoriBase.fromJson(jsonDecode(response.body));
  }else{
    print("DersKategoriService, ${response.statusCode}");
  }
}

Future<DersKategoriBase> GetAllDersKategori() async{
  String requestUri = "${api.baseUrl}/dersKategori";
  return GetRequestDersKategori(requestUri);
}