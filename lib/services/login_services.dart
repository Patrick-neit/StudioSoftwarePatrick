import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:software_proyect/global_var.dart';
import 'package:software_proyect/models/login_register.dart';

class LoginService {
  Future<bool> loginregister(LoginUser loginUser) async {
    const url = 'http://127.0.0.1:8000/api/autentificar';
    var log = loginUserToMap(loginUser);
    final response = await http.post(
      Uri.parse(url),
      body: log,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // ignore: avoid_print
      var data = json.decode(response.body);
      idusuario = data['id'];
      nombreusuarioautentificado = data['nombre'];
      tipousuario = data['tipo'];
      // ignore: avoid_print
      print(tipousuario);
      return true;
    } else {
      // ignore: avoid_print
      print('Algo salio mal');
      return false;
    }
  }
}
