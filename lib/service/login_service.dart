import 'dart:async';
import 'dart:convert';

import 'package:caracal_words/service/id_repository.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

Future<LoginResponse> login(LoginRequest loginRequest) async {
  print('login body : ' + loginRequest.username + ' ' + loginRequest.password);
  final response = await http.post(
    Uri.parse('http://localhost:8080/caracal-words/public/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': loginRequest.username,
      'password': loginRequest.password,
    }),
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print('regoing to decode response');
    LoginResponse res = LoginResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
    print('response decoded successfully');
    saveToken(res.token);
    return res;
  } else {
    // If the server did not return a 200 services response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
}

LoginResponse parsLoginResponse(String responseBody) {
  try {
    Map<String, dynamic> map = jsonDecode(responseBody) as Map<String, dynamic>;
    return LoginResponse.fromJson(map);
  } catch (e) {
    return const LoginResponse(
      token: '1',
    );
  }
}

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;

  const LoginRequest({
    required this.username,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      username: json['username'].toString(),
      password: json['password'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

  // factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  // Map<String, dynamic> toJson() => _$LoginRequestToJson(json);
}

class LoginResponse {
  final String token;

  const LoginResponse({
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'].toString(),
    );
  }
}
