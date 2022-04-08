import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/user_screen/user_profile_card.dart';
import 'package:gatelligence/pages/user_screen/user_settings_group.dart';

class UserScreenSilverBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if(index==0) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 32.0,bottom: 16.0),
                        child: UserProfileCard("user"),
                    );
                  }
                  // if(index==1){
                  //   return Padding(
                  //     padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                  //     child: HomeTitle("知识森林"),
                  //   );
                  // }
                  return UserSettingsGroup(index);
                },
                childCount: 6
              ),
            );
  }
}
