import 'package:flutter/material.dart';
import 'login.dart';
import 'me.dart';
import 'view.dart';
import 'basic.dart';
import 'listview.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<home> {
  //当前选中的
  int _currentIndex = 0;

  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            listview(),
            basic(),
            view(),
            Me(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (int value){
          setState(() {
            _currentIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        //显示文字
        type: BottomNavigationBarType.fixed,
        //选中的颜色
        selectedItemColor: Colors.lightBlueAccent,
        //未选中为蓝色
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv),label: "动态"),
          BottomNavigationBarItem(icon: Icon(Icons.image_outlined),label: "图片"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "我的"),
        ],
      ),
    );
  }
}
