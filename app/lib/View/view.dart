import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageViewDemo();
  }
}

List<String> imgsa = [
  'http://pic.netbian.com/uploads/allimg/190824/212516-15666531161ade.jpg',
  'http://pic.netbian.com/uploads/allimg/201104/230930-1604502570e6f5.jpg',
  'http://pic.netbian.com/uploads/allimg/200216/174956-15818465964a15.jpg',
  'http://pic.netbian.com/uploads/allimg/200410/213246-1586525566c099.jpg',
];

List<String> imgsb = [
  'https://alifei02.cfp.cn/creative/vcg/veer/800water/veer-315286871.jpg',
  'https://alifei04.cfp.cn/creative/vcg/veer/800water/veer-312324043.jpg',
  'https://alifei03.cfp.cn/creative/vcg/veer/800water/veer-350219152.jpg',
  'https://tenfei05.cfp.cn/creative/vcg/veer/800water/veer-377531699.jpg',
];

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('图片展示'),
        elevation: 0.0,
      ),
      body: Container(
          child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment(0.0, 0.0),
            child: Image.network(
              imgsb[index],
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)), //
            ),
          );
        },
        itemCount: imgsb.length,
        viewportFraction: 0.8,
        scale: 0.8,
      )),
    );
  }
}
