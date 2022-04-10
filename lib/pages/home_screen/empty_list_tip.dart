import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gatelligence/entity/userTaskList.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class EmptyListTip extends StatefulWidget {
  int type=0;
  EmptyListTip(int type_) {
    type=type_;
  }
  @override
  _EmptyListTipState createState() => _EmptyListTipState();
}

class _EmptyListTipState extends State<EmptyListTip> {


  Column getContent(int type){
    if(type==1){
      return Column(children: [
              Text('data'),
            ],);
    }
    return Column(
      children: [
        Text('发生错误'),
      ],
    );
  }

  Card getCard(){
        return Card(
            shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
            color: Color.fromARGB(255, 237, 237, 237),
            elevation: 0.0,
            child:getContent(widget.type),
            );
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
        height: 200,
        padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 4.0),
        child: getCard(),
      ),


    );
  }
}
