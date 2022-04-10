import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gatelligence/entity/userTaskList.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeNewsCardSkeleton extends StatefulWidget {

  HomeNewsCardSkeleton() {}
  @override
  _HomeNewsCardSkeletonState createState() => _HomeNewsCardSkeletonState();
}

class _HomeNewsCardSkeletonState extends State<HomeNewsCardSkeleton> {


  Card getCard(){
        return Card(
            shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
            color: Color.fromARGB(255, 237, 237, 237),
            elevation: 0.0,
            child:Shimmer(
                duration: const Duration(milliseconds: 6200), //Default value
                interval: const Duration(milliseconds: 0), //Default value: Duration(seconds: 0)
                color: Colors.white, //Default value
                colorOpacity: 0.5, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(),  //Default Value
                child: Container(
                  color: Colors.transparent,
                ),
            ),);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          
        },
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // overlayColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 4.0),
        child: getCard(),
      ),


    );
  }
}
