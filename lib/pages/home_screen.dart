import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';

import 'package:gatelligence/pages/home_screen/silver_builder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("主页"),
      //   backgroundColor: Colors.white,
      //   foregroundColor: gateAccentColor,
      // ),
      // appBar: AppBar(
      //   title: const Text("Gatelligence"),
      //   backgroundColor: Colors.white,
      //   foregroundColor: gateAccentColor,
      //   elevation: 0.4, //默认是4， 设置成0 就是没有阴影了
      // ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              // leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp),onPressed: (){},),
              // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Colors.white,
              elevation:0.5,
              foregroundColor: gateIconColor,
              shadowColor:gateAccentColor,

              /// This is the part you use this package
              flexibleSpace: CustomizableSpaceBar(
                builder: (context, scrollingRate) {
                  /// Example content
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: 13, left: 12 + 40 * scrollingRate),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "#凝智而成林.",
                        style: TextStyle(
                            fontSize: 42 - 18 * scrollingRate,
                            fontWeight: FontWeight.bold,
                            color: gateAccentColot_nm,
                            ),
                      ),
                    ),
                  );
                },
              ),

              /// End of the part

              expandedHeight: 150,
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0,bottom: 48.0),
              sliver:  HomeScreenSilverBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
