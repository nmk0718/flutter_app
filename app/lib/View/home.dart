import 'package:flutter/material.dart';
import 'login.dart';
import 'view.dart';
import 'basic.dart';
import 'listview.dart';

// class home extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: Colors.grey[100],
//         //appbar
//         appBar: AppBar(
//             title: Text("首页"),
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.search),
//                 tooltip: 'Search',
//                 onPressed: () => debugPrint('Search'),
//               ),
//             ],
//             elevation: 0.0,
//             bottom: TabBar(
//                 unselectedLabelColor: Colors.black38,
//                 indicatorColor: Colors.black,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 indicatorWeight: 1.0,
//                 tabs: <Widget>[
//                   Tab(icon: Icon(Icons.local_florist)),
//                   Tab(icon: Icon(Icons.change_history)),
//                   Tab(icon: Icon(Icons.directions_bike)),
//                   Tab(icon: Icon(Icons.view_quilt)),
//                 ])
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             listview(),
//             //Icon(Icons.change_history, size: 185.0, color: Colors.grey,),
//             basic(),
//             //Icon(Icons.directions_bike, size: 185.0, color: Colors.grey,)
//             layout(),
//             view(),
//           ],
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               UserAccountsDrawerHeader(accountName: Text("nimingkun"),
//                 accountEmail: Text("nimingkun@gmail.com"),
//                 currentAccountPicture: CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "https://i2.hdslb.com/bfs/face/8c59f37b1a064fec293641e70aa88a2f5f09190b.jpg@140w_140h_1c.webp")
//                 ),
//                 //背景颜色
//                 decoration: BoxDecoration(color: Colors.yellowAccent[100],
//                   //背景图片
//                   image: DecorationImage(
//                       image: NetworkImage("http://i0.hdslb.com/bfs/space/cb1c3ef50e22b6096fde67febe863494caefebad.png@2200w_400h_1o.webp"),
//                       //图片填充
//                       fit: BoxFit.cover,
//                       //设置背景图片透明度
//                       colorFilter: ColorFilter.mode(Colors.yellowAccent.withOpacity(0.6),
//                           BlendMode.srcOver)
//                   ),),
//               ),
//               ListTile(
//                 leading: Icon(Icons.message, color: Colors.black, size: 22.0,),
//                 title: Text("Messages", textAlign: TextAlign.left,),
//                 onTap: (){Navigator.pushNamed(context, '/button');},
//               ),
//               ListTile(
//                 leading: Icon(Icons.favorite, color: Colors.red, size: 22.0,),
//                 title: Text("Favorite", textAlign: TextAlign.left,),
//                 onTap: () => Navigator.pop(context),
//               ),
//               ListTile(
//                 leading: Icon(Icons.settings, color: Colors.lightBlueAccent, size: 22.0,),
//                 title: Text("Settings", textAlign: TextAlign.left,),
//                 onTap: () => Navigator.pop(context),
//               ),
//             ],
//           ),),
//       ),
//     );
//   }
// }

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<home> {
  var fragmentPagerList = <Widget>[];
  var SelectedIndex = 0;

  @override
  void initState() {
    fragmentPagerList.add(listview());
    fragmentPagerList.add(basic());
    fragmentPagerList.add(view());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 56,
            child: fragmentPagerList[SelectedIndex],
          )
        ],
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(top: 5),
        width: scrrenWidth,
        height: 56,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                SelectedIndex=0;
                setState(() {

                });
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color:
                    SelectedIndex == 0 ? Colors.lightBlueAccent : Colors.black26,
                  ),
                  Text(
                    "首页",
                    style: TextStyle(
                        color: SelectedIndex == 0
                            ? Colors.lightBlueAccent
                            : Colors.black26),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                SelectedIndex=1;
                setState(() {
                });
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.live_tv,
                    color:
                    SelectedIndex == 1 ? Colors.lightBlueAccent : Colors.black26,
                  ),
                  Text(
                    "动态",
                    style: TextStyle(
                        color: SelectedIndex == 1
                            ? Colors.lightBlueAccent
                            : Colors.black26),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  SelectedIndex=2;
                  setState(() {
                  });
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.perm_identity,
                      color:
                      SelectedIndex == 2 ? Colors.lightBlueAccent : Colors.black26,
                    ),
                    Text(
                      "我的",
                      style: TextStyle(
                          color: SelectedIndex == 2
                              ? Colors.lightBlueAccent
                              : Colors.black26),
                    ),
                  ],
                )),
          ],
        ),
      ),
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
            SizedBox(height:270),
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
    );
  }
}
