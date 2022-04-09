import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';

import 'package:gatelligence/pages/home_screen/silver_builder.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';


class HomeScreen extends StatefulWidget {
  int type = 1;
  HomeScreen({Key? key}) : super(key: key);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length+1).toString());
    if(mounted)
    setState(() {

    });
    _refreshController.loadComplete();
  }


  @override
  Widget build(BuildContext context) {
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
          outerBuilder:(child){
            return Container(
                // color: Colors.white,
                height: 30,
                padding: EdgeInsets.only(top: 15),
                child:child
            );
          },
          refreshingText:"正在刷新",
          releaseText:"松手!",
          completeText:"刷新成功",
          failedText:"刷新失败",
          idleText:"下拉以刷新",
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
            noDataText:"没有更多了",
            loadingText:"正在加载",
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
              elevation:0.5,
              foregroundColor: gateIconColor,
              shadowColor:gateAccentColor,

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
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0,bottom: 48.0),
              sliver:  HomeScreenSilverBuilder(),
            ),
          ],
        ),
      ),),
    );
  }
}
