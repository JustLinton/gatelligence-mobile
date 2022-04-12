import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:gatelligence/utils/myColor.dart';
import 'package:gatelligence/pages/news_screen.dart';

class CardDetails{
  CardDetails(this.title,this.backGround,this.par,this.cardTextColor);

  String title="";
  String backGround="";
  String par="";
  Color cardTextColor;
}

class HomeFeaturedCard extends StatelessWidget {
  int type=0;
  late CardDetails cardDetails;

  HomeFeaturedCard(this.type){
    cardDetails=getCardDetails();
  }

  CardDetails getCardDetails(){
    if (type == 0) {
      return CardDetails(
          '凝智与\n你的记忆',
          'https://linton-pics.oss-cn-beijing.aliyuncs.com/uPic/p3.png',
          '想象一下，人的大脑中有很多个记忆触点，每个记忆触点串联像极了物理学中的电路。每当我们读完一本书，抑或是看完一个视频，就会有一些触点被点亮，作为我们学习过的证明.\n\n但是，记忆在消退，触点的光亮逐渐暗淡，最后归于沉寂。\n\n刷过的视频千千万万，就算有心二刷，怕也是无从寻找。\n\n信息如此繁杂，该如何快速筛选出自己需要的视频信息？又该怎样将有效的信息保存下来呢？怎样才能一目了然，省去复查与寻找的麻烦呢？\n\n现在，凝智成林邀请您一同迈进线上学习便捷高效的智能未来。您无须为网课笔记而焦头烂额，也无须因找不到笔记而抓耳挠腮。',Colors.white);
    }
   if (type == 2) {
      return CardDetails(
          '真幸运遇到你，\n来听听我们的故事',
          'https://linton-pics.oss-cn-beijing.aliyuncs.com/uPic/p4.png',
          '我们，用更短的时间，更清晰的文字，更高的效率，帮助6000万线上学习者牢固掌握视频知识，开创全新的视频未来。\n\n我们，是来自各个专业的00后，因建设音视频摘要平台的朴素心愿走到了一起，致力于为未来线上教育的方法提供一种新途径，解放我们的双手，强化我们的记忆，进而帮助学习者取得更高的学习效率。\n\n谈及到我们的工作氛围，可以有很多很多的形容词。\n\n我们敢想敢干。我们积极向老师请教，努力提升算法的精确性；\n\n我们为后端的搭建肝到凌晨3点,早上醒来发现台灯还亮着。\n\n我们，凝智成林，致力于构建崭新的线上学习平台，集众人之智慧，攻坚克难，创建未来。',
          Colors.white);
    }
    if (type == 1) {
      return CardDetails(
          '凝智由什么样的\n团队打造？',
          'https://linton-pics.oss-cn-beijing.aliyuncs.com/uPic/p2.png',
          '我们，凝智成林，致力于构建崭新的线上学习平台，集众人之智慧，攻坚克难，创建未来。\n\n宣传头头:凝智成林是一个非常有趣的团队，我的伙伴们多半是技术大佬，每天与他们交流，我能感受到他们对于技术的执着追求，也能学到很多自己专业之外的知识。我感觉自己每天都在发现新世界，这令我非常愉快。\n\n我没有想到技术宅也能如此有趣，谁会想到两个后端大哥会为了泡面先吃面还是先喝汤而争论不休呢，话说到底是哪一步在前，真是令人困惑。\n\n我们是一个团结上进的团队，大家就像真正的兄弟姐妹那样相互关心，相互帮助，共同进步。这样的集体真令人着迷。',
          Colors.white);
    }
    if (type == 3) {
      return CardDetails(
          '技术攻坚，\n学生团队在行动',
          'https://linton-pics.oss-cn-beijing.aliyuncs.com/uPic/p1.png',
          '疫情期间团队通过定期线上开会交流，并借助GitHub等代码托管平台进行集约开发。整个团队保持着较好的项目完成度，同步推动项目向前发展。团队成员针对前后端联调过程中的技术壁垒自学了前后端相关知识，在沟通和技术交流方面进行得比较顺利，成员希望利用所学知识做一些对社会有意义的事情。\n\n我们分了三个主要部分，比如由J先生负责算法后端工作，将分词结果提取为摘要；由阿九负责前后端通信工作，健全用户信息系统和信息的查询、视频链接爬取等工作；由大蒋和大明两位负责前端开发工作，完善多任务处理工作机制和样式优化。\n\n我们的小程序主要进行的是视频抽取，视频摘要的工作。与相关竞品而言更加全面，并且通过端云结合技术可以将结果更快地反馈给客户，便于普通人接触和使用，提供了很方便的交互机制，让每个人都能享受到技术带来的红利。独到之处的话，我们的小程序算法前沿，SummerRunner&TextRank得到了很好的用户反馈。小程序支持实现文本摘要重点提取以及纲要提取功能。\n\n用户可以提前预览，帮助用户构建知识体系，是线上学习的得力助手。后期用户可以定期复习来强化自己的薄弱环节，提升自己的学习效率。\n\n对于一个高业务的场景，我们系统做了一些特殊的规划，它其中的各个节点都含有自己的处理机和内存。通常在彼此的地位上是平等的，我们利用协调的任务处理使用分布式以及高解耦的方式，利用了多元结合的核心优势，能够做到算力以及实用场景的高度匹配。后期会针对互联网的业务，我们会开放凝智成林开放平台。以系统性创新丰富产业新业态。为互联网相关提供商开发AI的相关的服务接口。\n\n小程序开发处于1.0阶段，支持基本的摘要生成，提纲生成功能，可以实现线上学习期间自动笔记生成以及自动整理等功能。接下来团队会进一步提升用户体验并丰富业务场景，例如针对云计算的架构优势，提升用户的体验，实现应用场景与用户的匹配。后期针对互联网厂商提供更多的AI服务接口，与更多的互联网品牌合作进而拓展业务场景。',
          Color.fromARGB(255, 255, 255, 255));
    }
    return CardDetails('这里是讲堂', 'https://linton-pics.oss-cn-beijing.aliyuncs.com/uPic/test1.jpg', 'type',Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsScreen(cardDetails.title,cardDetails.par,cardDetails.backGround),
            ),
          );
        },
        child: 
           Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(12.0)),
        clipBehavior: Clip.antiAlias,
        child: Container(
            width: 158,
            height: 130,
            child: Stack(
              // alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image(
                      image: CachedNetworkImageProvider(
                          cardDetails.backGround),
                      // alignment: Alignment.center,
                      fit: BoxFit.cover),
                ),
                // Expanded(
                //     child: Container(
                //   color: Color.fromARGB(74, 255, 255, 255),
                // )),
                Padding(padding: EdgeInsets.only(top: 32,left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                        Text(
                          cardDetails.title,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: cardDetails.cardTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.7,
                              // backgroundColor: Colors.white,
                              ),
                        ),],
                      ) 
                )
              ],
            )),
      ),
    );
  }
  
}
