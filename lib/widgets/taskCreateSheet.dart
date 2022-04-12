import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gatelligence/pages/home_screen.dart';
import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/widgets/new_task_options_card.dart';

class TaskCreateSheet extends StatefulWidget {
  late GlobalKey<HomeScreenState> homeScreenKey;

  TaskCreateSheet(this.homeScreenKey);

  _TaskCreateSheetState createState() => _TaskCreateSheetState();
}

class _TaskCreateSheetState extends State<TaskCreateSheet> {
  // final _BottomNavigationColor = gateAccentColor;

  // var _BottomNavigationBgColor = Colors.white;
  // int _currentIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // !important
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 32.0,
                          right: 32.0,
                          top: 32.0,
                          bottom: 0.0),
                      child: Text(
                        '创建新摘要',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 32.0, right: 32.0, bottom: 0.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: gateAccentColor,
                                width: 1.3)),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 32)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          NewTaskOptionsCard("链接模式",widget.homeScreenKey,true),
                          NewTaskOptionsCard("本地模式",widget.homeScreenKey,false),
                    ],)

                ],),
                Padding(padding: EdgeInsets.only(top: 32)),
                TextButton(onPressed: (){}, child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children:<Widget>[Icon(Icons.help_outline_rounded),Padding(padding: EdgeInsets.only(right: 10)), Text('有疑问？点击查看教程')],)),
                Padding(padding: EdgeInsets.only(top: 32)),
              ],
            )));
              
  }
}
