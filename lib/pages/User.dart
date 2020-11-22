import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/pages/AddPage.dart';
import 'package:proyecto_final_ihc/pages/ModificarReporte.dart';
import 'package:proyecto_final_ihc/screens/menu_options_screen.dart';
import 'Application.dart';
import 'Bell.dart';
import '../screens/home_screen.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  Widget home() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Application(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(
              FontAwesomeIcons.home,
            ),
          ),
        ),
      ),
    );
  }

  Widget friends() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(FontAwesomeIcons.userFriends),
          ),
        ),
      ),
    );
  }

  Widget bell() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Bell(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(FontAwesomeIcons.bell),
          ),
        ),
      ),
    );
  }

  Widget user() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => User(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(FontAwesomeIcons.user),
          ),
        ),
      ),
    );
  }

  Widget renderDivisor() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1)),
        ],
      ),
    );
  }

  Widget renderModificarReport(String tipeReport, String textReport) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              tipeReport,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RaisedButton(
            textColor: Colors.white,
            child: Text(textReport),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Modificar Reporte'),
                  content: Text('Esta seguro que desea Modifcar el reporte'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('ok'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ModificarReporte(),
                        ));
                      },
                    ),
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop('Cancel');
                        /* Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Application(),
                        ));*/
                      },
                    ),
                  ],
                ),
              ).then((result) {
                print(result);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget renderEliminarReport(String tipeReport, String textReport) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              tipeReport,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RaisedButton(
            textColor: Colors.white,
            child: Text(textReport),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Eliminar Reporte'),
                  content: Text('Esta seguro que desea eliminar el reporte'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('ok'),
                      onPressed: () {
                        Navigator.of(context).pop('Ok');
                      },
                    ),
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop('Cancel');
                        /* Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Application(),
                        ));*/
                      },
                    ),
                  ],
                ),
              ).then((result) {
                print(result);
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MenuOptionsScreen(
                      //titleController.text,
                      //dateController.text,
                      ),
                ));
              }),
        ],
        title: Text('Usuario'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(
              backgroundAssets: "assets/images/fondoPerfil2.jpg",
              userAsset: "assets/images/user.jpg",
              username: 'Yonatan.Ylacaña',
            ),
            Connections(
              publication: 102,
              followers: 10313,
              points: 10001,
            ),
            renderDivisor(),
            renderEliminarReport("Eliminar Reporte", "Eliminar"),
            renderModificarReport("Modificar Reporte", "Modificar"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //elevation: 0,
        //highlightElevation: 0,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPage(),
          ));
        },
        backgroundColor: Colors.blue,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        //color: Colors.yellow,
        child: Container(
          height: 60,
          child: Row(
            children: [
              home(),
              friends(),
              Expanded(
                child: Container(),
              ),
              bell(),
              user(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Connections extends StatelessWidget {
  final int publication, followers, points;
  const Connections({
    @required this.publication,
    @required this.followers,
    @required this.points,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Connection(
            text: "Publicaciones",
            number: this.publication,
          ),
          Connection(
            text: "Seguidores",
            number: this.followers,
          ),
          Connection(
            text: "Puntos",
            number: this.points,
          ),
        ],
      ),
    );
  }
}

class Connection extends StatelessWidget {
  final String text;
  final int number;
  const Connection({
    Key key,
    @required this.text,
    @required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Color.fromARGB(120, 0, 0, 0));
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(
          color: Colors.black, //                   <--- border color
          width: 1,
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            this.text.toUpperCase(),
            style: style.copyWith(fontSize: 11),
          ),
          Text(
            '${this.number}',
            style: style.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final double heigth;
  final String backgroundAssets;
  final String userAsset;
  final String username;

  const Header({
    Key key,
    this.heigth = 200,
    @required this.backgroundAssets,
    @required this.userAsset,
    @required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.heigth,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(20, 20)),
        image: DecorationImage(
          image: AssetImage(this.backgroundAssets),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          UserPhoto(
            assetImage: this.userAsset,
          ),
          Text(
            '@${this.username}',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Level 3 - Ciudadano',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  final String assetImage;
  final double size;
  const UserPhoto({
    Key key,
    @required this.assetImage,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.size,
      width: this.size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.assetImage),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}
