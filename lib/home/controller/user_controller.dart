import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/user_service.dart';

class UserController extends ChangeNotifier {
  bool isLoading = false;
  List<UserModel>? userList;
  final IUserService _userService = UserService();

  fetchUsers() async {
    isLoading = true;
    await _userService.fetchAllUsers().then((value) {
      log(value.toString());
      userList = value;
    });
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }
}
