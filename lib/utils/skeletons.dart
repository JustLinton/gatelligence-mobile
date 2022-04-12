import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GateSkeletons{
  static Card getCardSkeleton(double width,double height){
    return Card(
            color: Color.fromARGB(255, 241, 241, 241),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),child: Container(
                            // padding: EdgeInsets.only(left: 30.0, right: 30.0),
            height: height,
            width: width,
            child: Shimmer(
              duration: const Duration(milliseconds: 1000), //Default value
              interval: const Duration(milliseconds: 0), //Default value: Duration(seconds: 0)
              color: Color.fromARGB(255, 249, 249, 249), //Default value
              colorOpacity: 0.3, //Default value
              enabled: true, //Default value
              direction: ShimmerDirection.fromLTRB(),  //Default Value
              child: Container(
                color: Colors.transparent,
              ),
        )));
  }
}