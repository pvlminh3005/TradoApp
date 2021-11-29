import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingApp {
  LoadingApp._();

  static var DELAYED = Future.delayed(Duration(seconds: 2));

  static var LOADWAITING = EasyLoading.show(
    status: 'Vui lòng chờ',
    maskType: EasyLoadingMaskType.black,
  );
  static var LOADUPDATE = EasyLoading.show(status: 'Đang cập nhật');
  static LOADSUCCESS({String title = 'Thành công'}) {
    EasyLoading.showSuccess(title);
  }

  static var DISMISS = EasyLoading.dismiss();

  static Future<void> loadingPage({int seconds = 2}) async {
    LoadingApp.LOADWAITING;
    await Future.delayed(Duration(seconds: seconds));
    LoadingApp.DISMISS;
  }
}
