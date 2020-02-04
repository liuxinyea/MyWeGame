import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class DemoLocalizations {

  static Future<DemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new DemoLocalizations();
    });
    remainingEmailsMessage(int howMany) => Intl.plural(howMany,
        zero: 'There are no emails left',
        one: 'There is $howMany email left',
        other: 'There are $howMany emails left',
        name: "remainingEmailsMessage",
        args: [howMany],
        desc: "How many emails remain after archiving.",
        examples: const {'howMany': 42, 'userName': 'Fred'});
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }
  String get title  {
    return Intl.message(
      'home',
      name: 'title',
      desc: 'title',
    );
  }
  String get logout  {
    return Intl.message(
      'logout',
      name: 'logout',
      desc: 'logout',
    );
  }

  String get logoutTip  {
    return Intl.message(
      '确定退出登陆吗？',
      name: 'logoutTip',
      desc: 'logoutTip',
    );
  }

  String get cancel  {
    return Intl.message(
      '取消',
      name: 'cancel',
      desc: 'cancel',
    );
  }

  String get yes  {
    return Intl.message(
      '确定',
      name: 'yes',
      desc: 'yes',
    );
  }

  String get userNameOrEmail{
    return Intl.message(
      '用户名或者邮箱',
      name: 'userNameOrEmail',
      desc: 'userNameOrEmail',
    );
  }
  String get userName {
    return Intl.message(
      '用户名',
      name: 'userName',
      desc: 'userName',
    );
  }
  String get home {
    return Intl.message(
      '首页',
      name: 'home',
      desc: 'home',
    );
  }
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: 'login',
    );
  }
  String get noDescription {
    return Intl.message(
      '数据为空',
      name: 'noDescription',
      desc: 'noDescription',
    );
  }
  String get theme{
    return Intl.message(
      '主题',
      name: 'theme',
      desc: 'theme',
    );
  }

  String get language{
    return Intl.message(
      '语言',
      name: 'language',
      desc: 'language',
    );
  }

}

//Locale代理类
class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    //3
    return  DemoLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}