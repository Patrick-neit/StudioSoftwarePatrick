import 'dart:io';

//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:image_picker/image_picker.dart';
import 'package:software_proyect/Drawer/vidget_drawer_cliente.dart';
import 'package:software_proyect/global_var.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({Key? key}) : super(key: key);

  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  File? image;
  Future pickimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    final imagentemporal = File(image.path);
    setState(() => this.image = imagentemporal);
    {}
  }

  TextEditingController controllerdato = TextEditingController();
  String path = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey,
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
              //const Spacer(),
              const Text('Whats on your mind today?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

              const SizedBox(
                height: 20.0,
              ),
              image != null
                  ? ClipOval(
                      child: Image.file(image!,
                          width: 200, height: 180, fit: BoxFit.cover),
                    )
                  : FloatingActionButton.extended(
                      onPressed: () {
                        pickimage(ImageSource.gallery);
                      },
                      label: const Text('Elegir de Galeria'),
                      icon: const Icon(Icons.image_outlined),
                      backgroundColor: Colors.redAccent),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    pickimage(ImageSource.camera);
                  },
                  label: const Text('Abrir Camara'),
                  icon: const Icon(Icons.camera_enhance_sharp),
                  backgroundColor: Colors.greenAccent,
                  hoverColor: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5)),
            ],
          ),
        ),
        drawer: const MenuCliente(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/listado_events_page');
          },
          label: const Text('Ver eventos Proximos'),
          icon: const Icon(Icons.event_busy_rounded),
        ),
      ),
    );
  }
}
