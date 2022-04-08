import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';

class UserSettingsRow extends StatelessWidget {
  String content = "加载中..";

  UserSettingsRow(String cont) {
    content = cont;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: const Alignment(-1,0),
        // height: 55,
        child: ListTile(
          title: Text(content),
          leading: Icon(Icons.settings_outlined),
          dense: true,
        ),
      ),
    );
  }
}
