import 'package:flutter/material.dart';
import 'package:i_we_game/models/user.dart';
import '../common/Net.dart';
import '../main.dart';
import 'package:provider/provider.dart';
import 'package:i_we_game/provider/UserModel.dart';



class LoginRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginRouteState();
  }
  
}

class _LoginRouteState extends State<LoginRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:Colors.black87,
      body: Container(
        child:  Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Image.asset("assets/imgs/start.png")
          ),
          Padding(
            padding: EdgeInsets.only(top: 150,left: 50,right: 50),
            child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                children: <Widget>[
                  FlatButton.icon(
                  
                    icon: Icon(Icons.access_time),
                    label: Text("QQ 登录",style: TextStyle(
                      fontSize: 13
                    ),),
                    color:Colors.yellowAccent, onPressed: () {
                        showLoading(context);
                        Net(context).mockLogin().then((user){
                            if(user!=null){
                              print(user.toJson());
                               Navigator.of(context).pop();
                               Provider.of<UserModel>(context, listen: false).user = user as User;
                              
                            }else{
                                Navigator.of(context).pop();
                              showToast(context,"挖梅花落异常！");
                            }
                        });
                    },
                  ),
                   FlatButton.icon(
                    icon: Icon(Icons.access_time),
                    label: Text("微信登录",style: TextStyle(
                      fontSize: 13
                    ),),
                    color:Colors.yellowAccent, onPressed: () {},
                  ),
                 
                ],
            ),
          ),
          Center(
            child: RawMaterialButton(
              child: Text("游客模式",style: TextStyle(
                color: Colors.grey
              ),),
              onPressed: () {},
            ),
          )
        ],
       ), 
      )
    );
  }

}