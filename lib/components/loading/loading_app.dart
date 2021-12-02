import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingApp {
  static var DELAYED = Future.delayed(Duration(seconds: 2));

  static void LOADWAITING({String title = 'Vui lòng chờ'}) {
    EasyLoading.show(
      status: title,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void LOADSUCCESS({String title = 'Thành công'}) {
    EasyLoading.showSuccess(title);
  }

  static void LOADFAILED({String title = 'Thất bại'}) {
    EasyLoading.showError(title);
  }

  static void DISMISS() {
    EasyLoading.dismiss();
  }

  static Future<void> loadingPage({int seconds = 2}) async {
    EasyLoading.show(
      status: 'Vui lòng chờ',
      maskType: EasyLoadingMaskType.black,
    );
    await Future.delayed(Duration(seconds: seconds));
    EasyLoading.dismiss();
  }
}
