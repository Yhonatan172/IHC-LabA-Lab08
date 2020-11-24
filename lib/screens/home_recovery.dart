import 'package:flutter/material.dart';
import 'package:proyecto_final_ihc/pages/User.dart';

class HomeRecovery extends StatefulWidget {
  @override
  _HomeRecoveryState createState() => _HomeRecoveryState();
}

class _HomeRecoveryState extends State<HomeRecovery> {
  Widget renderPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Ingrese su nueva Contraseña', labelText: 'Contraseña'),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Ingrese correctamente una contraseña';
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderPasswordRetryInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Ingrese nuevamente su Contraseña',
            labelText: 'Contraseña'),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Ingrese correctamente una contraseña';
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderActualizarButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text("Actualizar"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Actualizacion'),
              content: Text('Se Actualizo correctamente su contraseña'),
              actions: <Widget>[
                FlatButton(
                  child: Text('ok'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => User(),
                    ));
                  },
                ),
              ],
            ),
          ).then((result) {
            print(result);
          });
        },
      ),
    );
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Contraseña'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Image.asset(
                  "assets/images/logo_2.2.png",
                  width: 450,
                  height: 150,
                ),
              ),
              renderPasswordInput(),
              renderPasswordRetryInput(),
              renderActualizarButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
