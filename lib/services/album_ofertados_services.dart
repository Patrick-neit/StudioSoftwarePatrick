import 'package:http/http.dart' as http;

import 'package:software_proyect/models/albums_ofertados_list_register.dart';

class AlbumOfertadosService {
  Future<List<Albumofertado>>? getalbumsofertados() async {
    // ignore: prefer_const_declarations
    final url =
        'http://getdataproject.com/ficct/public/api/obtener/albums/ofertados';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final albumsofertadosresponse = albumsOfertadosFromMap(response.body);
      return albumsofertadosresponse.albumofertado;
    }
    return [];
  }
}
