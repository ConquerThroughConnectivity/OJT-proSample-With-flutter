import 'package:flutter/material.dart';


class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return AccountState();
  }

}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            cover(),
            SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height /4.4,
                    ),
                    image(),
                    padding(),
                    myName(),
                    padding(),
                    code(),
                    padding(),
                    divider(),
                  ],
                ),
              ),
            )
          ],
        
    );
  } 
} 


Widget divider(){
  return Divider(
    color: Colors.white24,
    endIndent: 30,
    indent: 30,
  );
}

Widget code(){
  return Text('My Code',
  style: TextStyle(
    fontFamily: 'Poppins-Medium',
    color: Colors.white,
    fontSize: 15.0,
  ) 
  );
}


Widget padding(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
  );
}

Widget myName(){
  return Text('My Name',
  style: TextStyle(
    fontFamily: 'Poppins-Bold',
    color: Colors.white,
    fontSize: 20.0,
  ) 
  );
}

Widget cover(){
  return Container(
        height: 200,
        width: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/miming.jpg'),
            fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(10),
        ),
        );
}


Widget image(){
  return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.cover 
            ),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(
              color: Colors.white,
              width: 10.0
            )
        ),
      ),
  );
}