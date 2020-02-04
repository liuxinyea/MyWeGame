
import 'package:flutter/material.dart';
import 'package:i_we_game/provider/UserModel.dart';
import 'package:i_we_game/widgets/BottomAppBar.dart';
import 'package:provider/provider.dart';
import './RecommentPageRoute.dart';
import './UserPageRoute.dart';
import '../widgets/SliderTransitonXY.dart';

class HomeRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeRoute();
  }

}
class _HomeRoute extends State<HomeRoute> with SingleTickerProviderStateMixin{
  var _selectedIndex=0;
  var _lastIndex=0;
  Widget _content;
  TabController _tabController; //需要定义一个Controller   
  List _icons=[Icons.bookmark,Icons.videocam,Icons.games,Icons.account_circle];
  List _labels=["推荐","直播","游戏","我的",];
  RecommentPageRoute _recommentPageRoute;
  UserPageRoute _userPageRoute;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length:4, vsync: this);
    
  } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserModel userModel=Provider.of<UserModel>(context);
    String name="liuxinye";
    return Scaffold(
      body:AnimatedSwitcher(
        duration:const Duration(milliseconds: 400),
        child:getPage(),
        transitionBuilder: (child,animation){
            // var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))

            return SlideTransitionXY(
              child: child,
              direction:_lastIndex>_selectedIndex?AxisDirection.right:AxisDirection.left, //上入下出
              position: animation,
              );
        },
      ),
  
      bottomNavigationBar:
      BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items:getItems(),
        onTap: _onItemTapped, 
      )
    //  CustomerBottomAppBar(
    //       // textColor:Colors.grey[600],
    //       icons:_icons,
    //       labels:_labels,
    //       onTab:_onItemTapped,
    //   )
    );
  }
  
  Widget getPage(){
    Text t;
    if(_selectedIndex==0){
       return _recommentPageRoute==null?RecommentPageRoute():_recommentPageRoute;
    }else if(_selectedIndex==1){
       t= Text("直播");
        return Center(
        key: ValueKey<int>(_selectedIndex),
        child: t,
      );
    }else if(_selectedIndex==2){
        t= Text("游戏");
         return Center(
        key: ValueKey<int>(_selectedIndex),
        child: t,
      );
    }else{
       return _userPageRoute==null?UserPageRoute():_userPageRoute;
    }
  }
  List getItems(){
    List<BottomNavigationBarItem> items=[];
    for(int i=0;i<_labels.length;i++){
       items.add(BottomNavigationBarItem(
         icon: Icon(_icons[i]),
         title: Text(_labels[i])
       ));
    }
    return items;
  }
  void _onItemTapped(int index){
      setState(() {
          _lastIndex=_selectedIndex;
          _selectedIndex=index;
      });
  }
}