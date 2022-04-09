import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class HomeNewsCard extends StatefulWidget {
  String content = "加载中..";
  double progress = 1;
  bool loading=false;

  HomeNewsCard(String cont, double prg,bool lod) {
    content = cont;
    progress = prg;
    loading=lod;
  }
  @override
  _HomeNewsCardState createState() => _HomeNewsCardState(content,progress,loading);
}

class _HomeNewsCardState extends State<HomeNewsCard> {
  String content = "加载中..";
  double progress=1;
  bool loading=false;

  _HomeNewsCardState(String cont,double ind,bool lod) {
    content = cont;
    progress=ind;
    loading=lod;
  }


  Card getCard(bool loading,double progress){
        return Card(
            shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
            color: loading?Colors.white:gateAccentLightColor,
            child: Slidable(
          // Specify a key if the Slidable is dismissible.
          // key: const ValueKey(0),

          // The end action pane is the one at the right or the bottom side.
          endActionPane:  ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                // flex: 2,
                onPressed:  ((context) {}),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black54,
                icon: Icons.archive_outlined,
                label: '归档',
              ),
              SlidableAction(
                onPressed:  ((context) {}),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black54,
                icon: Icons.ios_share_outlined,
                label: '分享',
              ),
            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: loading? 
            LiquidLinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(gateAccentLightColor),
              borderColor: gateAccentLightColor,
              borderWidth: 0,
              borderRadius: 12.0,
              value: progress,
              center: getCardContent(),
          ): getCardContent()
        ));
  }

  Center getCardContent(){
    return Center(
              child:Container(
                  child:  Text(
                          content,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                  ),
              )
          );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsScreen(),
            ),
          );
        },
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // overlayColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
        child: getCard(loading, progress),
      ),


    );
  }
}
