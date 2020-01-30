import 'dart:ui';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:blinking_point/blinking_point.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing/src/screens/Account/Account.dart';
import 'package:testing/src/screens/Activities/Activities.dart';
import 'package:testing/src/screens/Home/announcement_list.dart';
import 'package:testing/src/screens/Messaging/Messaging.dart';

final double defaultScreenWidth = 420.0;
final double defaultScreenHeight = 820.0;
final String val = "2:00";

final annoucement = [
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '4:30 PM',
    isImportant: true,
  ),
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '5:30 PM',
    isImportant: false,
  ),
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '5:30 PM',
    isImportant: true,
  ),
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '4:30 PM',
    isImportant: true,
  ),
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '4:30 PM',
    isImportant: false,
  ),
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '4:30 PM',
    isImportant: false,
  ),
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '4:30 PM',
    isImportant: true,
  ),
  new Announcement(
    description: 'Pesla Meeting/ Pesla Seminar',
    time: '4:30 PM',
    isImportant: false,
  ),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.transparent,
      ),
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
  }
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;

  Widget callPages(int currentIndex, BuildContext context) {
    switch (currentIndex) {
      case 0:
        return body(context);
      case 1:
        return Activity();
      case 2:
        return Messaging();
      case 3:
        return Account();
        break;
      default:
    }
  }

  Widget botomBar() {
    return Container(
        child: BottomNavyBar(
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Color(0xFFff726f)),
        BottomNavyBarItem(
            icon: Icon(Icons.local_activity),
            title: Text('Activities'),
            activeColor: Color(0xFF786fff)),
        BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Messaging'),
            activeColor: Color(0xFFff726f)),
        BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('My Account'),
            activeColor: Color(0xFF786fff)),
      ],
      onItemSelected: (index) => setState(() {
        selectedIndex = index;
      }),
      selectedIndex: selectedIndex,
      showElevation: true,
      backgroundColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: appbar(),
      body: callPages(selectedIndex, context),
      bottomNavigationBar: botomBar(),
    );
  }
}

Widget body(BuildContext context) {
  return Stack(
    children: <Widget>[
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil.instance.setHeight(200.0),
              width: double.infinity,
              child: Card(
                elevation: 16.0,
                borderOnForeground: true,
                color: Color(0xFF2d3447),
                margin: EdgeInsets.only(
                    right: ScreenUtil.instance.setWidth(19.0),
                    left: ScreenUtil.instance.setWidth(16.0),
                    top: ScreenUtil.instance.setWidth(16.0)),
                clipBehavior: Clip.antiAlias,
                child: ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    width: ScreenUtil.instance.setWidth(450.0),
                    height: ScreenUtil.instance.setWidth(200.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[
                            Colors.white12,
                            Colors.black12,
                          ]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(300.0)),
                          child: BlinkingPoint(
                            xCoor: 50.0,
                            yCoor: 100.0,
                            pointColor:
                                val == "2:00" ? Colors.red : Colors.white,
                            pointSize: 5.0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(80.0),
                              left: ScreenUtil.instance.setWidth(20.0)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Time until next time-in: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: ScreenUtil.instance.setSp(20.0),
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                '$val',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: ScreenUtil.instance.setSp(20.0),
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(15.0),
                  right: ScreenUtil.instance.setWidth(15.0)),
              child: cardFirst(context),
            ),
            Container(
              padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.5)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(20.0),
                        left: ScreenUtil.instance.setWidth(20.0),
                        bottom: ScreenUtil.instance.setWidth(20.0)),
                    child: Text('Announcements',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins-Medium',
                          fontSize: ScreenUtil.instance.setSp(30.0),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    width: 600,
                    height: 600,
                    child: Card(
                      margin: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0),
                          right: ScreenUtil.instance.setWidth(20.0),
                          top: ScreenUtil.instance.setWidth(5.0)),
                      color: Color(0xFF2d3447).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      child: Container(
                          padding: EdgeInsets.all(
                              ScreenUtil.instance.setWidth(25.0)),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: <Widget>[
                              ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: annoucement.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return list(
                                      context,
                                      '${annoucement[index].description}' +
                                          " " +
                                          '${annoucement[index].time}',
                                      '${annoucement[index].isImportant == true ? '#Important Update' : '#Regular Update'}',
                                      annoucement[index].isImportant == true
                                          ? Color(0xFFff726f)
                                          : Color(0xFF786fff),
                                      Icon(
                                        Icons.notification_important,
                                        size: 50,
                                      ));
                                },
                              ),
                            ],
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 80.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget cardFirst(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SpringButton(
        SpringButtonType.OnlyScale,
        card('Time-In', context, Color(0xFFff726f)),
        onTapDown: (_) {},
        onLongPressEnd: (_) {},
        onTap: () {},
      ),
      SpringButton(
        SpringButtonType.OnlyScale,
        card('Total-Hours', context, Color(0xFF786fff)),
        onTapDown: (_) {},
        onLongPressEnd: (_) {},
        onTap: () {},
      ),
    ],
  );
}

Widget list(
  BuildContext context,
  String title,
  String subtitle,
  Color colors,
  Icon icon,
) {
  return Card(
    color: colors,
    child: ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins-Medium',
          fontSize: ScreenUtil.instance.setSp(15.0),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white54),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.navigate_next,
          size: 30,
        ),
        color: Colors.white60,
        onPressed: () {
          setBottomSheet(context, title, subtitle);
        },
      ),
    ),
  );
}

void setBottomSheet(BuildContext context, String title, String subtitle) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          color: Color(0xFF121621),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(top: ScreenUtil.instance.setWidth(20)),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins-Medium',
                              fontSize: ScreenUtil.instance.setSp(20.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins-Medium',
                              fontSize: ScreenUtil.instance.setSp(10.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        );
      });
}

Widget expandedList(Color color, Text title) {
  return Card(
    color: color,
    child: ExpansionTile(
      title: title,
    ),
  );
}

Widget card(String title, BuildContext context, Color color) {
  return Stack(
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20, bottom: 20),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.bold),
        ),
      ),
      Positioned(
        top: -15,
        left: -20,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: ClipRRect(
            borderRadius: BorderRadius.only(),
            child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 1,
                widthFactor: 1,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(0.0),
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(0.0),
                      )),
                )),
          ),
        ),
      ),
    ],
  );
}

Widget appbar() {
  return AppBar(
    elevation: 0.0,
    leading: Container(
      child: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {},
      ),
    ),
    centerTitle: true,
    title: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.black12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Icon(
            Icons.location_on,
            color: Colors.white,
          )),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Deped Tagum City Division',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Medium',
                    fontSize: 10.0,
                    fontWeight: FontWeight.normal)),
          )
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications_active),
        color: Colors.white,
        onPressed: () {},
      ),
    ],
  );
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

enum SpringButtonType {
  OnlyScale,
  WithOpacity,
}

class SpringButton extends StatefulWidget {
  const SpringButton(
    this.springButtonType,
    this.uiChild, {
    Key key,
    this.useCache: true,
    this.alignment: Alignment.center,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
  }) : super(key: key);

  final Alignment alignment;
  final GestureTapCallback onDoubleTap;
  final GestureForcePressEndCallback onForcePressEnd;
  final GestureForcePressPeakCallback onForcePressPeak;
  final GestureForcePressStartCallback onForcePressStart;
  final GestureForcePressUpdateCallback onForcePressUpdate;
  final GestureDragCancelCallback onHorizontalDragCancel;
  final GestureDragDownCallback onHorizontalDragDown;
  final GestureDragEndCallback onHorizontalDragEnd;
  final GestureDragStartCallback onHorizontalDragStart;
  final GestureDragUpdateCallback onHorizontalDragUpdate;
  final GestureLongPressCallback onLongPress;
  final GestureLongPressEndCallback onLongPressEnd;
  final GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;
  final GestureLongPressStartCallback onLongPressStart;
  final GestureLongPressUpCallback onLongPressUp;
  final GestureDragCancelCallback onPanCancel;
  final GestureDragDownCallback onPanDown;
  final GestureDragEndCallback onPanEnd;
  final GestureDragStartCallback onPanStart;
  final GestureDragUpdateCallback onPanUpdate;
  final GestureScaleEndCallback onScaleEnd;
  final GestureScaleStartCallback onScaleStart;
  final GestureScaleUpdateCallback onScaleUpdate;
  final GestureTapCancelCallback onSecondaryTapCancel;
  final GestureTapDownCallback onSecondaryTapDown;
  final GestureTapUpCallback onSecondaryTapUp;
  final GestureTapCallback onTap;
  final GestureTapCancelCallback onTapCancel;
  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback onTapUp;
  final GestureDragCancelCallback onVerticalDragCancel;
  final GestureDragDownCallback onVerticalDragDown;
  final GestureDragEndCallback onVerticalDragEnd;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;

  ///Use this value to determine the type of animation to be played.
  final SpringButtonType springButtonType;

  ///The widget that is to be displayed on your regular UI.
  final Widget uiChild;

  final bool useCache;

  ///Set this to true if your [uiChild] doesn't change at runtime.

  @override
  SpringButtonState createState() => SpringButtonState(
        springButtonType,
        useCache,
        alignment,
        onTapDown,
        onTapUp,
        onTap,
        onTapCancel,
        onSecondaryTapDown,
        onSecondaryTapUp,
        onSecondaryTapCancel,
        onDoubleTap,
        onLongPress,
        onLongPressStart,
        onLongPressMoveUpdate,
        onLongPressUp,
        onLongPressEnd,
        onVerticalDragDown,
        onVerticalDragStart,
        onVerticalDragUpdate,
        onVerticalDragEnd,
        onVerticalDragCancel,
        onHorizontalDragDown,
        onHorizontalDragStart,
        onHorizontalDragUpdate,
        onHorizontalDragEnd,
        onHorizontalDragCancel,
        onForcePressStart,
        onForcePressPeak,
        onForcePressUpdate,
        onForcePressEnd,
        onPanDown,
        onPanStart,
        onPanUpdate,
        onPanEnd,
        onPanCancel,
        onScaleStart,
        onScaleUpdate,
        onScaleEnd,
      );
}

class SpringButtonState extends State<SpringButton>
    with SingleTickerProviderStateMixin {
  SpringButtonState(
    this.springButtonType,
    this.useCache,
    this.alignment,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
  );

  ///The [AnimationController] used to create the spring effect.
  final Alignment alignment;
  Animation<double> animation;
  AnimationController animationController;
  bool isSpringDown = false;
  final GestureTapCallback onDoubleTap;
  final GestureForcePressEndCallback onForcePressEnd;
  final GestureForcePressPeakCallback onForcePressPeak;
  final GestureForcePressStartCallback onForcePressStart;
  final GestureForcePressUpdateCallback onForcePressUpdate;
  final GestureDragCancelCallback onHorizontalDragCancel;
  final GestureDragDownCallback onHorizontalDragDown;
  final GestureDragEndCallback onHorizontalDragEnd;
  final GestureDragStartCallback onHorizontalDragStart;
  final GestureDragUpdateCallback onHorizontalDragUpdate;
  final GestureLongPressCallback onLongPress;
  final GestureLongPressEndCallback onLongPressEnd;
  final GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;
  final GestureLongPressStartCallback onLongPressStart;
  final GestureLongPressUpCallback onLongPressUp;
  final GestureDragCancelCallback onPanCancel;
  final GestureDragDownCallback onPanDown;
  final GestureDragEndCallback onPanEnd;
  final GestureDragStartCallback onPanStart;
  final GestureDragUpdateCallback onPanUpdate;
  final GestureScaleEndCallback onScaleEnd;
  final GestureScaleStartCallback onScaleStart;
  final GestureScaleUpdateCallback onScaleUpdate;
  final GestureTapCancelCallback onSecondaryTapCancel;
  final GestureTapDownCallback onSecondaryTapDown;
  final GestureTapUpCallback onSecondaryTapUp;
  final GestureTapCallback onTap;
  final GestureTapCancelCallback onTapCancel;
  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback onTapUp;
  final GestureDragCancelCallback onVerticalDragCancel;
  final GestureDragDownCallback onVerticalDragDown;
  final GestureDragEndCallback onVerticalDragEnd;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final SpringButtonType springButtonType;
  Widget uiChild;
  final bool useCache;

  ///Use this value to determine the depth of debug logging that is actually only here for myself and the Swiss scientists.
  final int _debugLevel = 0;

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (useCache) uiChild = wrapper();

    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.value = 1;
    animation = Tween(
      begin: 0.75,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  bool get hasMultiple {
    List<bool> list = [
      hasTap,
      hasSecondaryTap,
      hasDoubleTap,
      hasLongPress,
      hasVerticalDrag,
      hasHorizontalDrag,
      hasForcePress,
      hasPan,
      hasScale
    ];
    return list.where((bool b) => b).length > 1;
  }

  bool get hasTap =>
      onTapDown != null ||
      onTapUp != null ||
      onTap != null ||
      onTapCancel != null;

  bool get hasSecondaryTap =>
      onSecondaryTapDown != null ||
      onSecondaryTapUp != null ||
      onSecondaryTapCancel != null;

  bool get hasDoubleTap => onDoubleTap != null;

  bool get hasLongPress =>
      onLongPress != null ||
      onLongPressStart != null ||
      onLongPressMoveUpdate != null ||
      onLongPressUp != null ||
      onLongPressEnd != null;

  bool get hasVerticalDrag =>
      onVerticalDragDown != null ||
      onVerticalDragStart != null ||
      onVerticalDragUpdate != null ||
      onVerticalDragEnd != null ||
      onVerticalDragCancel != null;

  bool get hasHorizontalDrag =>
      onHorizontalDragDown != null ||
      onHorizontalDragStart != null ||
      onHorizontalDragUpdate != null ||
      onHorizontalDragEnd != null ||
      onHorizontalDragCancel != null;

  bool get hasForcePress =>
      onForcePressStart != null ||
      onForcePressPeak != null ||
      onForcePressUpdate != null ||
      onForcePressEnd != null;

  bool get hasPan =>
      onPanDown != null ||
      onPanStart != null ||
      onPanUpdate != null ||
      onPanCancel != null;

  bool get hasScale =>
      onScaleStart != null || onScaleUpdate != null || onScaleEnd != null;

  void springDown() {
    if (_debugLevel > 0) print("springDown");

    isSpringDown = true;
    animationController.value = 0;
  }

  Future spring() async {
    if (_debugLevel > 0) print("spring-1");

    isSpringDown = false;

    if (hasMultiple) await Future.delayed(const Duration(milliseconds: 5));

    if (_debugLevel > 0) print("spring-2");

    if (!isSpringDown) animationController.forward();
  }

  Future springUp() async {
    if (_debugLevel > 0) print("springUp-1");

    isSpringDown = false;

    if (hasMultiple) await Future.delayed(const Duration(milliseconds: 500));

    if (_debugLevel > 0) print("springUp-2");

    if (!isSpringDown) animationController.value = 1;
  }

  Widget wrapper() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: !hasTap
          ? null
          : (_) {
              springDown();
              if (onTapDown != null) onTapDown(_);
            },
      onTapUp: !hasTap
          ? null
          : (_) {
              spring();
              if (onTapUp != null) onTapUp(_);
            },
      onTap: !hasTap
          ? null
          : () {
              if (onTap != null) onTap();
            },
      onTapCancel: !hasTap
          ? null
          : () {
              springUp();
              if (onTapCancel != null) onTapCancel();
            },
      onSecondaryTapDown: !hasSecondaryTap
          ? null
          : (_) {
              springDown();
              if (onSecondaryTapDown != null) onSecondaryTapDown(_);
            },
      onSecondaryTapUp: !hasSecondaryTap
          ? null
          : (_) {
              spring();
              if (onSecondaryTapUp != null) onSecondaryTapUp(_);
            },
      onSecondaryTapCancel: !hasSecondaryTap
          ? null
          : () {
              springUp();
              if (onSecondaryTapCancel != null) onSecondaryTapCancel();
            },
      onDoubleTap: !hasDoubleTap
          ? null
          : () {
              springDown();
              spring();
              if (onDoubleTap != null) onDoubleTap();
            },
      onLongPress: !hasLongPress
          ? null
          : () {
              if (onLongPress != null) onLongPress();
            },
      onLongPressStart: !hasLongPress
          ? null
          : (_) {
              springDown();
              if (onLongPressStart != null) onLongPressStart(_);
            },
      onLongPressMoveUpdate: !hasLongPress
          ? null
          : (_) {
              if (onLongPressMoveUpdate != null) onLongPressMoveUpdate(_);
            },
      onLongPressUp: !hasLongPress
          ? null
          : () {
              spring();
              if (onLongPressUp != null) onLongPressUp();
            },
      onLongPressEnd: !hasLongPress
          ? null
          : (_) {
              if (onLongPressEnd != null) onLongPressEnd(_);
            },
      onVerticalDragDown: !hasVerticalDrag
          ? null
          : (_) {
              if (onVerticalDragDown != null) onVerticalDragDown(_);
            },
      onVerticalDragStart: !hasVerticalDrag
          ? null
          : (_) {
              springDown();
              if (onVerticalDragStart != null) onVerticalDragStart(_);
            },
      onVerticalDragUpdate: !hasVerticalDrag
          ? null
          : (_) {
              if (onVerticalDragUpdate != null) onVerticalDragUpdate(_);
            },
      onVerticalDragEnd: !hasVerticalDrag
          ? null
          : (_) {
              spring();
              if (onVerticalDragEnd != null) onVerticalDragEnd(_);
            },
      onVerticalDragCancel: !hasVerticalDrag
          ? null
          : () {
              springUp();
              if (onVerticalDragCancel != null) onVerticalDragCancel();
            },
      onHorizontalDragDown: !hasHorizontalDrag
          ? null
          : (_) {
              if (onHorizontalDragDown != null) onHorizontalDragDown(_);
            },
      onHorizontalDragStart: !hasHorizontalDrag
          ? null
          : (_) {
              springDown();
              if (onHorizontalDragStart != null) onHorizontalDragStart(_);
            },
      onHorizontalDragUpdate: !hasHorizontalDrag
          ? null
          : (_) {
              if (onHorizontalDragUpdate != null) onHorizontalDragUpdate(_);
            },
      onHorizontalDragEnd: !hasHorizontalDrag
          ? null
          : (_) {
              spring();
              if (onHorizontalDragEnd != null) onHorizontalDragEnd(_);
            },
      onHorizontalDragCancel: !hasHorizontalDrag
          ? null
          : () {
              springUp();
              if (onHorizontalDragCancel != null) onHorizontalDragCancel();
            },
      onForcePressStart: !hasForcePress
          ? null
          : (_) {
              springDown();
              if (onForcePressStart != null) onForcePressStart(_);
            },
      onForcePressPeak: !hasForcePress
          ? null
          : (_) {
              if (onForcePressPeak != null) onForcePressPeak(_);
            },
      onForcePressUpdate: !hasForcePress
          ? null
          : (_) {
              if (onForcePressUpdate != null) onForcePressUpdate(_);
            },
      onForcePressEnd: !hasForcePress
          ? null
          : (_) {
              spring();
              if (onForcePressEnd != null) onForcePressEnd(_);
            },
      onPanDown: !hasPan
          ? null
          : (_) {
              if (onPanDown != null) onPanDown(_);
            },
      onPanStart: !hasPan
          ? null
          : (_) {
              springDown();
              if (onPanStart != null) onPanStart(_);
            },
      onPanUpdate: !hasPan
          ? null
          : (_) {
              if (onPanUpdate != null) onPanUpdate(_);
            },
      onPanEnd: !hasPan
          ? null
          : (_) {
              spring();
              if (onPanEnd != null) onPanEnd(_);
            },
      onPanCancel: !hasPan
          ? null
          : () {
              springUp();
              if (onPanCancel != null) onPanCancel();
            },
      onScaleStart: !hasScale
          ? null
          : (_) {
              springDown();
              if (onScaleStart != null) onScaleStart(_);
            },
      onScaleUpdate: !hasScale
          ? null
          : (_) {
              if (onScaleUpdate != null) onScaleUpdate(_);
            },
      onScaleEnd: !hasScale
          ? null
          : (_) {
              spring();
              if (onScaleEnd != null) onScaleEnd(_);
            },
      child: widget.uiChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (springButtonType == SpringButtonType.WithOpacity)
      return AnimatedBuilder(
        animation: animation,
        child: useCache ? uiChild : null,
        builder: (BuildContext context, Widget cachedChild) {
          return Opacity(
            opacity: animation.value.clamp(0.5, 1.0),
            child: Transform.scale(
              scale: animation.value,
              alignment: alignment,
              child: useCache ? cachedChild : wrapper(),
            ),
          );
        },
      );
    return AnimatedBuilder(
      animation: animation,
      child: useCache ? uiChild : null,
      builder: (BuildContext context, Widget cachedChild) {
        return Transform.scale(
          scale: animation.value,
          child: useCache ? cachedChild : wrapper(),
        );
      },
    );
  }
}
