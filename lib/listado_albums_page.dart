import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer.dart';
import 'package:software_proyect/models/album_list_register.dart';

import 'package:software_proyect/services/album_list_service.dart';

class AlbumsListView extends StatefulWidget {
  const AlbumsListView({Key? key}) : super(key: key);

  @override
  _AlbumsListViewState createState() => _AlbumsListViewState();
}

class _AlbumsListViewState extends State<AlbumsListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mis Albums'),
          actions: const <Widget>[],
        ),
        drawer: const MenuLateral(),
        body: FutureBuilder<List<Album>>(
          future: AlbumListService().getlistalbumes(),
          builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Album item = snapshot.data![index];
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
                      title: Text('Precio de contratacion:   ' +
                          item.tarifaContratacion),
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
                      tileColor: (Colors.greenAccent),
                      onTap: () {},
                    ),
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
