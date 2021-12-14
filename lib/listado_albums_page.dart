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
                        leading: const Icon(Icons.date_range_sharp),
                        title: Text('Album #:   ' + item.id.toString())),
                    ListTile(
                        leading: const Icon(Icons.anchor_rounded),
                        title: Text(
                          'Nombre del Fotografo:   ' + item.nombreCompleto,
                        )),
                    ListTile(
                      leading: const Icon(Icons.near_me_rounded),
                      title: Text('Precio de contratacion:   ' +
                          item.tarifaContratacion),
                    ),
                    ListTile(
                        leading:
                            const Icon(Icons.format_list_numbered_rtl_rounded),
                        title: Text('Cantidad de Fotos del Album:   ' +
                            item.cantidadFotos),
                        subtitle: const Text('Click para ver fotos'),
                        onTap: () {}),
                    ListTile(
                        leading: const Icon(Icons.charging_station_rounded),
                        title: Text('Precio del Album:   ' + item.precio)),
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
