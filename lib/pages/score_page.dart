import 'package:flutter/material.dart';
import 'package:image_quiz_flutter/pages/landing_page.dart';
import 'package:image_quiz_flutter/ui/answer_button.dart';

class ScorePage extends StatefulWidget {
  final int score;
  final int totalQuestion;

  ScorePage(this.score, this.totalQuestion);
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  String disp = "";
  bool isP = false;
  handleAnswer(bool ans) {
    print(ans);
    this.setState(() {
      isP = true;
      if (ans) {
        disp = "Yeii so Pizza tommorow!";
      } else {
        disp = "Naa ";
      }
      disp = disp +
          " \n Take a screenshot and send it ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
        body: Stack(
          children: <Widget>[
            // Image.asset(widget.score > 4
            //     ? "assets/images/n2.jpg"
            //     : "assets/images/n3.jpg"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Score:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: "Pacifico"),
                ),
                Text(
                  "${widget.score.toString()}/${widget.totalQuestion.toString()}",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Pacifico",
                      fontSize: 25.0),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    widget.score > 4
                        ? "guessed pretty well!"
                        : "Oh NOOOOOO! ",
                    style:
                        TextStyle(color: Colors.white, fontFamily: "Pacifico"),
                  ),
                ),
                isP == true
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //True Button
                          AnswerButton(true, () => handleAnswer(true)),
                          Padding(padding: EdgeInsets.all(15.0),),
                          //False Button
                          AnswerButton(false, () => handleAnswer(false)),
                        ],
                      ),
                Text(
                  isP == true ? disp : "",
                  style: TextStyle(color: Colors.white, fontFamily: "Pacifico"),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  color: Colors.white,
                  iconSize: 50.0,
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => LandingPage()),
                      (Route route) => route == null),
                ),
              ],
            ),
          ],
        ));
  }
}
