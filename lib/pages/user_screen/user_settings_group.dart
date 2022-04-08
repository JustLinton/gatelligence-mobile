import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/pages/user_screen/user_settings_title.dart';
import 'package:gatelligence/pages/user_screen/settings_pages/personal_info_settings.dart';

import 'package:gatelligence/utils/systemColorSettings.dart';

class UserSettingsGroup extends StatefulWidget {
  int type = 1;
  UserSettingsGroup(int t){
    type=t;
  }
  _UserSettingsGroupState createState() => _UserSettingsGroupState(type);
}

class _UserSettingsGroupState extends State<UserSettingsGroup> {

  int type = 1;
  bool _switchValue1=true;

  _UserSettingsGroupState(int t){
    type=t;
  }

  UserSettingsGroup(int t_) {
    type = t_;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            // width: 200,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                SettingsTitle(getTitle(type)),
                Padding(padding: EdgeInsets.only(bottom: 4)),
                Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Container(
                      // padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                      // height: 330,
                      width: MediaQuery.of(context).size.width,
                      // alignment: Alignment(-1,0),
                      child:  getColumn(type)
                    ),
                  ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                
              ],
            ));
  }



String getTitle(int type) {
    if (type == 1) {
      return "个人设置";
    } else {
      return "调试";
    }
  }

  Column getColumn(int type) {
    if (type == 1) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('个人信息'),
            leading: Icon(Icons.person_outline_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () {
                 Navigator.push(context,  MaterialPageRoute(
                    builder: (context) => PersonalInfoSettings(),
                  ),
                );
            },
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
            title: Text('修改密码'),
            leading: Icon(Icons.key_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
            title: Text('绑定邮箱'),
            leading: Icon(Icons.mail_outline_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
              title: Text('消息通知'),
              leading: Icon(Icons.message_outlined),
              trailing: Switch(
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Color.fromARGB(255, 231, 231, 231),
                  activeColor: gateAccentColor,
                  activeTrackColor: gateAccentLightColor,
                  value: _switchValue1,
                  onChanged: (value) {
                    setState(() {
                      _switchValue1 = value;
                    });
                  })),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('额外选项'),
            leading: Icon(Icons.settings_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () {},
          ),
        ],
      );
    }
  }


}

//  ListView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           // scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               title:Text("Gatelligence Dynamic Card"),
//                               leading: Icon(Icons.abc_outlined),
//                             );
//                           },
//                           itemCount: 3,