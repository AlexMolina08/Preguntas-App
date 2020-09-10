import 'package:flutter/material.dart';
import 'package:preguntas/animatedIcon/simple_animated_icon.dart';
import 'package:preguntas/models/question_model.dart';

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
  List<Widget> scoreKeeper = [];
  //usamos una lista de tuplas , para almacenar la pregunta y su respuesta correcta
  List<Question> questions = [
    Question(
        text: 'Aproximadamente una cuarta parte de los huesos humanos se encuentran en los pies',
        answer: true),
    Question(
        text: 'Microsoft fué fundada durante la segunda guerra mundial',
        answer: true),
    Question(
        text: 'Mark zukemberg robó la idea de facebook a unos compañeros de su facultad',
        answer: true),
  ];
  int currentQuestion = 0;

  void nextQuestion() {
    if (currentQuestion < questions.length - 1)
      currentQuestion += 1;
    else
      currentQuestion = 0;
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
              questions[currentQuestion],
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
              setState(() {
                nextQuestion();
                print(currentQuestion);
                print(questions.length);
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
              setState(() {
                nextQuestion();
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
