import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

abstract class IUserService {
  Future<List<UserModel>?> fetchAllUsers();
}

class UserService extends IUserService {
  @override
  Future<List<UserModel>?> fetchAllUsers() async {
    var url = Uri.parse("https://reqres.in/api/users?page=1");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    final list = (jsonData["data"] as List).map((item) => UserModel.fromJson(item)).toList();
    return list;
  }
}
