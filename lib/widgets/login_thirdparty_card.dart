import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';

class LoginThirdPartyCard extends StatelessWidget {
  int index=1;

  LoginThirdPartyCard(int ind) {
    index=ind;
  }

  String getTitle(int ind) {
    if (ind == 1) {
      return "通过微信继续";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => NewsScreen(),
          //   ),
          // );
        },
        child: 
          Card(
          color: gateAccentLightColor,
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
                          Text(
                                getTitle(index),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                  ],), 
                
                if (index == 2)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 5,
                            // width: 200,
                            child: LinearProgressIndicator(),
                          ),
                          // Text('data'),
                        ],
                      )
                  
                
                ]
             
        ),
      )
    )
    );
  }
}
