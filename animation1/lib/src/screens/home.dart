import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/cat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    boxAnimation = Tween(begin: pi * 0.6, end: pi * 0.65).animate(CurvedAnimation(
      parent: boxController,
      curve: Curves.easeInOut,
    ));

    boxAnimation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        boxController.repeat();
      } else if (status == AnimationStatus.forward){
        boxController.forward();

      }
    });


    catController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    catAnimation = Tween(begin: -35.0, end: -80.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Home Animation'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GestureDetector(
        onTap: _onTap,
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildCatAnimation(),
              returnBox(),
              buildLeftFlap(),
              buildRightFlap()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return new Positioned(
          left: 0.0,
          right: 0.0,
          child: child,
          top: catAnimation.value,
        );
      },
      child: Cat(),
    );
  }

  void _onTap() {
    if (catAnimation.status == AnimationStatus.completed) {
      boxController.forward();
      catController.reverse();
    } else if (catAnimation.status == AnimationStatus.dismissed) {
      boxController.stop();

      catController.forward();
    }
  }

  Widget returnBox() {
    return Container(
      color: Colors.brown,
      width: 200.0,
      height: 200.0,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context, child){
          return Transform.rotate(
            angle: boxAnimation.value,
            //origin: Off,
            alignment: Alignment.topLeft,
            child: child,

          );

        },

      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        builder: (context, child){
          return Transform.rotate(
            angle: -boxAnimation.value,
            //origin: Off,
            alignment: Alignment.topRight,
            child: child,

          );

        },

      ),
    );
  }
}
