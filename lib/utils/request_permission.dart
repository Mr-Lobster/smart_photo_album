import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';

class RequestPermission {
  static Future<void> reqPhotomanagerPermis() async {
    //request permission
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      // success
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
      Fluttertoast.showToast(msg: "授权失败");
    }
  }
}
