import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/user_screen/user_profile_card.dart';
import 'package:gatelligence/pages/user_screen/user_settings_group.dart';
import 'package:gatelligence/utils/skeletons.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserScreenSkeletonSilverBuilder extends StatefulWidget {
 
  UserScreenSkeletonSilverBuilder();

  // UserScreenSkeletonSilverBuilder(String nickName_, String email_, String avatarLink_) {
  //   nickName = nickName_;
  //   email = email_;
  //   avatarLink = avatarLink_;
  // }
 
  @override
  _UserScreenSkeletonSilverBuilderState createState() => _UserScreenSkeletonSilverBuilderState();
}

class _UserScreenSkeletonSilverBuilderState extends State<UserScreenSkeletonSilverBuilder> {

  // List<int> settingsGroupEntry=[0,1,2,-1,-1,-1,-1,-1];

  @override
  Widget build(BuildContext context) {
    return  SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if(index==0) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 32.0,bottom: 16.0),
                        child:  GateSkeletons.getCardSkeleton(double.infinity, 130));  
                    }
                  // if(index==1){
                  //   return Padding(
                  //     padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                  //     child: HomeTitle("知识森林"),
                  //   );
                  // }
                  if(index==1||index==2){
                    return Padding(
                        padding: const EdgeInsets.only(top: 0.0,bottom: 16.0),
                        child:  GateSkeletons.getCardSkeleton(double.infinity, 260));  
                    }
                  
                  return const Text('');
                },
                childCount: 3
              ),
            );
  }
}
