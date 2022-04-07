import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/widgets/gateRoot.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(gateAccentColor),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: GateAppRoot(),
      // home: BottomDragWidget(),
    );
  }
}
