import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/user_screen/user_profile_card.dart';
import 'package:gatelligence/pages/user_screen/user_settings_group.dart';

class UserScreenSilverBuilder extends StatefulWidget {
  String nickName = "加载中...";
  String email = "";
  String avatarLink = "";

  final userScreenRefreshFunc;

  UserScreenSilverBuilder(this.userScreenRefreshFunc,this.nickName,this.email,this.avatarLink);

  // UserScreenSilverBuilder(String nickName_, String email_, String avatarLink_) {
  //   nickName = nickName_;
  //   email = email_;
  //   avatarLink = avatarLink_;
  // }
 
  @override
  _UserScreenSilverBuilderState createState() => _UserScreenSilverBuilderState();
}

class _UserScreenSilverBuilderState extends State<UserScreenSilverBuilder> {

  // List<int> settingsGroupEntry=[0,1,2,-1,-1,-1,-1,-1];

  @override
  Widget build(BuildContext context) {
    return  SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if(index==0) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 32.0,bottom: 16.0),
                        child: UserProfileCard(widget.nickName,widget.email,widget.avatarLink),
                    );
                  }
                  // if(index==1){
                  //   return Padding(
                  //     padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                  //     child: HomeTitle("知识森林"),
                  //   );
                  // }
                  return UserSettingsGroup.withUserScreenRefreshFunc(index, widget.userScreenRefreshFunc);
                },
                childCount: 3
              ),
            );
  }
}
