import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/vidget_drawer_cliente.dart';

import 'package:software_proyect/models/albums_ofertados_list_register.dart';

import 'package:software_proyect/services/album_ofertados_services.dart';

class AlbumsOfertadosView extends StatefulWidget {
  const AlbumsOfertadosView({Key? key}) : super(key: key);

  @override
  _AlbumsOfertadosViewState createState() => _AlbumsOfertadosViewState();
}

class _AlbumsOfertadosViewState extends State<AlbumsOfertadosView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Albums Ofertados'),
          actions: const <Widget>[],
        ),
        drawer: const MenuCliente(),
        body: FutureBuilder<List<Albumofertado>>(
          future: AlbumOfertadosService().getalbumsofertados(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Albumofertado>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Albumofertado item = snapshot.data![index];
                  return Column(children: [
                    ListTile(
                        leading:
                            const Icon(Icons.format_list_numbered_rtl_outlined),
                        title: Text('Album #:   ' + item.id.toString())),
                    ListTile(
                        leading: const Icon(Icons.verified_user_rounded),
                        title: Text(
                          'Nombre del Fotografo:   ' + item.nombreCompleto,
                        )),
                    ListTile(
                      leading: const Icon(Icons.money_off_csred_sharp),
                      title: Text('Costo Fotografo:   ' +
                          item.tarifaContratacion +
                          'bs'),
                    ),
                    ListTile(
                        leading: const Icon(Icons.photo_album_outlined),
                        title: Text('Cantidad de Fotos del Album:   ' +
                            item.cantidadFotos +
                            'fotos'),
                        subtitle: const Text('Click para ver fotos'),
                        onTap: () {}),
                    ListTile(
                      leading: const Icon(Icons.monetization_on_rounded),
                      title: Text('Precio del Album:   ' + item.precio + 'bs'),
                      subtitle: const Text('Click para comprar album'),
                      tileColor: (Colors.greenAccent),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/payment_stack');
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.event_available_rounded),
                        title: Text('Nombre del evento:   ' + item.nombre),
                        onTap: () {}),
                    ListTile(
                        leading: const Icon(Icons.description_rounded),
                        title:
                            Text('Descripcion Evento:   ' + item.descripcion),
                        onTap: () {}),
                    ListTile(
                        leading: const Icon(Icons.place_sharp),
                        title:
                            Text('Direccion del Evento:   ' + item.direccion),
                        onTap: () {}),
                    const ListTile(
                        title: Text(
                            '-------------------------------------------------------------------')),
                  ]);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
