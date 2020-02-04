import 'package:flutter/material.dart';

class CustomerBottomAppBar extends StatefulWidget{
  
  final List labels;
  final List icons;
  final Function onTab; 
  Color selectColor;
  Color defaultColor;
  Color textColor;
  CustomerBottomAppBar({
    @required this.labels,
    @required this.onTab,
    this.selectColor=Colors.blue,
    this.textColor,
    this.defaultColor=Colors.grey,
    @required this.icons
  });  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerBottomAppBar();
  }


}

class _CustomerBottomAppBar extends State<CustomerBottomAppBar>{
  int _selectIndex=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Container(
       decoration:BoxDecoration(
           border:Border(
             top:BorderSide(
                color: Colors.grey[300],
                width: 2
             )
           )
       ),
       height:60,
       child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getItems(),
      ),
     );
  }
  
  List<Widget> getItems(){
      List<Widget> items=[];
      for (int i=0;i<widget.labels.length;i++) {
          var item= InkWell(
                child: Padding(
                   padding: EdgeInsets.only(left: 20,right: 20),
                   child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                          Icon(widget.icons[i],color:_selectIndex==i?widget.selectColor:widget.defaultColor,),
                          Text(widget.labels[i],style: TextStyle(color:getTextColor(i)))
                      ],
            
                    ),
                  ),
                  onTap: (){
                      setState(() {
                        _selectIndex=i;
                      });
                      widget.onTab(i);
                  },
               );
          
          items.add(item);
      }
      return items; 
  }
  Color getTextColor(int index){
      if(widget.textColor!=null){
        return widget.textColor;
      }
      return _selectIndex==index?widget.selectColor:widget.defaultColor;
  }
}