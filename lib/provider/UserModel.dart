
import 'package:i_we_game/common/Global.dart';
import 'package:i_we_game/models/profile.dart';
import 'package:i_we_game/models/user.dart';

import 'ProfileChangeNotifier.dart';

class UserModel extends ProfileChangeNotifier{
  Profile get _profile => Global.profile;
  User get user => _profile.user;

  bool get isLogin=>user!=null;
  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User user){
     if(user?.login!=_profile.user?.login){
        _profile.user = user;
        notifyListeners();
     }
  }

}
