import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m26/Custom/globals.dart';
import 'package:m26/register/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  Dio dio = Dio();

  addUser(RegisterModel regModel) async {
    try {
      var test = jsonEncode(
        regModel.toJson(),
      );
      final response = await http.post(
        Uri.parse('${Globals().urlApi}User/add'),
        body: jsonEncode(
          regModel.toJson(),
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImptYXNjaW9saSIsInJvbGUiOiJBIiwiU3lzdGVtTmFtZSI6IkRhdGFCaW5kIFNvbHV0aW9ucyIsIm5iZiI6MTcyMDA1Mjc5MywiZXhwIjoxNzIwMDU5OTkzLCJpYXQiOjE3MjAwNTI3OTN9.k7Kp--0naUsu2mUZwVeNvv-p1Y8C2fpkQaDYho0WhWk'
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (error) {
      AlertDialog(
        title: Text(error.message.toString()),
      );
    }
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }
}
