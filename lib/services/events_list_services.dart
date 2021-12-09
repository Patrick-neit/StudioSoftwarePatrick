import 'package:http/http.dart' as http;
import 'package:software_proyect/models/events_list_register.dart';

class EventosServices {
  Future<List<Evento>>? geteventos() async {
    // ignore: prefer_const_declarations
    final url = 'http://10.0.2.2:8000/api/obtener/eventos';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final eventosresponse = eventosListFromMap(response.body);
      return eventosresponse.eventos;
    }
    return [];
  }
}
