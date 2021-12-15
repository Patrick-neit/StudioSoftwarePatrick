import 'package:flutter/material.dart';
import 'package:software_proyect/global_var.dart';

class MenuCliente extends StatelessWidget {
  const MenuCliente({Key? key}) : super(key: key);

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
              Navigator.pushNamed(context, '/cliente_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Ver Albums'),
            onTap: () {
              Navigator.pushNamed(context, '/albums_ofertados_list');
            },
          ),
          ListTile(
            leading: const Icon(Icons.event_available_sharp),
            title: const Text('Eventos Proximos'),
            onTap: () {
              Navigator.pushNamed(context, '/listado_events_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.bedtime_rounded),
            title: const Text('Log Out'),
            onTap: () {
              tipousuario = "";
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
