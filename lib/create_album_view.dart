import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer_fotografo.dart';

class AlbumCreateView extends StatefulWidget {
  const AlbumCreateView({Key? key}) : super(key: key);

  @override
  _AlbumCreateViewState createState() => _AlbumCreateViewState();
}

class _AlbumCreateViewState extends State<AlbumCreateView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new Album'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Whats on your mind?'),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        drawer: const MenuFotografo(),
      ),
    );
  }
}
