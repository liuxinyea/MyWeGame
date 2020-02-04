
import 'package:flutter/material.dart';

class RecommentPageRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RecommentPageRouteState();
  }


}

class _RecommentPageRouteState extends State<RecommentPageRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("推荐"),
        ),
    );
  }

}