import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户'),
        backgroundColor: Colors.white,
        foregroundColor: gateAccentColor,
      ),
      body: const Center(
        child: Text('User'),
      ),
    );
  }
}
