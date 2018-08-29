import 'package:flutter/material.dart';

class QuestionTextWithImage extends StatefulWidget {
  final String _question;
  final int _questionNumber;
  final String _img;

  QuestionTextWithImage(this._question, this._questionNumber, this._img);
  @override
  _QuestionTextWithImageState createState() => _QuestionTextWithImageState();
}

class _QuestionTextWithImageState extends State<QuestionTextWithImage>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
        duration: new Duration(
          milliseconds: 500,
        ),
        vsync: this);
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionTextWithImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Image.asset(widget._img, height: 400.0,width: 400.0,),
            Text(
              "${widget._questionNumber}: ${widget._question}",
              style: TextStyle(fontSize: _fontSizeAnimation.value * 25, fontFamily: "Pacifico"),
            ),
          ],
        )),
      ),
    );
  }
}
