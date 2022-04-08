import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class UserProfileCard extends StatelessWidget {
  String content = "加载中..";

  UserProfileCard(String cont) {
    content = cont;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: gateAccentLightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Container(
          // padding: EdgeInsets.only(left: 30.0, right: 30.0),
          height: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 30)),
              CircularProfileAvatar(
                'https://linton-pics.oss-cn-beijing.aliyuncs.com/images/%E5%A4%B4%E5%83%8F.jpg', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                radius: 43, // sets radius, default 50.0
                backgroundColor: Colors
                    .transparent, // sets background color, default Colors.white
                borderWidth: 4.5, // sets border, default 0.0
                initialsText: Text(
                  "",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ), // sets initials text, set your own style, default Text('')
                borderColor:
                    Colors.white, // sets border color, default Colors.white
                elevation:
                    0.0, // sets elevation (shadow of the profile picture), default value is 0.0
                // foregroundColor: Colors.brown.withOpacity(0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                cacheImage:
                    true, // allow widget to cache image against provided url
                imageFit: BoxFit.cover,
                onTap: () {
                  print('adil');
                }, // sets on tap
                showInitialTextAbovePicture:
                    true, // setting it true will show initials text above profile picture, default false
              ),
              Padding(padding: EdgeInsets.only(left: 12)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
              Text(
                '不明飛行',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Container(
                width: 200,
                child: Text(
                '2705111998@qq.com',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
              
            ]),
            ],
          )),
    );
  }
}
