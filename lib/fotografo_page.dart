import 'package:flutter/material.dart';

import 'package:software_proyect/Drawer/widget_drawer_fotografo.dart';
import 'package:software_proyect/global_var.dart';

class FotografoPage extends StatefulWidget {
  const FotografoPage({Key? key}) : super(key: key);

  @override
  _FotografoPageState createState() => _FotografoPageState();
}

class _FotografoPageState extends State<FotografoPage> {
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
                'assets/images/fotografopage.jpg',
                height: 160.0,
              ),
            ],
          ),
        ),
        drawer: const MenuFotografo(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/album_fotografo_create');
          },
          label: const Text('Crear Album'),
          icon: const Icon(Icons.album_rounded),
        ),
      ),
    );
  }
}
