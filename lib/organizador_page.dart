import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer.dart';
import 'package:software_proyect/global_var.dart';

class OrganizadorPage extends StatefulWidget {
  const OrganizadorPage({Key? key}) : super(key: key);

  @override
  _OrganizadorPageState createState() => _OrganizadorPageState();
}

class _OrganizadorPageState extends State<OrganizadorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wellcome Back!  ' +
              nombreusuarioautentificado +
              '  ' +
              tipousuario),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Whats on your mind?'),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/eventos.jpg',
                height: 160.0,
              ),
            ],
          ),
        ),
        drawer: const MenuLateral(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/view_event_Create');
          },
          label: const Text('Crear Evento'),
          icon: const Icon(Icons.event_busy_rounded),
        ),
      ),
    );
  }
}
