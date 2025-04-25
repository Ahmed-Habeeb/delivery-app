import 'dart:convert';
import 'package:delivery_app/core/api/api_client/base_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> checkDeliveryLogin(
      String langNo, String dlvryNo, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final BaseDio client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginResponseModel> checkDeliveryLogin(
      String langNo, String dlvryNo, String password) async {
    final url = 'CheckDeliveryLogin';
    final body = jsonEncode({
      "Value": {
        "P_LANG_NO": langNo,
        "P_DLVRY_NO": dlvryNo,
        "P_PSSWRD": password,
      }
    });

    final response = await client.post(
      url,
      data: body,



    );

    if (response.success ) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to login: ${response.error}');
    }
  }
}