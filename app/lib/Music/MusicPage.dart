import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPage extends StatefulWidget{
  MusicPageState createState()=> MusicPageState();
}

class MusicPageState extends State<MusicPage> {
  AudioPlayer audioPlayer = AudioPlayer();

  //远程音频
  playremote() async {
    int result = await audioPlayer.play(
        "https://dev.360ljk.com/files/abc.m4a");
    if (result == 1) {
      // success
      print('play 远程音频 success');
    } else {
      print('play 远程音频 failed');
    }
  }

//  本地音频
  playlocal() async {
    int result = await audioPlayer.play("/Downloads/abc.m4a", isLocal: true);
    if (result == 1) {
      // success
      print('play 本地音频 success');
    } else {
      print('play 本地音频 failed');
    }
  }
  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
      print('pause 音频 success');
    } else {
      print('pause 音频 failed');
    }
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      // success
      print('stop 音频 success');
    } else {
      print('stop 音频 failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.black, size: 22.0,),
              title: Text("少女", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.red, size: 22.0,),
              title: Text("勉强幸福", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.lightBlueAccent, size: 22.0,),
              title: Text("再别康桥", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.pinkAccent, size: 22.0,),
              title: Text("成全", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.lightGreenAccent, size: 22.0,),
              title: Text("我爱的人", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.tealAccent, size: 22.0,),
              title: Text("天真有邪", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.deepPurpleAccent, size: 22.0,),
              title: Text("致珊珊来迟的你", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.orangeAccent, size: 22.0,),
              title: Text("早开的晚霞", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.amberAccent, size: 22.0,),
              title: Text("美妙生活", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow, color: Colors.indigoAccent, size: 22.0,),
              title: Text("突然好想你", textAlign: TextAlign.left,),
              subtitle: Text("林宥嘉", textAlign: TextAlign.left,),
              onTap: (){playremote();},
            ),
          ]),
    );
  }
}