import 'dart:convert';
import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Models/SignUpCreateDto.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:http/http.dart' as http;
import 'package:developer_student/Constants/API.dart' as api;

Future<UserBase> GetRequestUser(String requestUri) async{
  final response = await http.get(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",
      }
  );

  if(response.statusCode == 200){
    return UserBase.fromJson(jsonDecode(response.body));
  }else{
    print("LessonService, ${response.statusCode}");
  }
}

Future<UserBase> PostRequestUser(String requestUri) async{
  final response = await http.post(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",

      },
  );

  if(response.statusCode == 200){
    return UserBase.fromJson(jsonDecode(response.body));
  }else{
    print(response.body);
    print("LessonService, ${response.statusCode}");
  }
}

Future<UserBase> CreatePost(String requestUri, {String body}) async{
  final response = await http.post(
      Uri.parse(requestUri),
      headers: {
        "Content-Type": "application/json",

      },
      body: body
  );

  if(response.statusCode == 200){
    Map json = jsonDecode(response.body);
    ToastHelper().makeToastMessage(json["message"]);
  }else{
    print(response.body);
    print("LessonService, ${response.statusCode}");
  }
}

Future<UserBase> GetUser(int userId) async{
  String requestUri = "${api.baseUrl}/kullanicilar/$userId";
  return GetRequestUser(requestUri);
}

Future<UserBase> Login(String email, String password) async{
  String requestUri = "${api.baseUrl}/kullanicilar/login?email=$email&password=$password";
  return PostRequestUser(requestUri);
}

Future<UserBase> GetAllUser() async{
  String requestUri = "${api.baseUrl}/kullanicilar";
  return GetRequestUser(requestUri);
}

void CreateSignUp(SignUpCreateDto signUpCreateDto){
  String requestUri = "${api.baseUrl}/kullanicilar/add";
  String encoded = jsonEncode(signUpCreateDto);
  CreatePost(requestUri, body:encoded);
}

void UpdateUser(UpdateUserDto updateUserDto){
  String requestUri = "${api.baseUrl}/kullanicilar/update";
  String encoded = jsonEncode(updateUserDto);
  CreatePost(requestUri, body:encoded);
}