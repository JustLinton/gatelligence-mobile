import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/utils/dialogs.dart';

import 'package:gatelligence/utils/myColor.dart';

import 'package:gatelligence/pages/user_screen/user_settings_group.dart';
import 'package:gatelligence/entity/checkLinkTransactionResponse.dart';
import 'package:gatelligence/pages/home_screen/home_title.dart';
import 'package:gatelligence/utils/skeletons.dart';

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

  bool _loading=true;

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
              _loading=false;
            });
          } else {
            GateDialog.showAlert(context, "错误", "事务读取出错~ 请检查登录状况~");
          }
      } else {
        GateDialog.showAlert(context, "错误", "事务读取出错~");
      }
    });
  }

  Column getLoadingSkeleton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 16)),
        GateSkeletons.getCardSkeleton(double.infinity, 128),

        Padding(padding: EdgeInsets.only(top: 16)),
        GateSkeletons.getCardSkeleton(double.infinity, 48),

        Padding(padding: EdgeInsets.only(top: 16)),
        GateSkeletons.getCardSkeleton(double.infinity, 256),

        Padding(padding: EdgeInsets.only(top: 16)),
        GateSkeletons.getCardSkeleton(double.infinity, 48),

        Padding(padding: EdgeInsets.only(top: 16)),
        GateSkeletons.getCardSkeleton(double.infinity, 256),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_loading)query();
    return Scaffold(
      backgroundColor: Colors.white,
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
                  _loading?getLoadingSkeleton():Container(
                    width: MediaQuery.of(context).size.width,
                    child:   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Padding(padding: EdgeInsets.only(bottom: 32)),
                        // Padding(padding: EdgeInsets.only(left: 16),child: Text(_title,
                        // style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),textAlign: TextAlign.left,),),
                        // Padding(padding: EdgeInsets.only(bottom: 16)),
                        // Divider(height: 16,thickness: 3,),
                         Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(16.0)),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                    width: double.infinity,
                                    height: 210,
                                    child: Stack(
                                      // alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child:  Image(
                                          image: CachedNetworkImageProvider(
                                              'https://linton-pics.oss-cn-beijing.aliyuncs.com/uPic/p5.png'),
                                          // alignment: Alignment.center,
                                          fit:BoxFit.cover
                                        ),),
                                       
                                        Expanded(
                                            child: Container(
                                          color:
                                              Color.fromARGB(74, 255, 255, 255),
                                        )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 32, left: 32),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _title,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23,
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )
                                            )
                                      ],
                                    )),
                              ),
                        Padding(padding: EdgeInsets.only(bottom: 32)),
                        HomeTitle("摘要"),
                        Padding(padding: EdgeInsets.only(left: 8,right: 8,top: 16,bottom: 32),child:  Text(_summarizedPar,style: TextStyle(fontSize: 15.3),),),
                        HomeTitle("原文"),
                         Padding(
                          padding:
                              EdgeInsets.only(left: 8, right: 8, top: 16,bottom: 32),
                          child: Text(
                            _originalPar,
                            style: TextStyle(fontSize: 15.3),
                          ),
                        ),
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
