import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/utils/systemColorSettings.dart';

import 'home_screen/home_title.dart';

class NewsScreen extends StatelessWidget {

  String _title="";
  String _par="";
  String _pic="";

  NewsScreen(this._title,this._par,this._pic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gatelligence 讲堂'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: gateAccentColor,
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
                         Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(16.0)),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                    width: double.infinity,
                                    height: 210,
                                    child: Stack(
                                      // alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child:  Image(
                                          image: CachedNetworkImageProvider(
                                              _pic),
                                          // alignment: Alignment.center,
                                          fit:BoxFit.cover
                                        ),),
                                       
                                        // Expanded(
                                        //     child: Container(
                                        //   color:
                                        //       Color.fromARGB(74, 255, 255, 255),
                                        // )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 32, left: 32),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _title,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23,
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )
                                            )
                                      ],
                                    )),
                              ),
                        Padding(padding: EdgeInsets.only(bottom: 32)),
                        HomeTitle("正文"),
                         Padding(
                          padding:
                              EdgeInsets.only(left: 8, right: 8, top: 16,bottom: 32),
                          child: Text(
                            _par,
                            style: TextStyle(fontSize: 15.3),
                          ),
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
