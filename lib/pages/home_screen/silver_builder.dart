import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/home_screen/featured_news.dart';
import 'package:gatelligence/pages/home_screen/home_title.dart';
import 'package:gatelligence/pages/home_screen/news_card.dart';
import 'package:gatelligence/pages/home_screen/news_card_skeleton.dart';
import 'package:gatelligence/pages/home_screen/empty_list_tip.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gatelligence/entity/userTaskList.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';

class HomeScreenSilverBuilder extends StatefulWidget {
  List<TaskList> _taskList = [];
  bool _firstTimeLoading=true;
  bool _notlogged=false;
  HomeScreenSilverBuilder(List<TaskList>  t,bool firstTimeLoading_,bool notlogged_, {Key? key}) : super(key: key) {
    _taskList = t;
    _firstTimeLoading=firstTimeLoading_;
    _notlogged=notlogged_;
  }
  @override
  _HomeScreenSilverBuilderState createState() => _HomeScreenSilverBuilderState();
}

class _HomeScreenSilverBuilderState extends State<HomeScreenSilverBuilder> {

  @override
  Widget build(BuildContext context) {

    return   SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {  
                  if(index==0) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 32.0,bottom: 16.0),
                        child: HomeFeaturedNews(),
                    );
                  }
                  if(index==1){
                    return Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                      child: HomeTitle("知识森林"),
                    );
                  }
                  // return HomeNewsCard("Gatelligence Dynamic News Line", 0.73,index==2?true:false);
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 212),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget._firstTimeLoading?
                        HomeNewsCardSkeleton()
                        :widget._notlogged?
                        EmptyListTip(0)
                        :widget._taskList.isEmpty? 
                        EmptyListTip(1) :HomeNewsCard(widget._taskList[index-2]),
                      ),
                    ),
                  );
                },
                childCount: widget._firstTimeLoading? 9 :widget._notlogged||widget._taskList.isEmpty? 3 : widget._taskList.length+2
              ),
            );
  }
}
