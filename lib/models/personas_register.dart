import 'dart:convert';

RegisterUser registerUserFromMap(String str) =>
    RegisterUser.fromMap(json.decode(str));

String registerUserToMap(RegisterUser data) => json.encode(data.toMap());

class RegisterUser {
  RegisterUser({
    required this.nombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.ci,
    required this.ciExp,
    required this.celular,
    required this.direccion,
    required this.genero,
    required this.correo,
    required this.tipo,
  });

  final String nombre;
  final String primerApellido;
  final String segundoApellido;
  final String ci;
  final String ciExp;
  final String celular;
  final String direccion;
  final String genero;
  final String correo;
  final String tipo;

  factory RegisterUser.fromMap(Map<String, dynamic> json) => RegisterUser(
        nombre: json["nombres"],
        primerApellido: json["primer_apellido"],
        segundoApellido: json["segundo_apellido"],
        ci: json["ci"],
        ciExp: json["ci_exp"],
        celular: json["celular"],
        direccion: json["direccion"],
        genero: json["genero"],
        correo: json["correo"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "primer_apellido": primerApellido,
        "segundo_apellido": segundoApellido,
        "ci": ci,
        "ci_exp": ciExp,
        "celular": celular,
        "direccion": direccion,
        "genero": genero,
        "correo": correo,
        "tipo": tipo,
      };
}
