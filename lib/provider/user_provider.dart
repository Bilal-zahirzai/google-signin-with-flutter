import 'package:flutter/cupertino.dart';
import 'package:project1/services/auth_methods.dart';

import '../models/user_data.dart';

class UserProvider with ChangeNotifier{
  UserData? _user;
  final AuthMethods _authMethods=AuthMethods();
  UserData? get getUser=>_user;

  Future<void> refreshUser() async{
    UserData user=await _authMethods.getUserDetails();
    _user=user;
    notifyListeners();
  }
}