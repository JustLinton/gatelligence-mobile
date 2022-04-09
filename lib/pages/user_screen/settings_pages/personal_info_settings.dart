import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/user_screen/user_settings_group.dart';
// import 'package:gatelligence/utils/systemColorSettings.dart';

class PersonalInfoSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
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
                  UserSettingsGroup(1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
