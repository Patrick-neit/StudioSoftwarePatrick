// To parse this JSON data, do
//
//     final eventRegister = eventRegisterFromMap(jsonString);

import 'dart:convert';

EventRegister eventRegisterFromMap(String str) =>
    EventRegister.fromMap(json.decode(str));

String eventRegisterToMap(EventRegister data) => json.encode(data.toMap());

class EventRegister {
  EventRegister({
    required this.nombre,
    required this.descripcion,
    required this.direccion,
    required this.fecha,
    required this.precioEntrada,
    required this.organizadorId,
  });

  final String nombre;
  final String descripcion;
  final String direccion;
  final String fecha;
  final String precioEntrada;
  final String organizadorId;

  factory EventRegister.fromMap(Map<String, dynamic> json) => EventRegister(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        fecha: json["fecha"],
        precioEntrada: json["precio_entrada"],
        organizadorId: json["organizador_id"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "direccion": direccion,
        "fecha": fecha,
        "precio_entrada": precioEntrada,
        "organizador_id": organizadorId,
      };
}
