import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

class VideoScreen extends StatefulWidget {
  final String url;
  VideoScreen({Key key, this.url}) : super(key: key);
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();
  @override
  void initState() {
    super.initState();
    player.setDataSource('https://dev.360ljk.com/files/abcdefghjkl.mp4', autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Center(
                child: FijkView(
                  color: Colors.black,
                  player: player,
                ),
              ),
            ),
            Positioned(
              //右上角关闭按钮
              right: 10,
              top: MediaQuery.of(context).padding.top,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black54,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 视频预览
void videoView(BuildContext context, String path) {
  showDialog(
    barrierDismissible: false, //是否点击空白区域关闭对话框,默认为true，可以关闭
    context: context,
    builder: (BuildContext context) {
      return VideoScreen(url: path);
    },
  );
}