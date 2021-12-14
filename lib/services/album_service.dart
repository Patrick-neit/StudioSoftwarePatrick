import 'package:http/http.dart' as http;
import 'package:software_proyect/models/album_register.dart';

class AlbumService {
  Future<bool> albumregister(AlbumCreate albumCreate) async {
    const url = 'http://127.0.0.1:8000/api/crear/album';
    var album = albumCreateToMap(albumCreate);
    final response = await http.post(
      Uri.parse(url),
      body: album,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // ignore: avoid_print
      print(album);
      return true;
    } else {
      return false;
    }
  }
}
