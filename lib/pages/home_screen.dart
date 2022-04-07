import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("主页"),
      //   backgroundColor: Colors.white,
      //   foregroundColor: gateAccentColor,
      // ),
      appBar: AppBar(
        title: const Text("Gatelligence"),
        backgroundColor: Colors.white,
        foregroundColor: gateAccentColor,
        elevation: 0.4, //默认是4， 设置成0 就是没有阴影了
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text('data'),
          ],
        )
      ),
    );
  }
}
