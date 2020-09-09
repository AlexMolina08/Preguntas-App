import 'package:flutter/material.dart';
import 'package:preguntas/animatedIcon/simple_animated_icon.dart';

void main() => runApp(Preguntas());

class Preguntas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Preguntas',
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: QuizPage(),
            ),
          ),
        ));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topRight,
            child: AnimatedLogo(),
          ),
        ),
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              "PREGUNTA",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              print("hola");
            },
            child: Text(
              'Verdadero',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              print("hola");
            },
            child: Text(
              'Falso',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              Icon(
                Icons.cancel,
                color: Colors.red,
              )
            ],
          ),
        )
      ],
    );
  }
}
