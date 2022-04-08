import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/home_screen/featured_card.dart';

class HomeTitle extends StatelessWidget {

  String title="新闻";

  HomeTitle(String t_){
    title=t_;
  }

  @override
  Widget build(BuildContext context) {
     return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0,),
                      child: Text(
                        title,
                        style: const TextStyle(
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
                      padding: EdgeInsets.only(left: 16.0),
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
                
              ],
            ));
  }
}
