import 'package:provide/provide.dart';
import 'ThemeData.dart';

class ProvideConfig{

  //初始化Provider以及ThemeConfigMdel
  static init({child,dispose=false}){
    final providers = Providers()..provide(Provider.value(ThemeConifgModel()));
    return ProviderNode(child: child, providers: providers,dispose: dispose,);
  }

  static connect<T>({builder,child,scope}){
    return Provide<T>(builder: builder,child:child,scope:scope);
  }

  static T value<T>(context,{scope}){
    return Provide.value<T>(context,scope:scope);
  }
}