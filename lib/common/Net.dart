
import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/index.dart';
import 'Global.dart';

class Net{

  BuildContext context;
  Options _options;

  Net([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static Dio dio=new Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com/',
      headers: {
        HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
            "application/vnd.github.symmetra-preview+json",
      }
    )
  );
  static void init(){
    //添加缓存插件
     dio.interceptors.add(Global.netCache);
     // 设置用户token（可能为null，代表未登录）
     dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

     // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
     if(!Global.isRelease){
//       (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate=
//       (client){
//         client.findProxy = (uri) {
//           return "PROXY 10.1.10.250:8888";
//         };
//         //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
//         client.badCertificateCallback=(X509Certificate cert, String host, int port) => true;
//       };
     }
  }
Future<User> mockLogin() async {
  var req=await Future.delayed(Duration(seconds: 2), () => '{"login":"1231212as","name": "John Smith", "email": "john@example.com"}');
  Map<String, dynamic> user = convert.jsonDecode(req);
  return User.fromJson(user);
}
  // Future<User> login(String userName,String pwd) async{
  //   String basic="Basic "+base64.encode(utf8.encode('$userName:$pwd'));
  //   var req=await dio.get(
  //     "/users/$userName",
  //     options: _options.merge(
  //       headers: {
  //         "Authorization": basic
  //       },
  //       extra: {
  //         "noCache":true //此接口不缓存
  //       }
  //     )
  //   );
  //   //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
  //   dio.options.headers[HttpHeaders.authorizationHeader] = basic;
  //   //清空所有缓存
  //   Global.netCache.cache.clear();
  //   //更新profile中的token信息
  //   Global.profile.token = basic;
  //   print(basic);
  //   print(req.data);
  //   return User.fromJson(req.data);
  // }

  //获取用户项目列表
  // Future<List<Repo>> getRepos(
  //     {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
  //       refresh = false}) async {
  //   if (refresh) {
  //     // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
  //     _options.extra.addAll({"refresh": true, "list": true});
  //   }
  //   var r = await dio.get<List>(
  //     "user/repos",
  //     queryParameters: queryParameters,
  //     options: _options,
  //   );
  //   return r.data.map((e) => Repo.fromJson(e)).toList();
  // }
}