import 'package:flutter/material.dart';
import 'package:i_we_game/common/Global.dart';

import 'ProfileChangeNotifier.dart';

class ThemeModel extends ProfileChangeNotifier {
  var _profile=Global.profile;
  ColorSwatch get theme=>Global.themes.firstWhere((e)=>e.value==_profile.theme,orElse: ()=>Colors.blue);
  //主题改变后，通知其依赖项，新主题会立即生效
  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500].value;
      notifyListeners();
    }
  }
}