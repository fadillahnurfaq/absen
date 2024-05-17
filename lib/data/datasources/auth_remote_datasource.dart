import 'dart:convert';

import 'package:absensi_fic/core/constants/variables.dart';
import 'package:absensi_fic/data/models/auth_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String username, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to login');
    }
  }

  Future<Either<String, AuthResponseModel>> register(
      String email, String name, String password, String confPassword) async {
    final url = Uri.parse('${Variables.baseUrl}/api/register');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'name': name,
        'password': password,
        'password_confirmation': confPassword,
      }),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      final errors = jsonDecode(response.body)['errors'] ?? [];
      return Left(errors.join(","));
    }
  }
}
