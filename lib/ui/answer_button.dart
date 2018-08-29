import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _onTap;
  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: RaisedButton(
          color: Colors.blueAccent.shade100,
          onPressed: () => _onTap(),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                _answer == true ? "Agree!" : "NOOO!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.italic,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
