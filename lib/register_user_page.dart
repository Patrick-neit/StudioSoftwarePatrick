import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_proyect/models/personas_register.dart';
import 'package:software_proyect/services/personas_services.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerSecondName = TextEditingController();
  TextEditingController controllerCi = TextEditingController();
  TextEditingController controllerCiExp = TextEditingController();
  TextEditingController controllerCellphone = TextEditingController();
  TextEditingController controllerAdress = TextEditingController();
  TextEditingController controllerGener = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTipo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Please Fill The Form'),
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              //Scrolleo la vista usando Expanded
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text('Ingrese sus datos!'),
                  _apptextfield(),
                  const SizedBox(
                    height: 1.0,
                  ),
                  _nametextfield(),
                  const SizedBox(
                    height: 1.0,
                  ),
                  _firstnametextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _secondnametextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _citextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _ciexptextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _cellphonetextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _adresstextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _genertextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _emailtextfield(),
                  const SizedBox(
                    height: 2.0,
                  ),
                  _bottomSubmit(),
                  const SizedBox(
                    height: 2.0,
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _nametextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerName,
            decoration: InputDecoration(
              labelText: 'Name',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _firstnametextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerFirstName,
            decoration: InputDecoration(
              labelText: 'Apellido Paterno',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _secondnametextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerSecondName,
            decoration: InputDecoration(
              labelText: 'Apellido Materno',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _citextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerCi,
            decoration: InputDecoration(
              labelText: 'Carnet Identidad',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _ciexptextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerCiExp,
            decoration: InputDecoration(
              labelText: 'Expedido',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _cellphonetextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerCellphone,
            decoration: InputDecoration(
              labelText: 'Celular',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _adresstextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerAdress,
            decoration: InputDecoration(
              labelText: 'Direccion',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _genertextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerGener,
            decoration: InputDecoration(
              labelText: 'Genero',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _emailtextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerEmail,
            decoration: InputDecoration(
              labelText: 'Correo Electronico',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
    });
  }

  Widget _apptextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
          padding: const EdgeInsets.all(20),
          height: 70.0,
          child: TextFormField(
            controller: controllerTipo,
            decoration: InputDecoration(
              labelText: 'Tipo',
              icon: const Icon(Icons.add_box_sharp),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.grey[300],
              filled: true,
              //hintText: "Ingresa fecha final vacacional"
            ),
          ));
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
            child: const Text('Submit'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.greenAccent,
          onPressed: () async {
            // ignore: unnecessary_new, unused_local_variable
            RegisterUser registerUser = new RegisterUser(
                nombre: controllerName.text,
                primerApellido: controllerFirstName.text,
                segundoApellido: controllerSecondName.text,
                ci: controllerCi.text,
                ciExp: controllerCiExp.text,
                celular: controllerCellphone.text,
                direccion: controllerAdress.text,
                genero: controllerGener.text,
                correo: controllerEmail.text,
                tipo: controllerTipo.text);
            // ignore: unnecessary_new, unused_local_variable
            bool estado = await new PersonasRegisterService()
                .personasregister(registerUser);
            if (estado) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => AlertDialog(
                  title: const Text('Registrado con exito'),
                  content: const Text('Login here'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/login_page');
                        },
                        child: const Text('login')),
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
                    title: Text('Re check your information|| Empty values'),
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
