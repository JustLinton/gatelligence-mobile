import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gatelligence/entity/userTaskList.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/utils/dialogs.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';

import 'package:gatelligence/pages/home_screen/silver_builder.dart';
import 'package:http/http.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:gatelligence/service/cache.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  int type = 1;
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskList> _taskList = [];
  int maxPageNow = 1;
  bool _firstTimeLoading = true;
  bool _notlogged = false;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    maxPageNow = 1;
    Service.fetchUserTaskList(maxPageNow).then((value) {
      var success = value.isSuccess;
      var errMsg = value.errorMsg;
      var taskList = value.taskList;
      if (success != null && errMsg != null && taskList != null) {
        if (success) {
          setState(() {
            _taskList = taskList;
          });
        } else {
          if (errMsg == "501") {
            GateDialog.showAlert(context, "错误", "未登录");
            setState(() {
              _notlogged = true;
            });
          }
        }
      } else {
        GateDialog.showAlert(context, "错误", "未知错误");
      }
      _refreshController.refreshCompleted();
    });
  }

  void _onLoading() async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    if (mounted) {
      maxPageNow += 1;
      Service.fetchUserTaskList(maxPageNow).then((value) {
        var success = value.isSuccess;
        var errMsg = value.errorMsg;
        var taskList = value.taskList;
        if (success != null && errMsg != null && taskList != null) {
          if (success) {
            setState(() {
              for (var val in taskList) {
                _taskList.add(val);
              }
            });
          } else {
            if (errMsg == "501") {
              GateDialog.showAlert(context, "错误", "未登录");
              setState(() {
                _notlogged = true;
              });
            }
          }
        } else {
          GateDialog.showAlert(context, "错误", "未知错误");
        }
        _refreshController.loadComplete();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_firstTimeLoading) {
      Service.fetchUserTaskList(maxPageNow).then((value) {
        var success = value.isSuccess;
        var errMsg = value.errorMsg;
        var taskList = value.taskList;
        bool notlogged=false;
        if (success != null && errMsg != null && taskList != null) {
          if (success) {
              setState(() {
                _taskList = taskList;
              });
          } else {
            if (errMsg == "501") {
              GateDialog.showAlert(context, "错误", "未登录");
              // setState(() {
              //   _notlogged = true;
              // });
               notlogged = true;
            }
          }
        } else {
          GateDialog.showAlert(context, "错误", "未知错误");
        }
        if (_firstTimeLoading) {
          setState(() {
             _firstTimeLoading = false;
             _notlogged=notlogged;
          });
        }
        // _refreshController.refreshCompleted();
      });
    }

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
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: ClassicHeader(
            outerBuilder: (child) {
              return Container(
                  // color: Colors.white,
                  height: 30,
                  padding: EdgeInsets.only(top: 15),
                  child: child);
            },
            refreshingText: "正在刷新",
            releaseText: "松手!",
            completeText: "刷新成功",
            failedText: "刷新失败",
            idleText: "下拉以刷新",
          ),
          footer: ClassicFooter(
            outerBuilder: (child) {
              return Container(
                  // color: Colors.white,
                  height: 40,
                  // padding: EdgeInsets.only(bottom: 30),
                  child: child);
            },
            failedText: "加载失败",
            idleText: "上滑查看更多",
            noDataText: "没有更多了",
            loadingText: "正在加载",
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                // leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp),onPressed: (){},),
                // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundColor: Colors.white,
                elevation: 0.5,
                foregroundColor: gateIconColor,
                shadowColor: gateAccentColor,

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
                          "#凝智而成林.",
                          style: TextStyle(
                            fontSize: 42 - 18 * scrollingRate,
                            fontWeight: FontWeight.bold,
                            color: gateAccentColot_nm,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                /// End of the part

                expandedHeight: 150,
              ),AnimationLimiter( child:
              SliverPadding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 48.0),
                sliver: HomeScreenSilverBuilder(
                    _taskList, _firstTimeLoading, _notlogged),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
