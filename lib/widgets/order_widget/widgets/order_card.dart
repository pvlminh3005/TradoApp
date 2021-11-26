import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/screens/order_detail_screen.dart';
import '/components/card_shadow.dart';
import '/components/config_price.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';

class OrderCard extends StatelessWidget {
  final String? idOrder;
  final DateTime? date;
  final int? quantity;
  final double? total;
  final int? status; //0,1,2,3

  const OrderCard({
    this.idOrder = 'order2',
    this.date,
    this.total = 0,
    this.quantity = 1,
    this.status = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailScreen(
            processing: status!,
            idOrder: idOrder,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimen.horizontalSpacing_16,
        vertical: AppDimen.spacing_1,
      ),
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          _buildHeader(),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppDimen.verticalSpacing_16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kColorItemGrey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            'Đơn hàng #$idOrder',
          ),
          CustomText(
            '$date',
            fontSize: FontSize.SMALL,
            color: kTextColorGrey,
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.horizontalSpacing_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailInfo(title: 'Số lượng', number: '$quantity'),
          _buildDetailInfo(
            title: 'Tổng cộng',
            number: '${FormatPrice(total!)} đ',
          ),
          _buildStatusOrder(),
        ],
      ),
    );
  }

  Widget _buildDetailInfo({String? title, String? number}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          CustomText(
            '${title!}: ',
            color: kTextColorGrey,
          ),
          CustomText(
            number!,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusOrder() {
    switch (status) {
      case 0: //in processing
        return _buildStatusStyle(
          icon: CupertinoIcons.clock,
          title: 'Đang xử lý',
          color: kTextColorGrey,
        );
      case 1: //delivering
        return _buildStatusStyle(
          icon: Icons.local_shipping_outlined,
          title: 'Đang giao',
          color: kBlack,
        );
      case 2: // success
        return _buildStatusStyle(
          icon: CupertinoIcons.checkmark_circle,
          title: 'Đã giao thành công',
          color: Colors.green,
        );

      default: //cancel
        return _buildStatusStyle(
          icon: CupertinoIcons.clear_circled,
          title: 'Đã huỷ',
          color: Colors.red,
        );
    }
  }

  Widget _buildStatusStyle({IconData? icon, String? title, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: Row(
        children: [
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    icon,
                    size: AppDimen.spacing_3,
                    color: color!,
                  ),
                )
              : SizedBox.shrink(),
          CustomText(
            title!,
            color: color!,
          ),
        ],
      ),
    );
  }
}
