import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {
  final bool isCorrect;
  final VoidCallback _onTap;
  CorrectWrongOverlay(this.isCorrect, this._onTap);
  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 3), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose(){
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * 3.1416,
                child: Icon(
                  widget.isCorrect ? Icons.done : Icons.clear,
                  size: _iconAnimation.value * 80.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Text(
              widget.isCorrect ? "Yeiiii!" : "Opsss Nooo!",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
