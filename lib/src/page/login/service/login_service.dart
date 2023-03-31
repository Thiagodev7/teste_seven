import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seventh/src/util/token_model.dart';

class LoginService {
  static Future<String?> login(String username, String password) async {
    var response = await http.post(
      Uri.parse('http://mobiletest.seventh.com.br/login'),
      body: {"username": username, "password": password},
    );
    if (response.statusCode == 200) {
      String token = TokenModel.fromJson(jsonDecode(response.body)).token!;
      return token;       
    } else {
        
        return 'erro ao buscor o usuario';
      }
  }
}
