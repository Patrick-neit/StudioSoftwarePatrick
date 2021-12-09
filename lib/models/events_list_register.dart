// To parse this JSON data, do
//
//     final eventosList = eventosListFromMap(jsonString);

import 'dart:convert';

EventosList eventosListFromMap(String str) =>
    EventosList.fromMap(json.decode(str));

String eventosListToMap(EventosList data) => json.encode(data.toMap());

class EventosList {
  EventosList({
    required this.success,
    required this.eventos,
  });

  final bool success;
  final List<Evento> eventos;

  factory EventosList.fromMap(Map<String, dynamic> json) => EventosList(
        success: json["success"],
        eventos:
            List<Evento>.from(json["eventos"].map((x) => Evento.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "eventos": List<dynamic>.from(eventos.map((x) => x.toMap())),
      };
}

class Evento {
  Evento({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.direccion,
    required this.fecha,
    required this.precioEntrada,
  });

  final int id;
  final String nombre;
  final String descripcion;
  final String direccion;
  final DateTime fecha;
  final String precioEntrada;

  factory Evento.fromMap(Map<String, dynamic> json) => Evento(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        fecha: DateTime.parse(json["fecha"]),
        precioEntrada: json["precio_entrada"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "direccion": direccion,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "precio_entrada": precioEntrada,
      };
}
