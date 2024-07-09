import 'dart:async';
import 'dart:convert';
import 'dart:io';
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

  Future<List<CategoriesModel>> getCategoryList() async {
    try {
      final response = await http.get(
        Uri.parse('${Globals().urlApi}Category/getall'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImptYXNjaW9saSIsInJvbGUiOiJBIiwiU3lzdGVtTmFtZSI6IkRhdGFCaW5kIFNvbHV0aW9ucyIsIm5iZiI6MTcyMDU2MDc4MSwiZXhwIjoxNzIwNTY3OTgxLCJpYXQiOjE3MjA1NjA3ODF9.O9KTV2V1tsXaSjyjAAnjO3KnohEQ9Ijr7WMPwZadl2U'
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;

        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return CategoriesModel(
              map['categoryCode'] as String,
              map['categoryName'] as String,
              map['categoryDescription'] as String);
        }).toList();
      } else {
        final body = json.decode(response.body) as List;

        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return CategoriesModel(
              map['categoryCode'] as String,
              map['categoryName'] as String,
              map['categoryDescription'] as String);
        }).toList();
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('error fetching data');
    }
  }

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token').toString();
  }
}
