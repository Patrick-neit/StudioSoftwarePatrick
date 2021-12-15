import 'dart:convert';

AlbumsOfertados albumsOfertadosFromMap(String str) =>
    AlbumsOfertados.fromMap(json.decode(str));

String albumsOfertadosToMap(AlbumsOfertados data) => json.encode(data.toMap());

class AlbumsOfertados {
  AlbumsOfertados({
    required this.succes,
    required this.albumofertado,
  });

  final bool succes;
  final List<Albumofertado> albumofertado;

  factory AlbumsOfertados.fromMap(Map<String, dynamic> json) => AlbumsOfertados(
        succes: json["succes"],
        albumofertado: List<Albumofertado>.from(
            json["albumofertado"].map((x) => Albumofertado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "succes": succes,
        "albumofertado":
            List<dynamic>.from(albumofertado.map((x) => x.toMap())),
      };
}

class Albumofertado {
  Albumofertado({
    required this.id,
    required this.nombreCompleto,
    required this.tarifaContratacion,
    required this.cantidadFotos,
    required this.precio,
    required this.nombre,
    required this.descripcion,
    required this.direccion,
  });

  final int id;
  final String nombreCompleto;
  final String tarifaContratacion;
  final String cantidadFotos;
  final String precio;
  final String nombre;
  final String descripcion;
  final String direccion;

  factory Albumofertado.fromMap(Map<String, dynamic> json) => Albumofertado(
        id: json["id"],
        nombreCompleto: json["nombre_completo"],
        tarifaContratacion: json["tarifa_contratacion"],
        cantidadFotos: json["cantidad_fotos"],
        precio: json["precio"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre_completo": nombreCompleto,
        "tarifa_contratacion": tarifaContratacion,
        "cantidad_fotos": cantidadFotos,
        "precio": precio,
        "nombre": nombre,
        "descripcion": descripcion,
        "direccion": direccion,
      };
}
