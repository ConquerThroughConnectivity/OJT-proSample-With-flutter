

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:testing/src/screens/Activities/activities_list.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final GlobalKey<AnimatedListState> listKey = GlobalKey();
final df = new DateFormat('MM-dd-yyyy');
final String now =df.format(DateTime.now());
final TextEditingController activitytitle = new TextEditingController();
final GlobalKey<AnimatedListState> animatedList = new GlobalKey();
final TextEditingController textTitle = new TextEditingController();
bool isClicked;
int index;


final description =[];
final title =[];

class Activity extends StatefulWidget {
  Activity({Key key}): super(key: key);
  @override
 State<StatefulWidget> createState(){

  
   
   return ActivityState();
 }
}

class ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2d3447),
        body: Stack(
            children: <Widget>[
              AnimatedList(
              key: animatedList,
              physics: BouncingScrollPhysics(),
              initialItemCount: title.length,
              itemBuilder: (BuildContext context, index, Animation animation){
              return SizeTransition(
              axis: Axis.vertical,
              sizeFactor: animation,
              child: Card(
                  color: Color(0xFFECDFBD),
                  child: ExpansionTile(
                  key: new Key(index.toString()),
                  initiallyExpanded: false,
                  children: <Widget>[ 
                        Container(
                          width: ScreenUtil.getInstance().setHeight(470),
                          child: FlatButton(
                          child: Text('ADD description on this title',style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white,)),
                          color: Color(0xFF2d3447),
                          onPressed: () async {
                            setState(() {
                              isClicked =false;
                              alert(context, 'Description on this title', index);
                            });
                          },
                        ),  
                        ),            
                       ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: description.length,
                        itemBuilder: (BuildContext context, int i){
                        return Card(
                        color: Color(0xFF2d3447),
                        child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.10,
                        child: ListTile(
                            title: Text('${description[i].description}',style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 15,
                            color: Colors.white,
                          ),),
                          ),
                        actions: <Widget>[
                        IconSlideAction(
                          caption: 'Edit',
                          icon: Icons.edit,
                          color: Colors.blue,
                          onTap: () async {

                          },
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          icon: Icons.delete,
                          color: Colors.red,
                          onTap: () async {

                          },
                        ),
                      ],
                      ),
                    );
                        },
                      ),
                  ],
                  trailing: Icon(Icons.arrow_drop_down, color: Colors.black12,),
                  title: Text('${title[index].title}',style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 15,
                ),),
                
              ),
              ),

            );
            }
             
              ),
            ],
        ),
        floatingActionButton: GestureDetector(
            onTap: (){
            isClicked =true;
            alert(context,"Activity this day", index);
            },
            child: Container(
              width: 90,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Color(0xFF354458),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white,),
                  Padding(
                    padding: EdgeInsets.only(left: 2.0,right: 2.0), 
                    ),
                  Text('ADD',style: TextStyle(fontFamily: 'Poppins-Bold', color: Colors.white,)),
                ],
              ),
            ),
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
    
  }
  popup(BuildContext context, bool isClicked){
    if(isClicked ==false){
      description.add(new ActivityDescription(description: textTitle.text));
    }else if(isClicked ==true){
      title.insert(0, new ActivityTitle(title: textTitle.text));
      animatedList.currentState.insertItem(0);
    }
    
  }

  alert(BuildContext context, String alerttitle, int index){
  return Alert(
    context: context,
    type: AlertType.info,
    title: alerttitle,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Center(
        child:TextField(
         controller: textTitle,
         textAlign: TextAlign.center,
         minLines: null,
         keyboardType: TextInputType.multiline,
         maxLines: 2,
         decoration: InputDecoration.collapsed(
           hintText: "Title",
           hasFloatingPlaceholder: true
         ),
        
       ),
       
      ),
    ],),
    buttons: [
      DialogButton(
        child: Text(
          'Add Title', style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Poppins-Medium'
          ),), 
        onPressed: () async {
          setState(() {
          popup(context, isClicked);
          Navigator.pop(context);
          });
        },
        color: Color(0xFF354458),
      ),
    ],
    closeFunction: () =>null,
  ).show();
}
}











  

  
  












