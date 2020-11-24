import 'package:flutter/material.dart';
import 'package:proyecto_final_ihc/screens/home_recovery.dart';

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
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Recuperar Contraseña'),
              content:
                  Text('Se le envio un codigo de recuperacion a su correo'),
              actions: <Widget>[
                FlatButton(
                  child: Text('ok'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CodigoVerificacion(),
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

class CodigoVerificacion extends StatefulWidget {
  @override
  _CodigoVerificacionState createState() => _CodigoVerificacionState();
}

class _CodigoVerificacionState extends State<CodigoVerificacion> {
  Widget renderVerificaciondInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Ingrese su Codigo de Verificacion', labelText: 'Codigo'),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Ingrese correctamente el codigo';
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
        child: Text("Continuar"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Codigo Introducido'),
              content: Text(
                  'El codigo es correcto se procede a cambiar la contraseña'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop('Cancel');
                  },
                ),
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeRecovery(),
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
        title: Text('Ingrese el Codigo'),
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
              renderVerificaciondInput(),
              renderActualizarButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
