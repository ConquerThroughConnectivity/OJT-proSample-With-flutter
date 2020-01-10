import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/src/screens/Login/Login.dart';





Map<int, Color> color =
{
50:Color.fromRGBO(45,52,71, .1),
100:Color.fromRGBO(45,52,71, .2),
200:Color.fromRGBO(45,52,71, .3),
300:Color.fromRGBO(45,52,71, .4),
400:Color.fromRGBO(45,52,71, .5),
500:Color.fromRGBO(45,52,71, .6),
600:Color.fromRGBO(45,52,71, .7),
700:Color.fromRGBO(45,52,71, .8),
800:Color.fromRGBO(45,52,71, .9),
900:Color.fromRGBO(45,52,71, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF2d3447, color);


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:colorCustom ,
      ),
      home: MyHomePage(),
  

      
    );
  }
}



















