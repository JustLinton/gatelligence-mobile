import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/pages/user_screen/user_settings_group.dart';


class DebugSettings extends StatefulWidget {
  int type = 1;
  DebugSettings(int t) {
    type = t;
  }
  _DebugSettingsState createState() => _DebugSettingsState(type);
}

class _DebugSettingsState extends State<DebugSettings> {
  int type = 1;

  _DebugSettingsState(int t) {
    type = t;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('调试'),
        centerTitle: true,
        backgroundColor: gateAccentColor,
        foregroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: gateAccentColor,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_outlined),
        //   onPressed: (){
        //      Navigator.pop(context);
        //      utilsSetGatBlueSystemColor();
        // },),
      ),
      body: CustomScrollView(
    shrinkWrap: true,
    // 内容
    slivers: <Widget>[
        new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                    <Widget>[
                        UserSettingsGroup(-1),
                    ],
                ),
            ),
        ),
    ],),
    );
  }
}