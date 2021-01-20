import 'package:flutter/material.dart';

class Post{
  // const Post({
  //   this.title,
  //   this.author,
  //   this.imageUrl,
  //   this.description,
  // });

   String title;
   String author;
   String imageUrl;
   String description;
  Post({this.title, this.author, this.description, this.imageUrl});


  Post.fromJson(Map<String, dynamic> json){
    title = json['Title'];
    author = json['Author'];
    description = json['Description'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Author'] = this.author;
    data['Description'] = this.description;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }

}
final List<Post> posts =[
  Post(
      title: '生如夏花',
      author:'泰戈尔',
      description: '我听见回声，来自山谷和心间\n以寂寞的镰刀收割空旷的灵魂\n不断地重复决绝，又重复幸福\n终有绿洲摇曳在沙漠\n我相信自己\n生来如同璀璨的夏日之花\n不凋不败，妖治如火\n承受心跳的负荷和呼吸的累赘\n乐此不疲 我听见音乐，来自月光和胴体\n辅极端的诱饵捕获飘渺的唯美\n一生充盈着激烈，又充盈着纯然\n总有回忆贯穿于世间\n我相信自己\n死时如同静美的秋日落叶\n不盛不乱，姿态如烟\n即便枯萎也保留丰肌清骨的傲然\n玄之又玄\n我听见爱情，我相信爱情\n爱情是一潭挣扎的蓝藻\n如同一阵凄微的风\n穿过我失血的静脉\n驻守岁月的信念\n我相信一切能够听见\n甚至预见离散，遇见另一个自己\n而有些瞬间无法把握\n任凭东走西顾，逝去的必然不返\n请看我头置簪花，\n一路走来一路盛开\n频频遗漏一些，\n又深陷风霜雨雪的感动\n般若波罗蜜，一声一声\n生如夏花，死如秋叶\n还在乎拥有什么',
      imageUrl: 'https://imagev2.xmcdn.com/storages/0fd0-audiofreehighqps/49/3C/CMCoOSUDkRMmAAKRxgBpwUxH.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=album&name=mobile_large&device_type=ios'
  ),
  Post(
      title: '当时光已逝',
      author:'泰戈尔',
      description:'假如时光已逝，\n鸟儿不再歌唱，\n风儿也吹倦了，\n那就用黑暗的厚幕把我盖上，\n如同黄昏时节你用睡眠的衾被裹住大地，\n又轻轻合上睡莲的花瓣。\n路途未完，行囊已空，\n衣裳破裂污损，人已精疲力竭。 \n你驱散了旅客的羞愧和困窘，\n使他在你仁慈的夜幕下，\n如花朵般焕发生机。\n在你慈爱的夜幕下苏醒。',
      imageUrl: 'https://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190507/c35fc085aeaa4223aa978ace59a5dba0.webp'
  ),
  Post(
      title: '不要不辞而别，我爱',
      author:'泰戈尔',
      description: '不要不辞而别，我爱。\n我看望了一夜，现在我脸上睡意重重。\n只恐我在睡中把你丢失了。\n不要不辞而别，我爱。\n我惊起伸出双手去摸触你，\n我问自己说：“这是一个梦么？”\n但愿我能用我的心系住你的双足，紧抱在胸前！\n不要不辞而别，我爱。',
      imageUrl: 'https://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190507/ce3a6f33f8c747cabae9c82d0cc35503.webp'
  ),
  Post(
      title: '永恒的爱情',
      author:'泰戈尔',
      description: '我以数不清的方式爱你\n我的痴心永远为你编织歌之花环\n亲爱的，接受我的奉献\n世世代代以各种方式挂在你的胸前\n我听过的许多古老爱情的故事\n充满聚首的欢乐和离别的悲郁\n纵观无始的往昔\n我看见你像永世难忘的北斗\n穿透岁月的黑暗\n姗姗来到我的面前\n从洪荒时代的心源出发\n你我泛舟顺流而下\n你我在亿万爱侣中间嬉戏\n分离时辛酸的眼泪和团圆时甜蜜的羞涩里\n古老的爱情孕育了新意\n陈腐的爱情而今化为你脚下的灰尘\n一切心灵的爱欲、悲喜\n一切爱情传说，历史诗人写的恋歌歌词\n全部融合在你我新型的爱情里',
      imageUrl: 'https://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190507/7c028852f3b9403a878c8be21393e083.webp'
  ),
  Post(
      title: '我一无所求',
      author:'泰戈尔',
      description: '我一无所求，只站在林边树后。\n倦意还逗留在黎明的眼上，露润在空气里。\n湿草的懒味悬垂在地面的薄雾中。\n在榕树下你用乳油般柔嫩的手挤着牛奶。\n我沉静地站立着。\n我没有走近你。\n天空和庙里的锣声一同醒起。\n街尘在驱走的牛蹄下飞扬。\n把汩汩发响的水瓶搂在腰上，\n女人们从河边走来。\n你的钏镯丁当，乳沫溢出罐沿。\n晨光渐逝而我没有步近你。',
      imageUrl: 'https://pic2.zhimg.com/v2-7c3461c2ff7f94bed063bf5f03b9add2_1440w.jpg?source=172ae18b'
  ),
];