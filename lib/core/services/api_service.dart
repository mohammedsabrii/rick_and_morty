import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio dio;

  final String baseUrl = "https://rickandmortyapi.com/api/";

  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    debugPrint("Request => $endPoint");

    final response = await dio.get("$baseUrl$endPoint");

    return response.data;
  }
}
