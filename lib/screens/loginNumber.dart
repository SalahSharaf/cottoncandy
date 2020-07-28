import 'package:cottoncandy/utils/lacals/appTransilation.dart';
import 'package:cottoncandy/widgets/buttonGradientCenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginNumber extends StatefulWidget {
  @override
  _LoginNumberState createState() => _LoginNumberState();
}

class _LoginNumberState extends State<LoginNumber> {
  @override
  Widget build(BuildContext context) {
    var trans=AppTranslations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
                "assets/candy_image_3.PNG",
                width: double.infinity,
                height: 600,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: new Row(
                children: <Widget>[
                  Flexible(
                      flex: 4,
                      child: TextField(
                        style: TextStyle(backgroundColor: Colors.white),
                        decoration: InputDecoration(
                            hintText: trans.text("phone_number"),
                            icon: Icon(Icons.phone_android)),
                      )),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      title:Image.asset("assets/sa.PNG",width: 5,height: 5,),
                      subtitle: Text("+966"),
                    ),
                  ),
                ],
              ),
            )
            ,
            ButtonGradientCenter(
              text: trans.text("log_in"),
              function: () {},),
          ],
        ),
      ),
    );
  }
}