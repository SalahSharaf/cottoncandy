import 'package:cottoncandy/Screens/loginNumber.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds:3)).then((value){
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => LoginNumber()));
    });
    return Container(
      child: Image.asset(
        "assets/cotton_candy_splash_image.PNG",
        fit: BoxFit.fill,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}