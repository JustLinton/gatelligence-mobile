import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/utils/systemColorSettings.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gatelligence News'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: gateAccentColor,
        elevation: 0.5,
        shadowColor: gateAccentColor,
      ),
      body: Center(
        child: Text('Airplay'),
      ),
    );
  }
}
