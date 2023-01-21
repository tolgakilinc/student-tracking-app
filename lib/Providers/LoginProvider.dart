import 'package:developer_student/Models/UserBase.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
  User _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  User getUser(){
    return _user;
  }
}