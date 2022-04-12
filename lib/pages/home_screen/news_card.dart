import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:gatelligence/utils/localStorage.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/utils/dialogs.dart';
import 'package:gatelligence/pages/result_page.dart';
import 'package:http/http.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gatelligence/service/services.dart';
import 'package:gatelligence/entity/checkLinkTransactionResponse.dart';
import 'package:gatelligence/entity/userTaskList.dart';

import 'package:share/share.dart';

double getProgress(String? status) {
  // var progress = widget.content.progress;
  if (status == "0") return 0.15;
  if (status == "1") return 1.0;
  if (status == "2") return 0.35;
  if (status == "3") return 0.65;
  if (status == "4") return 0.95;
  if (status == "-2" || status == "-3" || status == "-4") return -1;
  return 0.0;
}

class HomeNewsCard extends StatefulWidget {
  TaskList content = TaskList();
  double _progress = 0;

  HomeNewsCard(TaskList cont) {
    content = cont;
    _progress = getProgress(content.status);
  }
  @override
  _HomeNewsCardState createState() => _HomeNewsCardState();
}

class _HomeNewsCardState extends State<HomeNewsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressAnimationController;
  bool _queryDoing = false;

  int failTrial = 0;

  @override
  void initState() {
    super.initState();
    _progressAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    );

    _progressAnimationController.addListener(() => setState(() {}));
    // _progressAnimationController.repeat();
    // _progressAnimationController.value = widget._progress;
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    // _timer.cancel();
    super.dispose();
  }

  Card getCard(bool loading) {
    return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        color: loading ? Colors.white : getCardColor(),
        child: Slidable(
            // Specify a key if the Slidable is dismissible.
            // key: const ValueKey(0),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const BehindMotion(),
              children: [
                // SlidableAction(
                //   // An action can be bigger than the others.
                //   // flex: 2,
                //   onPressed: ((context) {}),
                //   backgroundColor: Colors.white,
                //   foregroundColor: Colors.black54,
                //   icon: Icons.archive_outlined,
                //   label: '归档',
                // ),
                SlidableAction(
                  onPressed: ((context) {
                    getShareText().then((value) {
                      Share.share(value);
                    });
                  }),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black54,
                  icon: Icons.ios_share_outlined,
                  label: '分享',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: loading
                ? LiquidLinearProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(gateAccentLightColor),
                    borderColor: gateAccentLightColor,
                    borderWidth: 0,
                    borderRadius: 12.0,
                    // value: progress,
                    value: _progressAnimationController.value,
                    center: getCardContent(),
                  )
                : getCardContent()));
  }

  Card getLittleStatusLabel(String label, Color labelColor) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.5))),
        elevation: 0.0,
        color: Color.fromARGB(196, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.only(left: 6, right: 6, bottom: 1, top: 1),
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: labelColor,
            ),
          ),
        ));
  }

  Color getCardColor() {
    Color ret = gateAccentLightColor;
    if (isFailed()) {
      ret = Color.fromARGB(255, 177, 177, 177);
    }
    return ret;
  }

  List<Widget> getStatusLabels() {
    List<Widget> ret = [];
    if (widget.content.type == "1") {
      ret.add(getLittleStatusLabel("链接模式", Colors.black54));
    }
    if (!isFailed() && isLoading()) {
      ret.add(getLittleStatusLabel("处理中", Colors.black54));
    }
    if (isFailed()) {
      ret.add(
          getLittleStatusLabel("已失败", Color.fromARGB(255, 240, 143, 136)));
    }
    return ret;
  }

  Row getCardContent() {
    var title = widget.content.title;
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(left: 16)),
          //  CachedNetworkImage(
          //   imageUrl: "http://via.placeholder.com/350x150",
          //   progressIndicatorBuilder: (context, url, downloadProgress) =>
          //       CircularProgressIndicator(value: downloadProgress.progress),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          //   ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                color: Colors.white,
                elevation: 0.0,
                child: Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(3),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child:     Image(
                            image: CachedNetworkImageProvider(
                                'https://linton-pics.oss-cn-beijing.aliyuncs.com/uPic/p5.png'),
                                fit: BoxFit.cover,
                                ),),
                
                    // Expanded(child: Container(color: Color.fromARGB(74, 255, 255, 255),)),
                    isFailed()?Icon(
                      Icons.cancel_outlined,
                      size: 27,
                      color: Colors.white,
                    ):isLoading()?Icon(
                      Icons.backup,
                      size: 26,
                      color: Colors.white,
                    ): Icon(
                      Icons.play_circle_outline_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],) 
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 16)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [             
                Text(
                  title!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                  Padding(padding: EdgeInsets.only(bottom: 3)),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: getStatusLabels(),
                ),
              ],
            ),
          ),

          Padding(padding: EdgeInsets.only(right: 16)),
        ]);
  }

  Future<String> getShareText() async {
    var tid = widget.content.transactionID;
    String ret = "分享错误";
    String tail = " [来自凝智成林 Gatelligence - 摘要分享]";
    if (tid != null) {
      var response = await Service.checkLinkTransaction(tid);
      bool? success = response.isSuccess;
      String? summaryText = response.output?.summaryText;
      if (success != null && success && summaryText != null) {
        ret = summaryText;
      }
    }
    return ret + tail;
  }

  bool isLoading() {
    var status = widget.content.status;
    double progress = getProgress(status);
    if (progress >= 0.999 || progress < 0) {
      return false;
    } else {
      return true;
    }
  }

  bool isFailed() {
    bool ret = false;
    if (getProgress(widget.content.status) < 0) {
      ret = true;
    }
    return ret;
  }

  void query() async {
    var tid = widget.content.transactionID;
    //  _progressAnimationController.animateTo(getProgress(widget.content.status));
    if (tid != null) {
      await Service.queryLinkTransationStatus(tid).then((value) async {
        var status = value;
        // print(value);

        if (status != null) {
          if (status == "nf") {
            GateDialog.showErrorAlert(context, 46);
            return;
          } else {
            //不要在这里animateto,因为网络请求是异步的（await），会导致可能存在的在已经dispose后才网络请求完成从而被调用的bug。
            if (getProgress(status) >= 0.999) {
              // print('ok 1.');
              setState(() {
                widget.content.status = "1";
                LocalStorage.remove(tid);
                //保证timer的唯一性
                // _hasATimer = false;
              });
            } else {
              widget.content.status = status;
              try {
                // print('movestatue:' + status);
                await _progressAnimationController
                    .animateTo(getProgress(status));
              } catch (e) {
                // print('disposed.');
                return;
              }
              Future.delayed(const Duration(milliseconds: 2500), () async {
                // await _progressAnimationController.animateTo(getProgress(status)+getDeltaTrans(status));
                query();
              });
            }
          }
        } else {
          GateDialog.showErrorAlert(context, 43);
        }
      });
    } else {
      GateDialog.showErrorAlert(context, 44);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading() && !_queryDoing) {
      //让刚创建任务时，无论后台处理得多快，都可以欣赏动画，避免直接跳到百分之很多.
      //当用户刷新时，则直接置进度为真实进度，防止用户产生以为从头再来了的不真实感觉.
      //为避免垃圾堆积在LocalStorage，每次在任务加载完成后就删除这个key.
      var tid = widget.content.transactionID;
      if (tid != null) {
        LocalStorage.containsKey(tid).then((contains) async {
          if (!contains) {
            _progressAnimationController
                .animateTo(getProgress(widget.content.status));
          } else {
            _progressAnimationController.value =
                getProgress(widget.content.status);
          }
          await LocalStorage.setBool(tid, true);
          query();
          _queryDoing = true;
        });
      }
      // _progressAnimationController.animateTo(getProgress(widget.content.status));
    }

    // if (isLoading() && !_queryDoing) {
    //   query();
    //   setState(() {
    //     _queryDoing = true;
    //   });
    // }

    // Timer.periodic(Duration(milliseconds: 4000), (timer) async {

    //     // _progressAnimationController.value=0.99;
    //   _progressAnimationController.animateTo(0.99);

    //     // await _progressAnimationController.animateTo(0.99);
    // });

    return InkWell(
      onTap: () {
        var tid = widget.content.transactionID;
        if (tid != null) {
          if (isFailed()) {
            GateDialog.showAlert(context, '不可查看', '任务已失败');
            return;
          }
          if (isLoading()) {
            GateDialog.showAlert(context, '客官再等等', '摘要任务仍在努力处理中');
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ResultPage(tid);
              },
            ),
          );
        } else {
          GateDialog.showAlert(context, "错误", "摘要不存在");
        }
      },
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      // overlayColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
        child: getCard(isLoading()),
      ),
    );
  }
}
