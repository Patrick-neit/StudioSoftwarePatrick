import 'package:http/http.dart' as http;
import 'package:software_proyect/global_var.dart';
import 'package:software_proyect/models/album_list_register.dart';

class AlbumListService {
  Future<List<Album>>? getlistalbumes() async {
    // ignore: prefer_const_declarations
    final url =
        'http://getdataproject.com/ficct/public/api/obtener/albums?fotografo_id=' +
            idusuario.toString();

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final albumsresponse = albumListFromMap(response.body);
      return albumsresponse.album;
    }
    return [];
  }
}
