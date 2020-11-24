import 'package:flutter/material.dart';
import 'pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loggedIn = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(height: 40),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Color(0xFFFEF9EB),
        textTheme: TextTheme(
          button: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      /*routes: {
        '/': (BuildContext contex) {
          if (_loggedIn) {
            return Application();
          } else {
            return LoginPage();
          }
        },
        '/add': (BuildContext contex) => AddPage(),
      },*/
      home: LoginPage(),
    );
  }
}
