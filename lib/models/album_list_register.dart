import 'dart:convert';

AlbumList albumListFromMap(String str) => AlbumList.fromMap(json.decode(str));

String albumListToMap(AlbumList data) => json.encode(data.toMap());

class AlbumList {
  AlbumList({
    required this.succes,
    required this.album,
  });

  final bool succes;
  final List<Album> album;

  factory AlbumList.fromMap(Map<String, dynamic> json) => AlbumList(
        succes: json["succes"],
        album: List<Album>.from(json["album"].map((x) => Album.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "succes": succes,
        "album": List<dynamic>.from(album.map((x) => x.toMap())),
      };
}

class Album {
  Album({
    required this.id,
    required this.nombreCompleto,
    required this.tarifaContratacion,
    required this.cantidadFotos,
    required this.precio,
  });

  final int id;
  final String nombreCompleto;
  final String tarifaContratacion;
  final String cantidadFotos;
  final String precio;

  factory Album.fromMap(Map<String, dynamic> json) => Album(
        id: json["id"],
        nombreCompleto: json["nombre_completo"],
        tarifaContratacion: json["tarifa_contratacion"],
        cantidadFotos: json["cantidad_fotos"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre_completo": nombreCompleto,
        "tarifa_contratacion": tarifaContratacion,
        "cantidad_fotos": cantidadFotos,
        "precio": precio,
      };
}
