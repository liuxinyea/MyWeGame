import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i_we_game/provider/LocaleModel.dart';
import 'package:i_we_game/provider/ThemeModel.dart';
import 'package:i_we_game/provider/UserModel.dart';
import 'package:i_we_game/routers/HomeRoute.dart';
import 'package:i_we_game/routers/LoginRoute.dart';
import 'package:provider/provider.dart';

import 'common/Global.dart';
import 'i10n/localization_intl.dart';

Widget gmAvatar(String url, {
  double width = 30,
  double height,
  BoxFit fit,
  BorderRadius borderRadius,
}) {
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child:Image.network(
      url,
      width:width,
      height:height,
    ),
  );
}

Future<void> showToast(BuildContext context,String text) async {
//获取OverlayState
  OverlayState overlayState = Overlay.of(context);
  //创建OverlayEntry
  OverlayEntry _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Container(
        child: Center(
          child: Container(
            color: Colors.black12,
            constraints:BoxConstraints(
                maxHeight: 30.0,
                maxWidth: 150.0
            ),
            child:Center(
              widthFactor:150 ,
              child: Text(text,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                  ),
              )
          )
        ),
      )
      )
  );
  //显示到屏幕上。
  overlayState.insert(_overlayEntry);
  //等待2秒
  await Future.delayed(Duration(seconds: 2));
  //移除
  _overlayEntry.remove();
}

void showLoading(BuildContext context){
  showDialog(context: context,
     barrierDismissible: false,
     builder: (context){
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 200,
            child: AlertDialog(
              backgroundColor: Colors.grey,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text("加载中..."),
                  )
                ],
              ),
            ),
          ),
        );
     }
  );
}

void main() {
   WidgetsFlutterBinding.ensureInitialized();
    Global.init().then((e){
       runApp(MyApp());
    });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <SingleChildCloneableWidget>[
          ChangeNotifierProvider.value(value: ThemeModel()),
          ChangeNotifierProvider.value(value: UserModel()),
          ChangeNotifierProvider.value(value: LocaleModel()),
        ],
        child:Consumer2<ThemeModel, LocaleModel>(
          builder: (context, themeModel, localeModel, child){
              UserModel userModel = Provider.of<UserModel>(context);
              // userModel.user=null;
              // print(userModel.user==null);
              return MaterialApp(
                 theme: ThemeData(
                   primaryColor: themeModel.theme
                 ),
                 onGenerateTitle: (context){
                    return DemoLocalizations.of(context).title;
                 },
                 title: "WeGame",
                 locale:localeModel.getLocale(),
                 localizationsDelegates: [
                  // 本地化的代理类
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  DemoLocalizationsDelegate()
                ],
                localeResolutionCallback:(Locale _locale, Iterable<Locale> supportedLocales) {
                  if (localeModel.getLocale() != null) {
                    //如果已经选定语言，则不跟随系统
                    return localeModel.getLocale();
                  } else {
                    Locale locale;
                    //APP语言跟随系统语言，如果系统语言不是中文简体或美国英语，
                    //则默认使用美国英语
                    if (supportedLocales.contains(_locale)) {
                      locale= _locale;
                    } else {
                      locale= Locale('en', 'EN');
                    }
                    return locale;
                  }
                 },
                supportedLocales: [
                  const Locale('en', 'EN'), // 美国英语
                  const Locale('zh', 'CN'), // 中文简体
                  //其它Locales
                ],
                home: userModel.isLogin?HomeRoute():LoginRoute(), //应用主页
                routes: <String, WidgetBuilder>{
                  "login": (context) => LoginRoute(),
                  "home": (context) => HomeRoute(),
    //              "themes": (context) => ThemeChangeRoute(),
    //              "language": (context) => LanguageRoute(),
                },
              );
          },
        ),
    );
  }
}