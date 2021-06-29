import 'package:flutter/material.dart';
import 'dart:math';

class Result extends StatefulWidget {

  final int rng;

  const Result({Key? key, this.rng = 0}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  String result = '';

  @override
  void initState(){
    if(widget.rng==1){
      result = 'lib/assets/images/moeda_cara.png';
    }else{
      result = 'lib/assets/images/moeda_coroa.png';
    }

    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds:500));
    _animation = Tween<double>(begin: 0, end: 6).animate(_animationController!)
    ..addListener(() {
      setState(() {});
    })..addStatusListener((status) { _animationStatus = status; });


    if(_animationStatus == AnimationStatus.dismissed){
      _animationController!.forward();
    }else{
      _animationController!.reverse();
    }

  }

  _jogar(){
    int rng = Random().nextInt(2);

    if(_animationStatus == AnimationStatus.dismissed){
      _animationController!.forward();
    }else{
      _animationController!.reverse();
    }

    setState(() {
      if(rng==1){
        result = 'lib/assets/images/moeda_cara.png';
      }else{
        result = 'lib/assets/images/moeda_coroa.png';
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd8c),
      body: SafeArea(
        child: Container(
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 50),
                      padding: EdgeInsets.all(30),
                      child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateX(pi*_animation!.value),
                          child: Image.asset(result)
                      )
                  ),
                  onTap: (){
                    _jogar();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  padding: EdgeInsets.all(30),
                  child: GestureDetector(
                    child: Image.asset('lib/assets/images/botao_voltar.png'),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                )

              ],
            ),
          )
        ),
      ),
    );
  }
}
