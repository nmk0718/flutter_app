import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatefulWidget {

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  StateSetter stateSetter;
  IconData lightIcon = Icons.flash_on;
  ScanController controller = ScanController();

  void getResult(String result){
    //TODO
    String url = result;
    controller.resume();
    RegExp reg = RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    if (reg.firstMatch(result) != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return WebviewScaffold(
          appBar: AppBar(
            title: Text(url),
          ),
          url: url,
        );
        //外部浏览器打开二维码扫描结果
        //launch(url);
      }));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(("扫码")),
      ),
      body: Stack(
          children: [
            ScanView(
            controller: controller,
            scanAreaScale: .8,
            scanLineColor: Color(0xFF4759DA),
            onCapture: (data) {
              getResult(data);
            },
          ),
            Positioned(
              left: 100,
              bottom: 100,
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  stateSetter = setState;
                  return MaterialButton(
                      child: Icon(lightIcon,size: 40,color: Color(0xFF4759DA),),
                      onPressed: (){
                        controller.toggleTorchMode();
                        if (lightIcon == Icons.flash_on){
                          lightIcon = Icons.flash_off;
                        }else {
                          lightIcon = Icons.flash_on;
                        }
                        stateSetter((){});
                      }
                  );
                },
              ),
            ),
            Positioned(
              right: 100,
              bottom: 100,
              child: MaterialButton(
                  child: Icon(Icons.image,size: 40,color: Color(0xFF4759DA),),
                  onPressed: () async {
                    List<Media> res = await ImagesPicker.pick();
                    if (res != null) {
                      String result = await Scan.parse(res[0].path);
                      getResult(result);
                    }
                  }
              ),
            ),
          ]
      ),
    );
  }
}