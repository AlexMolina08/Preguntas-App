import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController animCtrll; //animation controller (va de 0 a 1)
  Animation anim;

  @override
  void initState() {
    super.initState();
    //inicializamos el animation controller
    animCtrll = AnimationController(
        duration: Duration(
            seconds: 3), //la animacion va a tardar 5 segundos en completarse
        vsync: this);

    final curvedAnimation = CurvedAnimation(
      parent: animCtrll,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut
    );


    //inicializamos animation , que no es mas que una transformacion del animation controller

    anim = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(curvedAnimation)
      ..addListener(() { //en cada cambio del animation , se llama al setState (se llama al metodo build)
        setState(() {});
      })..addStatusListener((status) {
        if(status == AnimationStatus.completed)
          animCtrll.reverse();
        else if(status == AnimationStatus.dismissed)
          animCtrll.forward();
      });

    animCtrll.forward(); //iniciamos la animacion
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      //Widget que hace rotar a su hijo
      angle: anim.value,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Image.asset(
          'images/questionIcon.png',
        ),
      ),
    );
  }


  @override
  void dispose() {
    animCtrll.dispose();
    super.dispose();
  }

}
