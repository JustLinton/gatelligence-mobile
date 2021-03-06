import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gatelligence/utils/localStorage.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/pages/user_screen/silver_builder.dart';
import 'package:gatelligence/pages/user_screen/skeleton_silver_builder.dart';

import '../utils/dialogs.dart';




class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key) {}
  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {

  String _avatarLink = "";
  String _nickName = "";
  String _email = "";

  bool _refreshBool=false;
  bool _dataOkay =false;
  bool _loggedIn = false;

  refresh(){
    //重新渲染整个页面，但是不请求数据
    setState(() {
      _refreshBool=true;
    });

    Future.delayed(const Duration(milliseconds: 1000),(){
      setState(() {
        _refreshBool=false;
      });
    });
  }

  void fetchInfo() async {
    Service.fetchUserInfo().then((value) async{
      var success = value.isSuccess;
      var errMsg = value.errorMsg;
      var avatarLink=value.avatar;
      var nickName=value.nickName;
      var email=value.email;
      var gender=value.gender;
      if (success != null && errMsg != null) {
        _dataOkay=true;
        if (success && avatarLink!=null&& nickName!=null&&
          email!=null) {
          setState(() {
            _avatarLink=avatarLink;
            _email=email;
            _nickName=nickName;
            _loggedIn=true;
          });
          await LocalStorage.setString('lastFip', json.encode(value.toJson()).toString());
        } else {
          if (errMsg == "501") {
            setState(() {
              _avatarLink = "";
              _email = "点击登录凝智云";
              _nickName = "未登录 >";
              _loggedIn=false;
            });
            await LocalStorage.remove('lastFip');
          }
        }
      } else {
        await LocalStorage.remove('lastFip');
        _dataOkay=false;
        GateDialog.showAlert(context, "错误", "获取个人信息信息错误");
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    fetchInfo();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("主页"),
      //   backgroundColor: Colors.white,
      //   foregroundColor: gateAccentColor,
      // ),
      // appBar: AppBar(
      //   title: const Text("Gatelligence"),
      //   backgroundColor: Colors.white,
      //   foregroundColor: gateAccentColor,
      //   elevation: 0.4, //默认是4， 设置成0 就是没有阴影了
      // ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading:  Icon(Icons.settings_outlined),
              // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: gateAccentColor,
              elevation:0.5,
              foregroundColor: Colors.white,

              /// This is the part you use this package
              flexibleSpace: CustomizableSpaceBar(
                builder: (context, scrollingRate) {
                  /// Example content
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: 13, left: 12 + 40 * scrollingRate),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        " 设置",
                        style: TextStyle(
                            fontSize: 42 - 18 * scrollingRate,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),
                      ),
                    ),
                  );
                },
              ),

              /// End of the part

              expandedHeight: 150,
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0,bottom: 48.0),
              sliver: _refreshBool?UserScreenSkeletonSilverBuilder():UserScreenSilverBuilder(
                  refresh,_nickName,_email,_avatarLink,_dataOkay, _loggedIn),
            ),
          ],
        ),
      ),
    );
  }
}
