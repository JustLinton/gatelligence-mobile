import 'package:flutter/material.dart';
import 'package:gatelligence/pages/home_screen.dart';
import 'package:gatelligence/utils/dialogs.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';
import 'package:gatelligence/widgets/linkModeCreateSheet.dart';

class NewTaskOptionsCard extends StatelessWidget {
  String content="加载中..";
  bool enabled=true;

  late GlobalKey<HomeScreenState> homeScreenKey;

  NewTaskOptionsCard(this.content,this.homeScreenKey,this.enabled){}

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          if(!enabled){
            GateDialog.showAlert(context, '敬请期待', '在开发了在开发了');
            return;
          }

           //关闭当前modal
          Navigator.pop(context);

          //弹出新modal
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
                return LinkModeCreateSheet(homeScreenKey);
              });
        },
        child: 
          Card(
          color: enabled? gateAccentLightColor:Color.fromARGB(255, 216, 216, 216),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Container(
            // padding: EdgeInsets.only(left:30.0,right: 30.0,top: 30.0),
            width: 160,
            height: 155,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: 
                  <Widget>[
                    Text(
                      content,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],) 
          ),
        )
    );
  }
}
