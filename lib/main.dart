import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/widgets/gateRoot.dart';
import 'package:http/http.dart' as http;

import 'dart:io'; //提供Platform接口
import 'package:flutter/services.dart'; //提供SystemUiOverlayStyle

import 'package:gatelligence/pages/introduction_animation/introduction_animation_screen.dart';

import 'package:gatelligence/utils/systemColorSettings.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  //在原生的基础上，继续显示定义好的app加载页
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());

  utilsSetWhiteSystemColor();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //停止显示app启动加载页
    Future.delayed(Duration(milliseconds: 600), () {
        FlutterNativeSplash.remove();
      // print('延时1s执行');
    });

    return MaterialApp(
      title: 'Gatelligence',
      theme: ThemeData(
        primarySwatch: createMaterialColor(gateAccentColor),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: GateAppRoot(),
      // home: const IntroductionAnimationScreen(),
      // home: GateMainL(),
    );
  }
}
