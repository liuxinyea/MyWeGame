
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/Global.dart';
import '../models/profile.dart';
import '../provider/UserModel.dart';


class UserPageRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserPageRouteState();
  }


}

class _UserPageRouteState extends State<UserPageRoute>{
  List list=[1,2,3,4,5,6,7];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Image(
             image:AssetImage("assets/imgs/qq.png"),
             height: 20,
             width: 20,
             ),
           Padding(
             padding: EdgeInsets.all(10.0),
             child: Text(userModel.user.name,
                 style: TextStyle(
                     color: Colors.black,
                     fontSize:15.0
                 )
             ),
           ),
        ],
        ),
        actions: <Widget>[
          GestureDetector(
            child:Icon(Icons.open_in_browser,color: Colors.black),
            onTap: ()=>{
              Provider.of<UserModel>(context).user=null
            },
          )
        ],
      ),
    );
  }

}