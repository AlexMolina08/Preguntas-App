import 'package:preguntas/models/question_model.dart';

class QuizService {
  int _currentQuestion;

  final List<Question> _questionsBank= [
    Question(
        text: 'Aproximadamente una cuarta parte de los huesos humanos se encuentran en los pies',
        correctAnswer: true),
    Question(
        text: 'Microsoft fué fundada durante la segunda guerra mundial',
        correctAnswer: false),
    Question(
        text:'Mark zukemberg robó la idea de facebook a unos compañeros de su facultad',
        correctAnswer: true),
    Question(
    text:'El memorial dedicado a John Lennon, "Strawberry Fields memorial", está en Liverpool',
    correctAnswer: false),
    Question(
    text:'El ser humano pierde aproximadamente el 75% de '
        'calor corporal por la cabeza. Es por ello que en época de bajas temperaturas '
        'las personas tienen la tendencia a cubrirse bien la cabeza con algún tipo de prenda.',
    correctAnswer: false),
    Question(
    text:'Si lloras en el espacio tus lágrimas se pegarían en la cara',
    correctAnswer: true),
    Question(
    text:'¿Hay arsénico en el café?',
    correctAnswer: true),
    Question(
    text:'Todos los insectos tienen seis patas.',
    correctAnswer: true),
    Question(
    text:'Los humanos adultos tienen menos huesos que los bebés',
    correctAnswer: false),
    Question(
    text:'Tomar leche caliente induce el sueño',
    correctAnswer: true),
    Question(
    text:'Una tostada con mantequilla lanzada al aire cae por el lado de la mantequilla '
        'tres de cada cuatro veces.',
    correctAnswer: false),
    Question(
    text:'Los humanos pueden distinguir sobre un trillón de olores diferentes',
    correctAnswer: true),
    Question(
    text:'Tenemos un promedio de entre 400.000 y 500.000 pelos en la cabeza.',
    correctAnswer: false),
    Question(
    text:'Dejar un hueso de aguacate en un plato de guacamole impide '
        'que este se vuelva de ese color oscuro tan desagradable a la vista.',
    correctAnswer: false),
    Question(
    text:'La mayoría de los seres humanos utilizamos solamente el 10% de nuestro cerebro',
    correctAnswer: false),
    Question(
    text:'En los hogares españoles hay más pájaros que gatos.',
    correctAnswer: true),
    Question(
    text:'Hay más calorias en un solo maní que en 500gr de carne magra',
    correctAnswer: false),
    Question(
    text:'La misma película, sin cortes, ¿dura menos en televisión que en el cine?',
    correctAnswer: true),
    Question(
    text:'El peso total de todas las termitas en la tierra es mucho más pesado que el '
        'peso total de humanos en la tierra.',
    correctAnswer: true),
    Question(
    text:'Los remolinos que se crean en el fregadero van en'
        ' direcciones opuestas dependiendo del hemisferio que se encuentren',
    correctAnswer: false),
    Question(
    text:'Mark Zuckerberg es daltónico. El fondo de Facebook es azul porque es el color que puede distinguir mejor.',
    correctAnswer: true),
    Question(
    text:'Buzz Aldrin fue el primer hombre en orinar en la Luna',
    correctAnswer: true),
    Question(
    text:'Hay más movimientos en Ajedrez que átomos en el universo conocido.',
    correctAnswer: true),
    Question(
    text:'Durante su vida, un hombre con una alimentación normal puede '
        'ingerir una cantidad de alimentos equivalente al peso de cien elefantes adultos.',
    correctAnswer: false),
    Question(
    text:'La punta de la torre Eiffel se inclina alejándose del sol',
    correctAnswer: true),
    Question(
    text:'La universidad de Oxford fue fundada antes que apareciera la civilización Azteca',
    correctAnswer: true),
    Question(
    text:'Las galletas Oreo son más antiguas que las galletas de chips de chocolate',
    correctAnswer: true),
    Question(
    text:'Hay más pisos del Empire State en su subterráneo que los que hay arriba',
    correctAnswer: false),
    Question(
    text:'Abraham Lincoln y Albert Einstein estuvieron vivos al mismo tiempo. '
        'Compartieron el espacio de tiempo por 14 años',
    correctAnswer: false),
    Question(
    text:'Napoleon Bonaparte era extremadamente bajo',
    correctAnswer: false),
  ];

  QuizService(){
    _currentQuestion = 0;
  }

  /*
    Incrementa currentQuestion si no se ha llegado al final
  */
  void nextQuestion(){
    if (_currentQuestion < _questionsBank.length - 1)
      _currentQuestion++;
  }

  /*
  * Devuelve el tamaño del vector questionBank
  * */
  int numberOfQuestions(){
    return _questionsBank.length;
  }

  /*
  * Devuelve la pregunta actual
  * */

  int getCurrentQuestion(){
    return _currentQuestion;
  }

  /*
  * Devuelve el texto de una pregunta del questionBank
  * Si se da un indice erróneo , devuelve el primer elemento
  * */

  String getText(){
    return _questionsBank[_currentQuestion].text;
  }

  /*
  * Devuelve la respuesta correcta de una pregunta del questionBank
  * Si se da un indice erróneo , devuelve el primer elemento
  * */
  bool getCorrectAnswer(){
    return _questionsBank[_currentQuestion].correctAnswer;
  }

}