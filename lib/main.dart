import 'package:flutter/material.dart';
import 'package:preguntas/animatedIcon/simple_animated_icon.dart';
import 'package:preguntas/services/quiz_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


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
        )
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = []; //Lista de Iconos
  int hits = 0; //numero de aciertos durante la partida

  /*
  * Si userAnswer es correcta , añade Icons.check al scoreKeeper , si no , añade Icons.close
  * Si se ha llegado al final de la lista de preguntas , devuelve un Alert para volver a Empezar
  * */

  void checkAnswer(bool userAnswer) {

      setState(() {
        //dependiendo de si acierta o no añadimos un icono u otro
        if (userAnswer == quizService.getCorrectAnswer()) {
          hits++;
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,),
          );
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red),);
        }
      });

      //Comprobamos si esta es la ultima pregunta
      if (quizService.endOfQuestionBank()) {
        Alert(
          style: AlertStyle(
            backgroundColor: Colors.pink
          ),
          onWillPopActive: true, //de esta forma evitamos que el alert desaparezca al hacer tap en otro lugar
          closeFunction: (){
            resetPage();
            Navigator.pop(context);
          },
          context: context,
          type: AlertType.info,
          title: "END",
          desc: "Has acertado $hits de ${quizService.numberOfQuestions()}",
          buttons: [
            DialogButton(
              child: Container(
                child: Text(
                  "Volver a empezar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              //Al pulsar el boton , debe restaurarse todo
              onPressed: () {
                resetPage();
                Navigator.pop(context);
              },
            )
          ],
        ).show();
      }
      setState(() => quizService.nextQuestion());

  }


  void resetPage(){
    setState(() {
      hits = 0;
      quizService.resetQuestionBank(); //nos ponemos al principio del questionBank
      scoreKeeper.clear();
    });
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
        //--- TRUE BOTTON ----
        Expanded(
          flex: 1,
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              checkAnswer(true);
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
        //--- FALSE BOTTON ----
        Expanded(
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              checkAnswer(false);
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
          child:  Row(children: scoreKeeper),
        )
      ],
    );
  }
}