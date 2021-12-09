import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer_fotografo.dart';

class AlbumFotografoCreate extends StatefulWidget {
  const AlbumFotografoCreate({Key? key}) : super(key: key);

  @override
  _AlbumFotografoCreateState createState() => _AlbumFotografoCreateState();
}

class _AlbumFotografoCreateState extends State<AlbumFotografoCreate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload a new album!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [],
          ),
        ),
        drawer: const MenuFotografo(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/listado_events_page');
          },
          label: const Text('Crear Album'),
          icon: const Icon(Icons.album_rounded),
        ),
      ),
    );
  }
}
