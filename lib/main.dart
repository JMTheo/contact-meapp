import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//Materialpalette.com
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _launch(action) async {
    String url;
    switch (action) {
      case 'phone':
        url = "tel:+5511951276174";
        break;
      case 'email':
        url = "mailto:jtheo6@hotmail.com?subject=Contato&body=Teste email";
        break;
      case 'git':
        url = 'https://github.com/JMTheo';
        break;
      default:
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nào foi possivel concluir a ação $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/img/profile.png"),
              ),
              Text(
                "João Matheus",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Fullstack Developer".toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.deepPurple.shade100,
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.deepPurple.shade300,
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: FlatButton(
                  onPressed: () {
                    _launch('phone');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.deepPurple[700],
                    ),
                    title: Text(
                      "+55 (11) 95127 - 6174",
                      style: TextStyle(
                        color: Colors.deepPurple.shade900,
                        fontSize: 20,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: FlatButton(
                  onPressed: () {
                    _launch('email');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.deepPurple[700],
                    ),
                    title: Text(
                      "jtheo6@hotmail.com",
                      style: TextStyle(
                        color: Colors.deepPurple.shade900,
                        fontSize: 20,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: FlatButton(
                  onPressed: () {
                    _launch('git');
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.computer,
                      size: 20,
                      color: Colors.deepPurple[700],
                    ),
                    title: Text(
                      "Github Page",
                      style: TextStyle(
                          color: Colors.deepPurple.shade900,
                          fontSize: 20,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
