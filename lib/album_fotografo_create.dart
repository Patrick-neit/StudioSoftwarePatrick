import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer_fotografo.dart';
import 'package:software_proyect/global_var.dart';
import 'package:software_proyect/models/album_register.dart';
import 'package:software_proyect/services/album_service.dart';

class AlbumFotografoCreate extends StatefulWidget {
  const AlbumFotografoCreate({Key? key}) : super(key: key);

  @override
  _AlbumFotografoCreateState createState() => _AlbumFotografoCreateState();
}

class _AlbumFotografoCreateState extends State<AlbumFotografoCreate> {
  TextEditingController controllercantidad = TextEditingController();
  TextEditingController controllerprecio = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload a new album!'),
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      const Text('Informacion del Album!'),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _cantidadfotos(),
                      const SizedBox(
                        height: 35,
                      ),
                      _precio(),
                      const SizedBox(
                        height: 35,
                      ),
                      _submit(),
                      const SizedBox(
                        height: 40,
                      )
                    ]))),
          ],
        ),
        drawer: const MenuFotografo(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            AlbumCreate albumCreate = AlbumCreate(
              cantidadFotos: controllercantidad.text,
              precio: controllerprecio.text,
              fotografoId: idusuario,
            );

            bool albumSucces = await AlbumService().albumregister(albumCreate);
            if (albumSucces) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => AlertDialog(
                  title: const Text('Album Creado'),
                  //content: const Text('Volver'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/fotografo_page');
                        },
                        child: const Text('Back')),
                  ],

                  //backgroundColor: Colors.redAccent,
                  //shape: CircleBorder(),
                ),
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => const AlertDialog(
                    title: Text('Re check the information|| Empty values'),
                    content: Text('Back')

                    //backgroundColor: Colors.redAccent,
                    //shape: CircleBorder(),
                    ),
              );
            }
          },
          label: const Text('Crear Album'),
          icon: const Icon(Icons.album_rounded),
        ),
      ),
    );
  }

  Widget _cantidadfotos() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllercantidad,
          decoration: const InputDecoration(
            icon: Icon(Icons.production_quantity_limits_rounded),
            labelText: 'Cantidad Fotos del Album',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _precio() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerprecio,
          decoration: const InputDecoration(
            icon: Icon(Icons.monetization_on_rounded),
            labelText: 'Precio del Album',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _submit() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Crear evento'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10.0,
        color: Colors.greenAccent,
        onPressed: () async {
          AlbumCreate albumCreate = AlbumCreate(
            cantidadFotos: controllercantidad.text,
            precio: controllerprecio.text,
            fotografoId: idusuario,
          );

          bool albumSucces = await AlbumService().albumregister(albumCreate);
          if (albumSucces) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => AlertDialog(
                title: const Text('Album Creado'),
                //content: const Text('Volver'),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/fotografo_page');
                      },
                      child: const Text('Back')),
                ],

                //backgroundColor: Colors.redAccent,
                //shape: CircleBorder(),
              ),
            );
          } else {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => const AlertDialog(
                  title: Text('Re check the information|| Empty values'),
                  content: Text('Back')

                  //backgroundColor: Colors.redAccent,
                  //shape: CircleBorder(),
                  ),
            );
          }
        },
      );
    });
  }
}
