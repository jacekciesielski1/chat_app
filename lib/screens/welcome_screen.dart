import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/components/round_button.dart';
class WelcomeScreen extends StatefulWidget {

  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}



class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;


  @override
  void initState(){
    super.initState();
    controller = AnimationController(
        duration:  Duration(seconds: 1),
        vsync: this,
      upperBound: 100.0,
    );
animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/black-cat-blackandwhite.png'),
                    height: controller.value,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  curve: Curves.easeIn,
                  repeatForever: false,
                  text:['Cat Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(Colors.lightBlue, "Zaloguj się", (){Navigator.pushNamed(context, LoginScreen.id);}),
            RoundButton(Colors.blueAccent, "Zarejestruj się", (){Navigator.pushNamed(context, RegistrationScreen.id);})
          ],
        ),
      ),
    );
  }
}


