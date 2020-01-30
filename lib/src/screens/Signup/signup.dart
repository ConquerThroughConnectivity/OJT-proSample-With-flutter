import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing/src/screens/Signup/signup_provider.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(45, 52, 71, .1),
  100: Color.fromRGBO(45, 52, 71, .2),
  200: Color.fromRGBO(45, 52, 71, .3),
  300: Color.fromRGBO(45, 52, 71, .4),
  400: Color.fromRGBO(45, 52, 71, .5),
  500: Color.fromRGBO(45, 52, 71, .6),
  600: Color.fromRGBO(45, 52, 71, .7),
  700: Color.fromRGBO(45, 52, 71, .8),
  800: Color.fromRGBO(45, 52, 71, .9),
  900: Color.fromRGBO(45, 52, 71, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF2d3447, color);

void main() => runApp(MyApp());
final double defaultScreenWidth = 420.0;
final double defaultScreenHeight = 820.0;

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
        primarySwatch: colorCustom,
      ),
      home: Sign(),
    );
  }
}

class Sign extends StatefulWidget {
  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Sign> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController firstname = new TextEditingController();
  final TextEditingController lastname = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final Auth auth = new Auth();
  @override
  void dispose() {
    username.dispose();
    password.dispose();
    firstname.dispose();
    lastname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: new AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              'Signup',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: ScreenUtil.instance.setSp(
                  30.0,
                ),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
                child: Image.asset("assets/image_01.png"),
              ),
            ],
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: formkey,
                    child: Card(
                      margin: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0),
                          right: ScreenUtil.instance.setWidth(20.0),
                          top: ScreenUtil.instance.setWidth(100.0),
                          bottom: ScreenUtil.instance.setWidth(5.0)),
                      color: Color(0xFFF5F5F5).withOpacity(0.85),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4.0,
                      child: Padding(
                        padding:
                            EdgeInsets.all(ScreenUtil.instance.setWidth(25.0)),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: username,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'This field cannot be Empty';
                                } else if (!val.contains('@') &&
                                    !val.contains('com')) {
                                  return 'Invalid Email';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(20.0)),
                            ),
                            TextFormField(
                              controller: password,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              autocorrect: false,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'This field cannot be Empty';
                                } else if (val.length < 6) {
                                  return 'Password Length must be 6 Characters long';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(20.0)),
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: firstname,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'This field cannot be Empty';
                                }
                              },
                              onSaved: (val) => firstname,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(20.0)),
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              controller: lastname,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'This field cannot be Empty';
                                }
                              },
                              onSaved: (val) => lastname,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setWidth(35.0)),
                            ),
                            RaisedButton(
                              color: Color(0xFF2d3447),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Sigin',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(14.0),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () async {
                                final form = formkey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  dynamic res =
                                      await auth.registerEmailPassword(
                                          username.text, password.text);
                                  if (res != null) {
                                    setState(() {
                                      print("Sucess");
                                    });
                                  } else {
                                    setState(() {
                                      print("Failed");
                                    });
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: ScreenUtil.instance.setWidth(80.0),
                                right: ScreenUtil.instance.setWidth(50.0)),
                            child: Image.asset("assets/image_02.png"),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
