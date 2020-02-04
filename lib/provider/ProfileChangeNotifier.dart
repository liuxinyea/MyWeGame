import 'package:flutter/material.dart';

import '../common/Global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  // Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}