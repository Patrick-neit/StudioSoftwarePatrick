import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer.dart';
import 'package:software_proyect/models/fotografos_list_register.dart';
import 'package:software_proyect/services/fotografos_list_services.dart';

class FotografosListView extends StatefulWidget {
  const FotografosListView({Key? key}) : super(key: key);

  @override
  _FotografosListViewState createState() => _FotografosListViewState();
}

class _FotografosListViewState extends State<FotografosListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fotografos Disponibles'),
          actions: const <Widget>[],
        ),
        drawer: const MenuLateral(),
        body: FutureBuilder<List<Fotografo>>(
          future: FotografosListServices().getfotografos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Fotografo>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Fotografo item = snapshot.data![index];
                  return Column(children: [
                    ListTile(
                        leading: const Icon(Icons.confirmation_number_outlined),
                        title: Text('Identificador Fotografo:   ' +
                            item.id.toString())),
                    ListTile(
                        leading: const Icon(Icons.near_me),
                        title: Text(
                          'Nombre:   ' + item.nombreCompleto,
                        )),
                    ListTile(
                      leading: const Icon(Icons.format_list_numbered_rounded),
                      title: Text('Carnet de Identidad:   ' + item.ci),
                    ),
                    ListTile(
                        leading: const Icon(Icons.mail_sharp),
                        title: Text('Correo:   ' + item.correo)),
                    ListTile(
                        leading: const Icon(Icons.directions_bike_rounded),
                        title: Text('Direccion:   ' + item.direccion)),
                    ListTile(
                      leading: const Icon(Icons.monetization_on_outlined),
                      title: Text(
                          'Contrato:   ' + item.tarifaContratacion + ' Bs'),
                      subtitle: const Text('Click para contratar'),
                      tileColor: (Colors.greenAccent),
                      onTap: () {
                        Navigator.pushNamed(context, '/payment_stack');
                      },
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
