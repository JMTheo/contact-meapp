import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//Materialpalette.com
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  _launchCaller() async {
    const url = "tel:+5511951276174";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nào foi possivel abrir o discador $url';
    }
  }

  _launchEmail() async {
    const url = "mailto:jtheo6@hotmail.com?subject=Contato&body=Teste email";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nào foi possivel enviar o email para $url';
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
                    _launchCaller();
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
                    _launchEmail();
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
            ],
          ),
        ),
      ),
    );
  }
}
