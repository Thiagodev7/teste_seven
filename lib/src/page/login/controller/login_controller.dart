


import 'package:flutter/material.dart';

import '../service/login_service.dart';

class LoginController {


  late String? token;
  late bool loged = true;
  final user = TextEditingController();
  final password = TextEditingController();

  Future login() async {    
     token = await LoginService.login(user.text, password.text);    
  }
}
