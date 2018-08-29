import 'package:flutter/material.dart';
import 'package:image_quiz_flutter/pages/quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz app ;)", style: TextStyle(fontFamily: "Pacifico"),),
        backgroundColor: Colors.greenAccent,
        elevation: 0.1,
        centerTitle: true,
      ),
      backgroundColor: Colors.greenAccent,
      body: InkWell(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => QuizPage())),
        child: Stack(
          children: <Widget>[
            // Image.asset(
            //   "assets/images/kc.jpg",
            //   fit: BoxFit.fitHeight,
            // ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Tap To Start",
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Made with <3 by Nitya",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico"),
                  ),
                  Padding(padding: EdgeInsets.all(10.0),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
