import 'package:flutter/material.dart';
import 'package:quizz_flutter/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question_generate.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Questions> quest = question_generate.generate();
  int questNumber = 0;
  int correctAnswer = 0;
  int unCorrectAnswer = 0;

  TextButton button(int i) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
      onPressed: () {
        setState(() {
          if (quest[questNumber].getAnswers()[i].isRight() == true) {
            correctAnswer++;
            Fluttertoast.showToast(
                msg: "Correct",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.green);
          } else {
            unCorrectAnswer++;
            Fluttertoast.showToast(
                msg: "Not correct",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red);
          }
          if (questNumber < quest.length - 1) {
            questNumber++;
          } else {
            Alert(
                    context: context,
                    title: "Score",
                    desc:
                        "Correct answers:$correctAnswer\nUncorrect answers:$unCorrectAnswer")
                .show();
            questNumber = 0;
            correctAnswer = 0;
            unCorrectAnswer = 0;
          }
        });
      },
      child: Text(
        quest[questNumber].getAnswers()[i].getAnswer(),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quest[questNumber].getQuestionText(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 2.5, 2.5),
                        child: button(0),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 2.5),
                        child: button(1),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2.5, 2.5, 0),
                        child: button(2),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2.5, 2.5, 0, 0),
                        child: button(3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
