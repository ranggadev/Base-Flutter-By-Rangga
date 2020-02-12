import 'dart:convert';
import 'package:base_flutter_by_rangga/common/MyConstanta.dart';
import 'package:base_flutter_by_rangga/models/auth/UserLoginModel.dart';
import 'package:base_flutter_by_rangga/models/auth/UserRegisterModel.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static Future<UserRegisterModel> userRegister(var body) async {
    print("rangga user register : start request");
    final response = await http.post(Uri.encodeFull(MyConstanta.baseUrl + "/register"),
      headers: {"Accept": "application/json"},
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("rangga user register : success request");
      return UserRegisterModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('rangga user register : Failed to request');
    }
  }

  static Future<UserLoginModel> userLogin(var body) async {
    print("rangga user login : start request");
    final response = await http.post(Uri.encodeFull(MyConstanta.baseUrl + "/login"),
      headers: {"Accept": "application/json"},
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("rangga user login : success request");
      return UserLoginModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('rangga user login : Failed to request');
    }
  }
}