import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/home_screen/featured_card.dart';

class HomeFeaturedNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.0,),
                      child: Text(
                        '小贴士',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16.0,bottom: 16.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: gateAccentColor,
                                width: 1.3)),
                      ),
                    ),
                  ],
                ),

               Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeFeaturedCard("Gatelligence Dynamic Card");
                    },
                    itemCount: 60,
                  ),
                ),
                
              ],
            ));
  }
}
