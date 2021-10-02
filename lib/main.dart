import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Encantometro",
      home: Home() ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _people = 0; // _Para garantir que não vai ser acessada de fora
  String _infoText = "Pode entrar";
  void _changePeople(int delta){
    setState(() {
      _people += delta;

      if (_people<0){
        _infoText = "Loja vazia";
      } else if (_people<=10){
        _infoText = "Pode entrar";
      } else {
        _infoText = "Loja cheia";
      }
    });

  }

  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            "images/loja.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 42.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _changePeople(1);
                        debugPrint("+1");
                        },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 42.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _changePeople(-1);
                        debugPrint("-1");
                      },
                    ),
                  ),
                ],
              ),
              Text("$_infoText",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0))
            ],
          )
        ]
    );
  }
}





