import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("主页"),
        backgroundColor: Colors.white,
        foregroundColor: gateAccentColor,
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
