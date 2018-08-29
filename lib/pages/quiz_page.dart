import 'package:flutter/material.dart';
import 'package:image_quiz_flutter/utils/questions.dart';
import 'package:image_quiz_flutter/utils/quiz.dart';
import 'package:image_quiz_flutter/ui/answer_button.dart';
import 'package:image_quiz_flutter/ui/question_text.dart';
import 'package:image_quiz_flutter/ui/correct_wrong_overlay.dart';
import 'package:image_quiz_flutter/pages/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Is this obama?", true, "assets/images/p1.jpg"),
    Question("Is this pazzta?", false, "assets/images/p2.jpg"),
    Question("Is this bacon", false, "assets/images/p3.jpg"),
    Question("Is this Elon Mask", true, "assets/images/p4.jpg"),
  ]);

  String questionText;
  String imageName;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    imageName = currentQuestion.image;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.greenAccent.shade100,
        elevation: 0.5,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            //This is our main page
            children: <Widget>[
              QuestionTextWithImage(
                  "$questionText", questionNumber, imageName),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //True Button
                  AnswerButton(true, () => handleAnswer(true)),
                  Padding(padding: EdgeInsets.all(10.0),),
                  //False Button
                  AnswerButton(false, () => handleAnswer(false)),
                ],
              )
            ],
          ),
          overlayShouldBeVisible == true
              ? CorrectWrongOverlay(isCorrect, () {
                  if (quiz.length == questionNumber) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ScorePage(quiz.score, quiz.length)),
                        (Route route) =>
                            route ==
                            null); // stopping the user from navigating back
                    return;
                  }
                  currentQuestion = quiz.nextQuestion;
                  this.setState(() {
                    overlayShouldBeVisible = false;
                    questionText = currentQuestion.question;
                    imageName = currentQuestion.image;
                    questionNumber = quiz.questionNumber;
                  });
                })
              : new Container(),
        ],
      ),
    );
  }
}
