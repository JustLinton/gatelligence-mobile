import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/utils/localStorage.dart';

import 'package:gatelligence/pages/user_screen/user_settings_title.dart';
import 'package:gatelligence/pages/user_screen/settings_pages/personal_info_settings.dart';
import 'package:gatelligence/pages/user_screen/settings_pages/debug_settings.dart';

import 'package:gatelligence/service/services.dart';

import 'package:gatelligence/utils/systemColorSettings.dart';

import 'package:gatelligence/utils/dialogs.dart';
import 'package:gatelligence/utils/welcomeAnimControl.dart';

class UserSettingsGroup extends StatefulWidget {
  int type = 1;
  
  bool customized=false;
  late Column customColumn;
  late String customTitle;

  var userScreenRefreshFunc;


  UserSettingsGroup(int t){
    type=t;
  }

  UserSettingsGroup.withUserScreenRefreshFunc(this.type,this.userScreenRefreshFunc);

  UserSettingsGroup.fromCustomized(this.customTitle,this.customColumn,this.userScreenRefreshFunc) {
    customized=true;
  }
  
  _UserSettingsGroupState createState() => _UserSettingsGroupState(type);
}

class _UserSettingsGroupState extends State<UserSettingsGroup> {

  int type = 1;
  bool _switchValue1=false;
  // Obtain shared preferences.
  // final prefs = SharedPreferences.getInstance();

  String _sayHelloResp="loading..";

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
                      child:  widget.customized? widget.customColumn: getColumn(type)
                    ),
                  ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                
              ],
            ));
  }



String getTitle(int type) {

    if(widget.customized){
      return widget.customTitle;
    }

    if (type == 1) {
      return "个人设置";
    }
    if (type == 2) {
      return "其他";
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
                    builder: (context) => PersonalInfoSettings(widget.userScreenRefreshFunc),
                  ),
                );
            },
          ),
          // Divider(
          //   height: 0.0,
          //   indent: 0.0,
          //   color: Color.fromARGB(255, 161, 174, 233),
          // ),
          // ListTile(
          //   title: Text('修改密码'),
          //   leading: Icon(Icons.key_outlined),
          //   trailing: Icon(Icons.keyboard_arrow_right),
          //   enabled: true,
          //   onTap: () {},
          // ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
            title: Text('安全设置'),
            leading: Icon(Icons.password_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: false,
            onTap: () {},
          ),
         
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
              title: Text('消息通知'),
              enabled:false,
              leading: Icon(Icons.message_outlined),
              trailing: Switch(
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Color.fromARGB(255, 231, 231, 231),
                  activeColor: gateAccentColor,
                  activeTrackColor: gateAccentLightColor,
                  value: _switchValue1,
                  onChanged: (value) {
                    setState(() {
                      // _switchValue1 = value;
                    });
                  })),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
            title: Text('退出登录'),
            leading: Icon(Icons.logout_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () {
              GateDialog.showFunctionAlert(context, '确认', '真的要退出登录吗', (){
                Service.logout();
                widget.userScreenRefreshFunc();
              });
            },
          ),
        ],
      );
    }
    if (type == 2) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('开发人员选项'),
            leading: Icon(Icons.code_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DebugSettings(1),
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
            title: Text('重新观看引导动画'),
            leading: Icon(Icons.restore_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: (){
              WelAnimCntl.activate();
            },
          ),   
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
            title: Text('关于'),
            leading: Icon(Icons.info_outline_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: (){
            }, ),
        ],
      );
    }
    else if (type == -1) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(_sayHelloResp),
            leading: Icon(Icons.code_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () {
               setState(() {
                _sayHelloResp = "进行连通性测试";
              });
              Service.sayHello().then((value){
                setState(() {
                  _sayHelloResp=value;
                });
              });
            },
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Color.fromARGB(255, 161, 174, 233),
          ),
          ListTile(
            title: Text('--'),
            leading: Icon(Icons.restore_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: true,
            onTap: () {
              GateDialog.showLoading(context);
            },
          ),
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