import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gatelligence/utils/myColor.dart';

class linkModeCreateSheet extends StatefulWidget {
  _linkModeCreateSheetState createState() => _linkModeCreateSheetState();
}

class _linkModeCreateSheetState extends State<linkModeCreateSheet> {
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
                        '链接模式',
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
                          left: 32.0, right: 32.0, bottom: 8.0),
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
                const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "链接",
                      icon: Icon(Icons.link_outlined),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 2.0,
                        ),
                      ),
                      // hintText: "请输入用户名",
                      // prefixIcon: Icon(Icons.people_alt_rounded)
                    ),
                  ),
                ),
                FloatingActionButton(
                  child: const Icon(
                    Icons.send_rounded,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                Text(' \n \n'),
              ],
            )));
              
  }
}
