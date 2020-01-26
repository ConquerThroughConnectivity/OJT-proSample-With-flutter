import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:progress_button/progress_button.dart';
import 'package:testing/src/screens/Home/home.dart';
import 'package:testing/src/screens/Signup/signup.dart';




final double defaultScreenWidth = 420.0;
final double defaultScreenHeight = 820.0;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final FirebaseAuth auth =FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();


 
  
  final formkey =GlobalKey<FormState>();
  final TextEditingController username =new TextEditingController();
  final TextEditingController password =new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();



  var authHandler = new Path();

 @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
    }

    Future <FirebaseUser> onSubmit() async {
    final form =formkey.currentState;
    if(form.validate()){
      form.save();
      // try{
      // AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: username.text, password: password.text,);
      // final FirebaseUser user =result.user;

      // assert(user !=null);
      // assert(await user.getIdToken() !=null);

      // final FirebaseUser currentuser = await auth.currentUser();
      // assert(user.uid ==currentuser.uid);
      // return user;
      // }catch(e){
      //   print(e.message);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {

  ScreenUtil.instance = ScreenUtil(
    width: defaultScreenWidth,
    height: defaultScreenHeight,
    allowFontScaling: true,
  )..init(context);

  

   return Scaffold(
     
    backgroundColor:  Color(0xFF2d3447),
    appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Ojt-Pro Sign In', style: TextStyle(
          fontSize: ScreenUtil.instance.setSp(18.0),
          fontFamily: 'Pacifico',
          fontWeight: FontWeight.w400,
          color: Colors.white,
          ),
          ),
         ),
        body:       
        Stack(
          fit: StackFit.expand,
            children: <Widget>[
             Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
                      Padding(
                      padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
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
                       child:  Card(
                        margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0), right: ScreenUtil.instance.setWidth(20.0), top: ScreenUtil.instance.setWidth(180.0), bottom: ScreenUtil.instance.setWidth(5.0)),
                        color: Color(0xFFF5F5F5).withOpacity(0.85),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4.0,
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil.instance.setWidth(25.0)),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                  textInputAction: TextInputAction.done,
                                  controller: username,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val){
                                    if(val.isEmpty){
                                      return 'This field cannot be Empty';
                                    }else if(!val.contains('@') && !val.contains('com')){
                                      return 'Invalid Email';
                                    }
                                  },
                                  onSaved: (val) =>username,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(20.0)),
                              ),
                             TextFormField(
                                    controller: password,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    autocorrect: false,
                                    validator: (val) {
                                      if(val.isEmpty){
                                        return 'This field cannot be Empty';
                                      }
                                      else if(val.length <6){
                                        return 'Password Length must be 6 Characters long';
                                      }
                                    },
                                    onSaved: (val) =>password,
                                    decoration: InputDecoration(
                                      labelText: 'Password',

                                    ),
                                  ),
                              Padding(
                                padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(35.0)),
                              ),
                              ProgressButton(
                                buttonState: ButtonState.inProgress, 
                                child: Text('Login',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Poppins-Medium'
                                  ),),
                                onPressed: (){
                                  onSubmit().then((FirebaseUser user){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile(),fullscreenDialog: true));
                                }).catchError((e) => print(e));
                                },
                                backgroundColor: Color(0xFF2d3447),
                                progressColor: Theme.of(context).primaryColor,      

                              ),
                            ],
                          ),
                        ),
                      ),
                     ),
                      Container(
                       padding: EdgeInsets.only(top: 20.0),
                     ),
                     FlatButton(
                            onPressed: (){
                              signup();
                            },
                            child: Text('Signup',
                            style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(20.0),
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins-Bold',
                              color: Colors.white,
                            ),
                            ),
                            
                          ),
                         Stack(
                           children: <Widget>[
                              Container(
                       padding: EdgeInsets.only(top: 30.0),
                     ),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                          FloatingActionButton(     
                            backgroundColor: Colors.white,                       
                            child: Image(
                              image: NetworkImage('https://4.bp.blogspot.com/-ELGjUUP9ySM/XDc1M1bfkJI/AAAAAAAAGts/w8pbqBzOnOYdRIiBk8wqwvmkOiKzDyp1wCK4BGAYYCw/s1600/logo%2Bfacebook.png'),
                              fit: BoxFit.fill,
                            ),
                            heroTag: 'facebook',
                            mini: true,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                             onPressed: () {

                            },
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            child: Image(
                              image: NetworkImage('https://cdn3.iconfinder.com/data/icons/free-social-icons/67/twitter_circle_color-512.png'),
                              fit: BoxFit.fill,
                            ),
                            heroTag: 'twitter',
                            mini: true,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            onPressed: (){

                            },
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            child: Image(
                              image: NetworkImage('https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_960_720.png'),
                              fit: BoxFit.fill,
                            ),
                            heroTag: 'google',
                            mini: true,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            onPressed: (){

                            },
                          ),
                          
                       ],
                     ),
                    
                    Container(
                      padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(180.0)),
                      child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Copyright 2019',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 10.0,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 15.0,
                                    color: Colors.white,
                                    offset: Offset(-15.0, -15.0),
                                  )
                                ]
                              ),
                              ),
                      ],
                    ),
                    ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       Container(
                         
                     padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(180.0), left: ScreenUtil.instance.setWidth(80.0),right: ScreenUtil.instance.setWidth(50.0)),
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
          )
    );
  }
  signup(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign(), fullscreenDialog: true));
  }
  

  
}
