import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_app/wrapmain.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1) , () { 
      Navigator.push(context, MaterialPageRoute(builder: (c)=>Wrapmain() ));
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset("images/logo/Grabber.svg"),
      ),
    );
  }
}