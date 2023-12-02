

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_basket/welcome_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
  void initState(){
    super.initState();
  Timer(const Duration(milliseconds:2500),
  (){
    Navigator.push(context,MaterialPageRoute(builder: (context){
return const WelcomePage();

    }));
  }
  );
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
     
    );
  }
}