import 'package:flutter/material.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/utils/dialogs.dart';

import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/pages/user_screen/user_settings_group.dart';
import 'package:gatelligence/entity/checkLinkTransactionResponse.dart';
import 'package:gatelligence/pages/home_screen/home_title.dart';

class ResultPage extends StatefulWidget {
  String tid = "";

  ResultPage(String tid_) {
    tid = tid_;
  }
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  String _originalPar="";
  String _summarizedPar = "";
  String _typeName="";
  String _title="";

  @override
  void initState() {
    super.initState();
  }

  String getTypeName(String type){
    if(type=="1"){
      return "链接模式摘要";
    }
    return "摘要";
  }

  void query() async {
    Service.checkLinkTransaction(widget.tid).then((value) {
      var success = value.isSuccess;
      var errMsg = value.errorMsg;
      var avatarLink = value.avatar;
      var outputStruct = value.output;
      var title = value.title;
      var type=value.type;
      if (success != null && errMsg != null&& outputStruct!=null&& title!=null&&
          type!=null) {
            var originalPar=outputStruct.originalText;
            var summarizedPar=outputStruct.summaryText;
          if (originalPar != null &&
              summarizedPar != null 
             ) {
            setState(() {
              _originalPar=originalPar;
              _summarizedPar=summarizedPar;
              _title=title;
              _typeName=getTypeName(type);
            });
          } else {
            GateDialog.showAlert(context, "错误", "事务读取出错~ 请检查登录状况~");
          }
      } else {
        GateDialog.showAlert(context, "错误", "事务读取出错~");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    query();
    return Scaffold(
      appBar: AppBar(
        title: Text('Gatelligence 摘要'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: gateAccentColor,
        elevation: 0.5,
        shadowColor: gateAccentColor,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_outlined),
        //   onPressed: (){
        //      Navigator.pop(context);
        //      utilsSetGatBlueSystemColor();
        // },),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(_title),
                        HomeTitle("摘要"),
                        Text(_summarizedPar),
                        HomeTitle("原文"),
                        Text(_originalPar),
                      ],
                    ),)
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
