import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("不明飛行"),
        backgroundColor: Colors.white,
        foregroundColor: gateAccentColor,
        elevation: 0.4, //默认是4， 设置成0 就是没有阴影了
      ),
      body: const Center(
        child: Text('User'),
      ),
    );
  }
}
