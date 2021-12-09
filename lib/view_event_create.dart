import 'package:flutter/material.dart';
import 'package:software_proyect/Drawer/widget_drawer.dart';
import 'package:software_proyect/global_var.dart';
import 'package:software_proyect/models/event_register.dart';
import 'package:software_proyect/services/events_services.dart';

class EventCreatePage extends StatefulWidget {
  const EventCreatePage({Key? key}) : super(key: key);

  @override
  _EventCreatePageState createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  //String organizadorid = idusuario.toString();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerDescripcion = TextEditingController();
  TextEditingController controllerDireccion = TextEditingController();
  TextEditingController controllerFecha = TextEditingController();
  TextEditingController controllerPrecio = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lets Create an Event!'),
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
                      const Text('Ingrese los datos del evento!'),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.asset(
                        'assets/images/loginpho.png',
                        height: 100.0,
                      ),
                      _nombretextfield(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      _descripciontextfield(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      _direcciontextfield(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _fechatextfield(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _preciotextfield(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _bottomSubmit(),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ]))),
          ],
        ),
        drawer: const MenuLateral(),
      ),
    );
  }

  Widget _nombretextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerNombre,
          decoration: const InputDecoration(
            icon: Icon(Icons.near_me_disabled_sharp),
            labelText: 'Nombre Evento',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _descripciontextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerDescripcion,
          decoration: const InputDecoration(
            icon: Icon(Icons.description_rounded),
            // hintText: 'ejemplo@gmail.com',
            labelText: 'Descripcion del evento',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _direcciontextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerDireccion,
          //obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.directions_bike_sharp),
            //hintText: '***',
            labelText: 'Direccion:',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _fechatextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerFecha,
          decoration: const InputDecoration(
            icon: Icon(Icons.date_range_rounded),
            // hintText: 'ejemplo@gmail.com',
            labelText: 'Fecha',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _preciotextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerPrecio,
          decoration: const InputDecoration(
            icon: Icon(Icons.monetization_on_rounded),
            // hintText: 'ejemplo@gmail.com',
            labelText: 'Precio Entrada',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottomSubmit() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Crear evento'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.greenAccent,
          onPressed: () async {
            EventRegister eventRegister = EventRegister(
                nombre: controllerNombre.text,
                descripcion: controllerDescripcion.text,
                direccion: controllerDireccion.text,
                fecha: controllerFecha.text,
                precioEntrada: controllerPrecio.text,
                organizadorId: idusuario.toString());
            bool eventSucces =
                await EventRegisterService().eventsregister(eventRegister);
            if (eventSucces) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => AlertDialog(
                  title: const Text('Evento Registrado'),
                  //content: const Text('Volver'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/organizador_page');
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
          });
    });
  }
}
