import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';

class HomeNewsCard extends StatelessWidget {
  String content = "加载中..";

  HomeNewsCard(String cont) {
    content = cont;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: gateAccentLightColor,
      child: Container(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
        height: 90,
        child: Text(content),
      ),
    );
  }
}
