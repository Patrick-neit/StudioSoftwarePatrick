import 'package:flutter/material.dart';
import 'package:software_proyect/global_var.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //Drawer para crear el menu
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/studiopho.jpg'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, '/organizador_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics_rounded),
            title: const Text('Crear Evento'),
            onTap: () {
              Navigator.pushNamed(context, '/view_event_Create');
            },
          ),
          ListTile(
            leading: const Icon(Icons.event_available_sharp),
            title: const Text('Mis eventos'),
            onTap: () {
              Navigator.pushNamed(context, '/listado_events_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_enhance_sharp),
            title: const Text('Buscar Fotografos Disponibles'),
            onTap: () {
              Navigator.pushNamed(context, '/list_fotografos_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.bedtime_rounded),
            title: const Text('Log Out'),
            onTap: () {
              tipousuario = "";
              // ignore: avoid_print
              print(tipousuario);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login_page', (Route<dynamic> route) => false);
              //Navigator.pushNamed(context, '/login_page');
            },
          ),
        ],
      ),
    );
  }
}
