import 'dart:async';

import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/utils/dialogs.dart';
import 'package:gatelligence/pages/news_screen.dart';
import 'package:http/http.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/entity/checkLinkTransactionResponse.dart';
import 'package:gatelligence/entity/userTaskList.dart';

class HomeNewsCard extends StatefulWidget {
  TaskList content=TaskList();

  HomeNewsCard(TaskList cont) {
    content = cont;
  }
  @override
  _HomeNewsCardState createState() => _HomeNewsCardState();
}

class _HomeNewsCardState extends State<HomeNewsCard> {

  double _progress = 0;
  bool _loading = true;
 
  Card getCard(bool loading,double progress){
        return Card(
            shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
            color: loading?Colors.white:gateAccentLightColor,
            child: Slidable(
          // Specify a key if the Slidable is dismissible.
          // key: const ValueKey(0),

          // The end action pane is the one at the right or the bottom side.
          endActionPane:  ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                // flex: 2,
                onPressed:  ((context) {}),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black54,
                icon: Icons.archive_outlined,
                label: '归档',
              ),
              SlidableAction(
                onPressed:  ((context) {}),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black54,
                icon: Icons.ios_share_outlined,
                label: '分享',
              ),
            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: loading? 
            LiquidLinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(gateAccentLightColor),
              borderColor: gateAccentLightColor,
              borderWidth: 0,
              borderRadius: 12.0,
              value: progress,
              center: getCardContent(),
          ): getCardContent()
        ));
  }

  Center getCardContent(){
    var title=widget.content.title;
    return Center(
              child:Container(
                  child:  Text(
                          title!,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                  ),
              )
          );
  }

  bool isLoading(){
    var status = widget.content.status;
    if(status=='1') {
      return false;
    } else{
      return _loading;
    }
  }

  double getProgress(String? status){
    // var progress = widget.content.progress;
    if(status=="0") return 0.15;
    if (status == "1") return 1.0;
    if (status == "2") return 0.35;
    if (status == "3") return 0.65;
    if (status == "4") return 0.85;
    if(status=="-2"||status=="-3"||status=="-4")return -1;
    return 0.0;
  }

  // void timedQuery(String tid) async {
  //   int i = 0;
  //   Timer.periodic(const Duration(milliseconds: 1000), (t) async {
  //     try {
  //       await Service.checkLinkTransaction(tid).then((value) {
  //         var success=value.isSuccess;
  //         var errMsg = value.errorMsg;
  //         var progress=value.progress;
  //         if(success!=null&&errMsg!=null&&progress!=null){
  //           if (success) {
  //             setState(() {
  //               _progress=getProgress(progress);
  //               if(_progress==1.0)_loading=false;
  //             });
  //           } else {
  //             if (errMsg == "501") {
  //               GateDialog.showAlert(context, "错误", "未登录");
  //             }
  //           }
  //         }else{
  //            GateDialog.showAlert(context, "错误", "未知错误");
  //         }
  //       });
  //       i = i + 1;
  //       if (i >= 900) t.cancel();

  //     }catch(e){
  //        print("数据获取失败");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    if(isLoading()){
      Future.delayed(const Duration(milliseconds: 4000), () async{
          var tid=widget.content.transactionID;
          if(tid!=null){
              await Service.checkLinkTransaction(tid).then((value) {
              var success=value.isSuccess;
              var errMsg = value.errorMsg;
              var status=value.status;
              if(success!=null&&errMsg!=null&& status !=null){
                if (success) {
                  setState(() {
                    _progress=getProgress(status);
                    if(_progress==1.0)_loading=false;
                  });
                } else {
                  if (errMsg == "501") {
                    GateDialog.showAlert(context, "错误", "未登录");
                  }
                }
              }else{
                GateDialog.showAlert(context, "错误", "未知错误");
              }});
          }else{
            GateDialog.showAlert(context, "错误", "未知错误");
          }
      });

    }


    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsScreen(),
            ),
          );
        },
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // overlayColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 4.0),
        child: getCard(isLoading(), _progress),
      ),

    );
  }
}
