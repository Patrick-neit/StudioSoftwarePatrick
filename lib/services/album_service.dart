import 'package:http/http.dart' as http;
import 'package:software_proyect/models/album_register.dart';

class AlbumService {
  Future<bool> albumregister(AlbumCreate albumCreate) async {
    const url = 'http://10.0.2.2:8000/api/crear/evento';
    var album = albumCreateToMap(albumCreate);
    final response = await http.post(
      Uri.parse(url),
      body: album,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // ignore: avoid_print

      // ignore: avoid_print
      print(album);
      return true;
    } else {
      return false;
    }
  }
}
