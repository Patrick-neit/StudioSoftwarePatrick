import 'dart:convert';

AlbumCreate albumCreateFromMap(String str) =>
    AlbumCreate.fromMap(json.decode(str));

String albumCreateToMap(AlbumCreate data) => json.encode(data.toMap());

class AlbumCreate {
  AlbumCreate({
    required this.cantidadFotos,
    required this.precio,
    required this.fotografoId,
  });

  final String? cantidadFotos;
  final String? precio;
  final int? fotografoId;

  factory AlbumCreate.fromMap(Map<String, dynamic> json) => AlbumCreate(
        cantidadFotos: json["cantidad_fotos"],
        precio: json["precio"],
        fotografoId: json["fotografo_id"],
      );

  Map<String, dynamic> toMap() => {
        "cantidad_fotos": cantidadFotos,
        "precio": precio,
        "fotografo_id": fotografoId,
      };
}
