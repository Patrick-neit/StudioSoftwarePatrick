import 'package:flutter/material.dart';
import 'package:software_proyect/album_fotografo_create.dart';
import 'package:software_proyect/cliente_page.dart';
import 'package:software_proyect/fotografo_page.dart';
import 'package:software_proyect/list_fotografos_page.dart';
import 'package:software_proyect/listado_events_page.dart';
import 'package:software_proyect/locations/event_location.dart';

import 'package:software_proyect/login_page.dart';
import 'package:software_proyect/organizador_page.dart';
import 'package:software_proyect/payment_services/payment_stack.dart';
import 'package:software_proyect/register_user_page.dart';
import 'package:software_proyect/view_event_create.dart';

void main() {
  runApp(const StudioSoftwareApp());
}

class StudioSoftwareApp extends StatelessWidget {
  const StudioSoftwareApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Studio|Software',
      home: const SoftwareStudio(),
      routes: <String, WidgetBuilder>{
        '/loginpage': (BuildContext context) => const SoftwareStudio(),
        '/register_user_page': (BuildContext context) =>
            const RegisterUserPage(),
        '/login_page': (BuildContext context) => const LoginPage(),
        '/organizador_page': (BuildContext context) => const OrganizadorPage(),
        '/cliente_page': (BuildContext context) => const ClientePage(),
        '/fotografo_page': (BuildContext context) => const FotografoPage(),
        '/view_event_Create': (BuildContext context) => const EventCreatePage(),
        '/listado_events_page': (BuildContext context) =>
            const ListViewEvents(),
        '/list_fotografos_page': (BuildContext context) =>
            const FotografosListView(),
        '/event_location': (BuildContext context) => const EventLocation(),
        '/payment_stack': (BuildContext context) => const MyPayment(),
        '/album_fotografo_create': (BuildContext context) =>
            const AlbumFotografoCreate(),
      },
    );
  }
}

class SoftwareStudio extends StatefulWidget {
  const SoftwareStudio({Key? key}) : super(key: key);

  @override
  _SigLoginState createState() => _SigLoginState();
}

class _SigLoginState extends State<SoftwareStudio> {
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('WELLCOME TO YOUR FAVORITE PHOTOGRAPHY PLATFORM',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Flexible(
                child: Image.asset(
                  'assets/images/studiopho.jpg',
                  height: 200.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              _bottomRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Registrate'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.lightBlueAccent,
          onPressed: () {
            //Aqui tenemos q llamar a la funcion login
            Navigator.pushReplacementNamed(context, '/login_page');
            // Login();
          });
    });
  }
}
