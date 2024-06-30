import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m26/Custom/globals.dart';
import 'package:m26/login/login_model.dart';

class LoginService {
  Dio dio = Dio();

  getLogin(String username, String password) async {
    try {
      // final loginModel = LoginModel(username, password);
      final loginModel = LoginModel('jmascioli', '123456');

      var headers = {'Content-Type': 'application/json'};

      // var request =
      //     http.Request('POST', Uri.parse('${Globals().urlApi}User/login'));

      var request = http.Request(
          'POST', Uri.parse('https://10.0.2.2:7026/api/User/login'));

      request.body = jsonEncode(loginModel.toJson());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return response;
      } else {
        AlertDialog(
          title: Text(response.reasonPhrase.toString()),
        );
      }
    } on DioException catch (error) {
      AlertDialog(
        title: Text(error.message.toString()),
      );
    }
  }

  getCPF(String cpf) async {
    try {
      final dio = Dio();
      var response = await dio
          .get("https://apiseverinos.azurewebsites.net/api/ValidacoesCPF/$cpf");

      if (response.statusCode == 200) {
        return response.data;
      } else {
        AlertDialog(
          title: Text(response.statusMessage.toString()),
        );
      }
    } on DioException catch (error) {
      AlertDialog(
        title: Text(error.message.toString()),
      );
    }
  }

  putSenha(final context, String cpf, String senha) async {
    final response = await http.put(
      Uri.parse(
          'https://apiseverinos.azurewebsites.net/api/Login/ $cpf / $senha'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      AlertDialog(
        title: Text(response.reasonPhrase.toString()),
      );
    }
  }
}
