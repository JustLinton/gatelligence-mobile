import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gatelligence/pages/user_screen.dart';
import 'package:gatelligence/pages/home_screen.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/widgets/taskCreateSheet.dart';

import 'package:gatelligence/utils/systemColorSettings.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class GateAppRoot extends StatefulWidget {
  _GateAppRootState createState() => _GateAppRootState();
}

class _GateAppRootState extends State<GateAppRoot> {
  final _BottomNavigationColor =  gateAccentColor;
  
  var _BottomNavigationBgColor= Colors.white;
  int _currentIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(UserScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.mic_none_outlined,
          size: 30,
        ),
        onPressed: () {
        
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
            	//这里是modal的边框样式
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            builder: (BuildContext context) {
              return taskCreateSheet();
            }
          );
  
          setState((){});
        },
        backgroundColor: gateAccentColor,
        foregroundColor: Colors.white,
        elevation: 5,
      ),

      // Icons.person_outline_rounded

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // body: list[_currentIndex],
      body: IndexedStack(
      index: _currentIndex,
      children: list,
    ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        // elevation: 3.0,
        // notchMargin: 6,
        icons: const <IconData>[Icons.book_outlined, Icons.settings_outlined],
        activeIndex: _currentIndex,
        activeColor: gateAccentColor,
        inactiveColor: gateIconColor,
        splashColor: gateAccentLightColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 18,
        rightCornerRadius: 18,
        backgroundColor: Colors.white,
        onTap: (index) { 
          if(index==0)utilsSetWhiteSystemColor();
          if(index==1)utilsSetGatBlueSystemColor();
          setState(() => _currentIndex = index);
        },
        //other params
      ),
    );
  }
}
