import 'package:http/http.dart' as http;
import 'package:software_proyect/models/event_register.dart';

class EventRegisterService {
  Future<bool> eventsregister(EventRegister eventRegister) async {
    const url = 'http://getdataproject.com/ficct/public/api/crear/evento';
    var event = eventRegisterToMap(eventRegister);
    final response = await http.post(
      Uri.parse(url),
      body: event,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // ignore: avoid_print

      // ignore: avoid_print
      print(event);
      return true;
    } else {
      return false;
    }
  }
}
