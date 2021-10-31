import 'package:flutter/material.dart';
import '/components/card_shadow.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';

class PaymentMethodWidget extends StatelessWidget {
  final int? method;

  const PaymentMethodWidget({
    this.method = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (method) {
      case 1:
        return _buildCard(
          child: Row(
            children: [
              _buildIconPayment('assets/images/momo.png'),
              _buildNamePayment('Momo'),
            ],
          ),
        );
      case 2:
        return _buildCard(
          child: Row(
            children: [
              _buildIconPayment('assets/images/zalo.png'),
              _buildNamePayment('Zalo Pay'),
            ],
          ),
        );
      default:
        return _buildCard(
          child: Row(
            children: [
              _buildIconPayment('assets/images/cash-card.png'),
              _buildNamePayment('Tiền mặt'),
            ],
          ),
        );
    }
  }

  Widget _buildCard({Widget? child}) {
    return CardShadow(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_16),
      padding: const EdgeInsets.all(0),
      child: child!,
    );
  }

  Widget _buildIconPayment(String url) {
    return Container(
      child: Image.asset(url),
    );
  }

  Widget _buildNamePayment(String? title) {
    return CustomText(
      title!,
      fontWeight: FontWeight.w700,
    );
  }
}
