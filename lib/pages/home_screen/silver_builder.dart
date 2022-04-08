import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/home_screen/featured_news.dart';
import 'package:gatelligence/pages/home_screen/home_title.dart';
import 'package:gatelligence/pages/home_screen/news_card.dart';

class HomeScreenSilverBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SliverList(
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
                  return HomeNewsCard("Gatelligence Dynamic News Line",index);
                },
                childCount: 10
              ),
            );
  }
}
