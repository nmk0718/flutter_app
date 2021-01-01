import 'package:flutter/material.dart';
import 'login.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("nimingkun"),
              accountEmail: Text("nimingkun@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i2.hdslb.com/bfs/face/8c59f37b1a064fec293641e70aa88a2f5f09190b.jpg@140w_140h_1c.webp")
              ),
              //背景颜色
              decoration: BoxDecoration(color: Colors.yellowAccent[100],
                //背景图片
                image: DecorationImage(
                    image: NetworkImage("http://i0.hdslb.com/bfs/space/cb1c3ef50e22b6096fde67febe863494caefebad.png@2200w_400h_1o.webp"),
                    //图片填充
                    fit: BoxFit.cover,
                    //设置背景图片透明度
                    colorFilter: ColorFilter.mode(Colors.yellowAccent.withOpacity(0.6),
                        BlendMode.srcOver)
                ),),
            ),
            ListTile(
              leading: Icon(Icons.message, color: Colors.black, size: 22.0,),
              title: Text("Messages", textAlign: TextAlign.left,),
              onTap: (){Navigator.pushNamed(context, '/button');},
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.red, size: 22.0,),
              title: Text("Favorite", textAlign: TextAlign.left,),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.lightBlueAccent, size: 22.0,),
              title: Text("Settings", textAlign: TextAlign.left,),
              onTap: () => Navigator.pop(context),
            ),
            AboutListTile(
                icon: FlutterLogo(),
                child: Text('About uniqueK'),
                applicationName: 'uniqueK',
                applicationVersion: 'V1.0.0',
                applicationIcon: FlutterLogo(),
                applicationLegalese: '专注分享Flutter相关内容'),
            SizedBox(height:200),
            ListTile(
              title: Text("切换账号", textAlign: TextAlign.center,),
              onTap: (){Navigator.pushNamed(context, '/login');},
            ),
            ListTile(
              title: Text("退出登录", textAlign: TextAlign.center,),
              onTap: (){Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) => login()),
                      (route) => route == null);},
            ),
          ],
        ),),
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
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "我的"),
        ],
      ),
    );
  }
}
