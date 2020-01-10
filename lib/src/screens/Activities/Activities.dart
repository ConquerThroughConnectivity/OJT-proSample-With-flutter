
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testing/src/screens/Activities/activities_list.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final GlobalKey<AnimatedListState> listKey = GlobalKey();
final df = new DateFormat('MM-dd-yyyy');
final String now =df.format(DateTime.now());


final description = [
    new ActivityDescription(
      description: 'Hooray for the first objective',
      date: now.toString(),
    ),
    new ActivityDescription(
      description: 'Hooray for the second objective',
      date: now.toString(),
    ),
    new ActivityDescription(
      description: 'Hooray for the third objective',
      date: now.toString(),
    ),
    new ActivityDescription(
      description: 'Hooray for the fourth objective',
      date: now.toString(),
    ),
  ];

  final title =[
    new ActivityTitle(
      title: "OJT-PRO $now",
    ),
    new ActivityTitle(
      title: "Software Debugging $now",
    ),
    new ActivityTitle(
      title: "Creating HTML TO PDF $now",
    ),
    new ActivityTitle(
      title: "Planning the show $now",
    ),
  ];






class Activity extends StatefulWidget {
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
              physics: BouncingScrollPhysics(),
              key: listKey,
              initialItemCount: description.length,
              itemBuilder: (BuildContext context, int index, Animation animation){
              return SizeTransition(
              axis: Axis.vertical,
              sizeFactor: animation,
              child: Card(
                  color: Color(0xFFECDFBD),
                  child: ExpansionTile(
                  initiallyExpanded: false,
                  children: <Widget>[ 
                    Card(
                    color: Color(0xFFFF4C65),
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.10,
                        child: ListTile(
                        title: Text('${description[index].description}',style: TextStyle(
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
                  ),
                  ],
                  
                  trailing: Icon(Icons.arrow_drop_down, color: Color(0xFF354458),),
                  title: Text('${title[index].title}',style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
              setState(() {
               
              });
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
              )
            ),
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}












  

  
  












