import 'package:flutter/material.dart';
import 'package:preguntas/animatedIcon/simple_animated_icon.dart';
import 'package:preguntas/services/quiz_service.dart';

final QuizService quizService =
    QuizService(); //Instancia de Quiz Service (está la lógica del juego y preguntas)

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
  List<Widget> scoreKeeper = []; //Lista de Iconos

  void checkAnswer(bool userAnswer) {
    //dependiendo de si acierta o no añadimos un icono u otro
    setState(() => (userAnswer == quizService.getCorrectAnswer())
        ? scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          )
        : scoreKeeper.add(
            Icon(Icons.close, color: Colors.red),
          ));
  }

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
              quizService.getText(),
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
              checkAnswer(true);
              setState(() {
                quizService.nextQuestion();
              });
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
              checkAnswer(false);
              setState(() {
                quizService.nextQuestion();
              });
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
          child: Row(children: scoreKeeper),
        )
      ],
    );
  }
}

/*
* Q1 .- Aproximadamente una cuarta parte de los huesos humanos se encuentran en los pies , true
* Q2 .- Microsoft fué fundada durante la segunda guerra mundial , false
* Q3 .- Mark zukemberg robó la idea de facebook a unos compañeros de su facultad , true
* */
