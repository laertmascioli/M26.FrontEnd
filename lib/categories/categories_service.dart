import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m26/Custom/globals.dart';
import 'package:m26/categories/categories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesService {
  Dio dio = Dio();

  addCategory(CategoriesModel model) async {
    try {
      final response = await http.post(
        Uri.parse('${Globals().urlApi}Category/add'),
        body: jsonEncode(
          model.toJson(),
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${_getToken()}'
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
