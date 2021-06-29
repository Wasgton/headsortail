import 'package:heads_or_tails/pages/Result.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void _callPage(context){

    int rng = Random().nextInt(2);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context) => Result(rng:rng),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Color(0xff61bd8c),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    padding: EdgeInsets.all(30),
                    child: Image.asset('lib/assets/images/logo.png')
                  ),
                  GestureDetector(
                    child: Image.asset('lib/assets/images/botao_jogar.png'),
                    onTap: ()=>{
                      _callPage(context)
                      },
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
