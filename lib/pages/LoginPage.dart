import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/pages/RecuperarCuenta.dart';
import 'Application.dart';
import 'CrearCuenta.dart';

class LoginPage extends StatelessWidget {
  String passwordApli = "1234";
  String logAplic = "Frank";
  Widget renderEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Usuario o Correo Electronico'),
        validator: (String value) {
          if (value.isEmpty || !(logAplic == value)) {
            //si no se tiene nada se retorna eel erroe
            return 'Ingrese correctamente su login';
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
        decoration:
            InputDecoration(hintText: 'Contraseña', labelText: 'Contraseña'),
        obscureText: true,
        /* <-- Aquí */
        validator: (String value) {
          if (value.isEmpty || !(passwordApli == value)) {
            //si no se tiene nada se retorna eel erroe
            return 'Ingrese correctamente su password';
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderRecupPassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      /*child: RichText(
          TextSpan(
            text: 'O crea aqui una cuenta aqui!',
            style: TextStyle(),
          ),
        )*/
      child: InkWell(
          child: Text(
            'Olvido su Usuario o Contraseña?',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecuperarCuenta(),
            ));
          }),
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
            builder: (context) => Application(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
      ),
    );
  }

  Widget renderCreateAccountLink(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      /*child: RichText(
          TextSpan(
            text: 'O crea aqui una cuenta aqui!',
            style: TextStyle(),
          ),
        )*/
      child: InkWell(
          child: Text(
            'O crea aqui una cuenta aqui!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CrearCuenta(),
            ));
          }),
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
              child: Text('Entrar con Facebook'),
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
              child: Text('Entrar con Google'),
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
              renderEmailInput(),
              renderPasswordInput(),
              renderRecupPassword(context),
              renderLoginButton(context),
              renderCreateAccountLink(context),
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
