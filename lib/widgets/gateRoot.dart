import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gatelligence/pages/user_screen.dart';
import 'package:gatelligence/pages/home_screen.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/widgets/taskCreateSheet.dart';

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
          Icons.add_rounded,
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: list[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 3.0,
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: (){
                 setState(() {
                   _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
