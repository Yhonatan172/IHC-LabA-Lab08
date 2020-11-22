import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Application.dart';
import '../screens/home_screen.dart';
import 'User.dart';

class Bell extends StatefulWidget {
  @override
  _BellState createState() => _BellState();
}

class _BellState extends State<Bell> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Notificaciones',
      )),
      body: Container(
        color: Colors.cyan,
        height: 100,
        width: 200,
      ),
      floatingActionButton: FloatingActionButton(
        //elevation: 0,
        //highlightElevation: 0,
        onPressed: () {},
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
