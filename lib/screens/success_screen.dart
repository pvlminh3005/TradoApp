import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/components/primary_button.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/screens/splash/background_success.dart';
import 'package:trado_app_uit/widgets/icon_success.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSuccess(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitle(),
                  _buildIconSuccess(),
                  _buildSubTitle(),
                ],
              ),
            ),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return CustomText(
      'Thành công!',
      margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_4),
      textShadow: [
        Shadow(
          color: kBlack.withOpacity(.15),
          offset: Offset(4, 4),
          blurRadius: 15,
        ),
      ],
      fontFamily: font_family_Raleway,
      fontWeight: FontWeight.w700,
      fontSize: FontSize.BIG_2,
    );
  }

  Widget _buildIconSuccess() {
    return IconSuccess();
  }

  Widget _buildSubTitle() {
    return CustomText(
      'Đơn hàng của bạn đang được xử lý. Cảm ơn bạn đã chọn ứng dụng của chúng tôi!',
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimen.horizontalSpacing_16,
          vertical: AppDimen.spacing_3),
      align: TextAlign.center,
      fontSize: FontSize.BIG,
      color: kTextColorGrey,
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          title: 'Tiếp tục mua sắm',
          margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_2),
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteManage.cart);
          },
        ),
        PrimaryButton(
          title: 'Trở về trang chủ',
          borderWidth: 1,
          backgroundColor: Colors.white60,
          textColor: kTextColorGrey,
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteManage.navigator_tab);
          },
        ),
      ],
    );
  }
}
