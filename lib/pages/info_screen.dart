import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/utils/systemColorSettings.dart';

import 'home_screen/home_title.dart';

class InfoScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
        centerTitle: true,
        backgroundColor: gateAccentColor,
        foregroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: gateAccentColor,
      ),
      body: Container(
        child:CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  // _loading?getLoadingSkeleton():Container(
                 Container(
                    width: MediaQuery.of(context).size.width,
                    child:   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         
                        Padding(padding: EdgeInsets.only(bottom: 32)),
                         HomeTitle("版本"),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 16, bottom: 32),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '0.1.0 build 447, released at Apr.12,2022.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 15.3),
                                  ),
                                ],
                              )),
                        HomeTitle("关于作者"),
                         Padding(
                          padding:
                              EdgeInsets.only(left: 8, right: 8, top: 16,bottom: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                  Text(
                                    'Jiuming JIANG(不明飛行)\n\nhttps://github.com/justlinton',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 15.3),
                                  ),
                                ],) 
                        ),
                      ],
                    ),)
                  
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
