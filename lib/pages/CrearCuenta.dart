import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/pages/User.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  Widget renderNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Ingrese su nombre'),
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return 'Ingrese su nombre';
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderLastNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Ingrese sus Apellidos'),
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return 'Ingrese sus Apellidos';
          }
          return null;
        },
        onSaved: (String value) {},
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

  Widget renderPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Ingrese su Contraseña', labelText: 'Contraseña'),
        obscureText: true,
        /* <-- Aquí */
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return 'Ingrese correctamente su password';
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderRetypePasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Contraseña', labelText: 'Repita su Contraseña'),
        obscureText: true,
        /* <-- Aquí */
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return 'Ingrese correctamente su password';
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderLoginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text("Entrar"),
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

  Widget renderDivisor() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('O'),
          ),
          Expanded(child: Divider(height: 1)),
        ],
      ),
    );
  }

  Widget renderFacebookButton() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        color: Color.fromRGBO(59, 89, 152, 1),
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.facebookSquare),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('Crear con Facebook'),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget renderGoogleButton() {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: RaisedButton(
        color: Colors.red,
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('Crear con Google'),
            ),
          ],
        ),
        onPressed: () {},
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
        title: Text('Crear Cuenta'),
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
              renderNameInput(),
              renderLastNameInput(),
              renderEmailInput(),
              renderPasswordInput(),
              renderRetypePasswordInput(),
              renderLoginButton(context),
              renderDivisor(),
              renderFacebookButton(),
              renderGoogleButton(),
              Container(
                width: 10,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
