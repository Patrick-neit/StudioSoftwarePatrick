import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer.dart';
import 'package:software_proyect/models/events_list_register.dart';
import 'package:software_proyect/services/events_list_services.dart';

class ListViewEvents extends StatefulWidget {
  const ListViewEvents({Key? key}) : super(key: key);

  @override
  _ListViewEventsState createState() => _ListViewEventsState();
}

class _ListViewEventsState extends State<ListViewEvents> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mis eventos'),
          actions: const <Widget>[],
        ),
        drawer: const MenuLateral(),
        body: FutureBuilder<List<Evento>>(
          future: EventosServices().geteventos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Evento item = snapshot.data![index];
                  return Column(children: [
                    ListTile(
                        leading: const Icon(Icons.date_range_sharp),
                        title: Text(
                            'Identificador Evento:   ' + item.id.toString())),
                    ListTile(
                        leading: const Icon(Icons.anchor_rounded),
                        title: Text(
                          'Nombre del Evento:   ' + item.nombre,
                        )),
                    ListTile(
                      leading: const Icon(Icons.near_me_rounded),
                      title:
                          Text('Descripcion del evento:   ' + item.descripcion),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.format_list_numbered_rtl_rounded),
                      title: Text('Direccion:   ' + item.direccion),
                      subtitle: const Text('Click para ver ubicacion'),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/event_location');
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.charging_station_rounded),
                        title: Text('Fecha:   ' + item.fecha.toString())),
                    ListTile(
                      leading: const Icon(Icons.money_rounded),
                      title: Text('Precio de la entrada:   ' +
                          item.precioEntrada +
                          ' Bs'),
                      subtitle: const Text('Click to buy a ticket'),
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
