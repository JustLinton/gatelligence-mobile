import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';
import 'package:gatelligence/widgets/register_sheet.dart';

class LoginThirdPartyCard extends StatelessWidget {
  int index=1;

  LoginThirdPartyCard(int ind) {
    index=ind;
  }

  String getTitle(int ind) {
    if (ind == 1) {
      return "通过邮箱注册";
    }
    if (ind == 2) {
      return "以微信继续";
    }
    return "";
  }

  IconData getIcon(int ind){
    if (ind == 1) {
      return Icons.mail_outline_rounded;
    }
    if (ind == 2) {
      return Icons.person_outline_rounded;
    }
    return Icons.login_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if(index==1){
                //关闭当前modal
              Navigator.pop(context);

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
                return RegisterSheet(1);
              });
            }
        },
        child: 
          Card(
          // color: Color.fromARGB(255, 44, 46, 59),
          color: index==1?gateAccentColor:gateDisabledColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Container(
            padding: EdgeInsets.only(left: 30.0, right: 30.0,),
            height: 50,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
                <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                        <Widget>[ 
                          Icon(
                            getIcon(index),
                            color: Colors.white,
                          ),
                          Padding(padding: EdgeInsets.only(left:16)),
                          Text(
                                getTitle(index),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                  ],), 
                  
                
                ]
             
        ),
      )
    )
    );
  }
}
