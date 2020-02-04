// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  static m0(howMany) => "${Intl.plural(howMany, zero: '没有未读邮件', one: '有${howMany}封未读邮件', other: '有${howMany}封未读邮件')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "cancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "home" : MessageLookupByLibrary.simpleMessage("首页"),
    "language" : MessageLookupByLibrary.simpleMessage("语言"),
    "login" : MessageLookupByLibrary.simpleMessage("登录"),
    "logout" : MessageLookupByLibrary.simpleMessage("退出登录"),
    "logoutTip" : MessageLookupByLibrary.simpleMessage("确定退出登陆吗？"),
    "noDescription" : MessageLookupByLibrary.simpleMessage("数据为空"),
    "remainingEmailsMessage" : m0,
    "theme" : MessageLookupByLibrary.simpleMessage("主题"),
    "userName" : MessageLookupByLibrary.simpleMessage("用户名"),
    "userNameOrEmail" : MessageLookupByLibrary.simpleMessage("用户名或者邮箱"),
    "yes" : MessageLookupByLibrary.simpleMessage("确定")
  };
}
