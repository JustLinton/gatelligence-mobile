import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';

class HomeFeaturedCard extends StatelessWidget {
  String content="加载中..";

  HomeFeaturedCard(String cont){
    content=cont;
  }

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsScreen(),
            ),
          );
        },
        child: 
          Card(
          color: gateAccentLightColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Container(
            padding: EdgeInsets.only(left:30.0,right: 30.0,top: 30.0),
            width: 160,
            height: 120,
            child: Text(
              content,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        )
    );
  }
}
