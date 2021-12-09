// To parse this JSON data, do
//
//     final fotografosList = fotografosListFromMap(jsonString);

import 'dart:convert';

FotografosList fotografosListFromMap(String str) =>
    FotografosList.fromMap(json.decode(str));

String fotografosListToMap(FotografosList data) => json.encode(data.toMap());

class FotografosList {
  FotografosList({
    required this.succes,
    required this.fotografo,
  });

  final bool succes;
  final List<Fotografo> fotografo;

  factory FotografosList.fromMap(Map<String, dynamic> json) => FotografosList(
        succes: json["succes"],
        fotografo: List<Fotografo>.from(
            json["fotografo"].map((x) => Fotografo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "succes": succes,
        "fotografo": List<dynamic>.from(fotografo.map((x) => x.toMap())),
      };
}

class Fotografo {
  Fotografo({
    required this.id,
    required this.nombreCompleto,
    required this.ci,
    required this.celular,
    required this.correo,
    required this.direccion,
    required this.tarifaContratacion,
  });

  final int id;
  final String nombreCompleto;
  final String ci;
  final String celular;
  final String correo;
  final String direccion;
  final String tarifaContratacion;

  factory Fotografo.fromMap(Map<String, dynamic> json) => Fotografo(
        id: json["id"],
        nombreCompleto: json["nombre_completo"],
        ci: json["ci"],
        celular: json["celular"],
        correo: json["correo"],
        direccion: json["direccion"],
        tarifaContratacion: json["tarifa_contratacion"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre_completo": nombreCompleto,
        "ci": ci,
        "celular": celular,
        "correo": correo,
        "direccion": direccion,
        "tarifa_contratacion": tarifaContratacion,
      };
}
