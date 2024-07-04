import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m26/Custom/globals.dart';
import 'package:m26/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Dio dio = Dio();

  getLogin(String username, String password) async {
    try {
      // final loginModel = LoginModel(username, password);
      // final loginModel = LoginModel('jmascioli', '123456');
      final loginModel = LoginModel('harley', '123456');

      final response = await http.post(
        Uri.parse('${Globals().urlApi}User/login'),
        body: jsonEncode(
          loginModel.toJson(),
        ),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var user = jsonDecode(response.body);
        _getSalvar(user['id'].toString(), user['token'].toString());
        return true;
      } else {
        AlertDialog(
          title: Text(
            response.reasonPhrase.toString(),
          ),
        );
        return false;
      }
    } on DioException catch (error) {
      AlertDialog(
        title: Text(error.message.toString()),
      );
    }
  }

  _getSalvar(String id, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserID', id);
    prefs.setString('token', token);
  }
}
