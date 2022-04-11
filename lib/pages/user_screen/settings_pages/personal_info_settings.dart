import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gatelligence/entity/fetchUserInfoResponse.dart';
import 'package:gatelligence/utils/localStorage.dart';
import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/user_screen/user_settings_group.dart';
// import 'package:gatelligence/utils/systemColorSettings.dart';


class PersonalInfoSettings extends StatefulWidget {

  final userScreenRefreshFunc;

  PersonalInfoSettings(this.userScreenRefreshFunc);

  _PersonalInfoSettingsState createState() => _PersonalInfoSettingsState();
}

class _PersonalInfoSettingsState extends State<PersonalInfoSettings> {

  FetchUserInfoResponse _userInfo=FetchUserInfoResponse();

  Column getSettingsColumn(context){

    var nickName = _userInfo.nickName;
    var gender = _userInfo.gender;

     return Column(
      children: <Widget>[
        ListTile(
          title: Text('昵称'),
          subtitle: Text(nickName==null?'设置昵称':nickName),
          leading: Icon(Icons.person_outline_outlined),
          trailing: Icon(Icons.keyboard_arrow_right),
          enabled: true,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PersonalInfoSettings(1),
            //   ),
            // );
          },
        ),
        Divider(
          height: 0.0,
          indent: 0.0,
          color: Color.fromARGB(255, 161, 174, 233),
        ),
        ListTile(
          title: Text('性别'),
          subtitle: Text(gender == null ? '设置昵称' : gender),
          leading: Icon(Icons.beach_access_outlined),
          trailing: Icon(Icons.keyboard_arrow_right),
          enabled: true,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PersonalInfoSettings(1),
            //   ),
            // );
          },
        ),
     
        
      ],
    );
  }

  void loadFromCache() async{
    LocalStorage.getString('lastFip').then((value){
      try{
        setState(() {
           _userInfo = FetchUserInfoResponse.fromJson(jsonDecode(value));
        });
       
        // print(_userInfo.toJson().toString());
      }catch(e){
        setState(() {
           _userInfo = FetchUserInfoResponse();
        });
        // print(_userInfo.toJson());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loadFromCache();
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
                  UserSettingsGroup.fromCustomized("信息设置",getSettingsColumn(context),
                    widget.userScreenRefreshFunc
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
