import 'package:flutter/material.dart';
import 'package:gatelligence/pages/home_screen/home_title.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/home_screen/featured_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeFeaturedNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                AnimationConfiguration.staggeredList(
                    position: 1,
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 822),
                    child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child:  Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: HomeTitle("Gatelligence 讲堂"),)
                      ),
                    ),
                    ),

               Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 400),
                        duration: const Duration(milliseconds: 1214),
                          child: SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: HomeFeaturedCard("Gatelligence Dynamic Card"),
                            ),
                          ),
                      ); 
                    },
                    itemCount: 7,
                  ),
                ),
                
              ],
            ));
  }
}
