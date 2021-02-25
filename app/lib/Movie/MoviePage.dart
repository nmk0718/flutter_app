import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFebebeb),
      padding: EdgeInsets.only(top: 5.0),
      height: 580,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.4),
        itemBuilder: (context, idex) {
          return Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        // border: new Border.all(width: 1, color: Colors.red),
                      ),
                      child:Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  "https://wx3.sinaimg.cn/mw690/001TWmyYgy1gllchxdp64j60u018gwh102.jpg",
                                  fit: BoxFit.cover,
                                  width: 195.0,
                                  height: 105.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("林宥嘉",style: TextStyle(color: Colors.white),),
                                      Row(
                                          children: <Widget>[
                                            Icon(Icons.perm_identity,color: Colors.white,),
                                            Text("118.5万人",style: TextStyle(color: Colors.white),)
                                          ]
                                      )
                                    ]),)
                            ],
                          ),
                          Text("THE GREAT YOGA",),
                          Text(
                            " 林宥嘉",
                            style: TextStyle(color: Colors.black38,fontSize: 12,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
        },
        itemCount: 20,
      ),
    );
  }
}
