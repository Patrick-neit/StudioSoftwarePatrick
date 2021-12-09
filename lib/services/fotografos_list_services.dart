import 'package:http/http.dart' as http;

import 'package:software_proyect/models/fotografos_list_register.dart';

class FotografosListServices {
  Future<List<Fotografo>>? getfotografos() async {
    // ignore: prefer_const_declarations
    final url = 'http://10.0.2.2:8000/api/listado/fotografos';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final fotografoslistresponse = fotografosListFromMap(response.body);
      return fotografoslistresponse.fotografo;
    }
    return [];
  }
}
