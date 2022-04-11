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


class HomeNewsCard extends StatefulWidget {
  TaskList content=TaskList();
  double _progress = 0;

  HomeNewsCard(TaskList cont) {
    content = cont;
    _progress=getProgress(content.status);
  }
  @override
  _HomeNewsCardState createState() => _HomeNewsCardState();
}

class _HomeNewsCardState extends State<HomeNewsCard>
    with SingleTickerProviderStateMixin {

  late AnimationController _progressAnimationController;
  bool _queryDoing = false;

  @override
  void initState() {
    super.initState();
    _progressAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _progressAnimationController.addListener(() => setState(() {}));
    _progressAnimationController.repeat();
    _progressAnimationController.value=widget._progress;
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    // _timer.cancel();
    super.dispose();
  }

 
  Card getCard(bool loading){
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
              // value: progress,
              value: _progressAnimationController.value,
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
    double progress=getProgress(status);
    if(progress>=0.999) {
      return false;
    } else{
      return true;
    }
  }

  void query() async{
    var tid=widget.content.transactionID;
    //  _progressAnimationController.animateTo(getProgress(widget.content.status));
          if(tid!=null){            
              await Service.checkLinkTransaction(tid).then((value) async{
              var success=value.isSuccess;
              var errMsg = value.errorMsg;
              var status=value.status;

              // var title=value.title;
              // if(title!=null)print('queryasync: '+title);

              if(success!=null&&errMsg!=null&& status !=null){
                if (success) {
                  //不要在这里animateto,因为网络请求是异步的（await），会导致可能存在的在已经dispose后才网络请求完成从而被调用的bug。
                 
                  if(getProgress(status)>=0.999){
                    setState(() {
                      widget.content.status="1";
                        //保证timer的唯一性
                      // _hasATimer = false;
                    });
                  }else{
                      widget.content.status = status;
                      try {
                      // print('movestatue:' + status);
                      await _progressAnimationController
                          .animateTo(getProgress(status));
                      } catch (e) {
                        // print('disposed.');
                        return;
                      }
                      Future.delayed(const Duration(milliseconds: 4000), () async{
                        query();
                      });
                  }
                 
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
  }

  @override
  Widget build(BuildContext context) {
     if(isLoading()&&!_queryDoing){
       setState(() {
         _queryDoing=true;
       });
       query();
     }

    // Timer.periodic(Duration(milliseconds: 4000), (timer) async { 
      
    //     // _progressAnimationController.value=0.99;
    //   _progressAnimationController.animateTo(0.99);  
      
    //     // await _progressAnimationController.animateTo(0.99);  
    // });

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
        child: getCard(isLoading()),
      ),

    );
  }
}
