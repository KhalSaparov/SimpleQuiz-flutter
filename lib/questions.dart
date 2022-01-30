import 'answers.dart';

class Questions {
  String _questionText;
  List<Answers> _answers;

  Questions(this._questionText, this._answers);

  String getQuestionText() {
    return _questionText;
  }

  List<Answers> getAnswers() {
    return _answers;
  }
}
