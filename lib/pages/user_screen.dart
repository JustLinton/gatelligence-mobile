import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';

import 'package:gatelligence/pages/user_screen/silver_builder.dart';

class UserScreen extends StatelessWidget {
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
              leading:  Icon(Icons.settings_outlined),
              // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: gateAccentColor,
              elevation:0.5,
              foregroundColor: Colors.white,

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
                        " 设置",
                        style: TextStyle(
                            fontSize: 42 - 18 * scrollingRate,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
              sliver:  UserScreenSilverBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
