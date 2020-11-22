import 'package:flutter/material.dart';
import 'package:proyecto_final_ihc/pages/User.dart';

class RecuperarCuenta extends StatefulWidget {
  @override
  _RecuperarCuentaState createState() => _RecuperarCuentaState();
}

class _RecuperarCuentaState extends State<RecuperarCuenta> {
  Widget renderMostarTexto() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'Ingrese su correo ',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget renderEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Ingrese su Correo Electronico', labelText: 'Correo'),
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return 'Ingrese correctamente su correo';
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderEnvioButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text("Enviar"),
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => User(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Cuenta'),
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
              renderMostarTexto(),
              renderEmailInput(),
              renderEnvioButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
