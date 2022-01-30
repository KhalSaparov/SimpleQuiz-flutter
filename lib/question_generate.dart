import 'package:quizz_flutter/answers.dart';
import 'package:quizz_flutter/questions.dart';

class question_generate {
  static List<Questions> generate() {
    List<Answers> answer1 = [
      Answers('Ashgabat', true),
      Answers('Baku', false),
      Answers('Tashkent', false),
      Answers('Abu Dhabi', false)
    ];

    List<Answers> answer2 = [
      Answers('Dubai', false),
      Answers('Washington D.C.', false),
      Answers('London', true),
      Answers('Paris', false)
    ];

    List<Answers> answer3 = [
      Answers('Gomel', false),
      Answers('Brest D.C.', false),
      Answers('Grodno', false),
      Answers('Minsk', true)
    ];

    List<Answers> answer4 = [
      Answers('Tashkent', true),
      Answers('Nursultan', false),
      Answers('Bishkek', false),
      Answers('Mary', false)
    ];

    List<Answers> answer5 = [
      Answers('Pilsen', false),
      Answers('Prague', true),
      Answers('Amsterdam', false),
      Answers('Wales', false)
    ];

    List<Questions> questions = [
      Questions('The capital of Turkmenistan?', answer1),
      Questions('The capital of Great Britain?', answer2),
      Questions('The capital of Belarus?', answer3),
      Questions('The capital of Uzbekistan?', answer4),
      Questions('The capital of Czech Republic?', answer5),
    ];
    return questions;
  }
}
