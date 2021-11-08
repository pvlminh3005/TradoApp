import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';

class TimeLineWidget extends StatelessWidget {
  final int? processing;

  const TimeLineWidget({
    this.processing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: Column(
        children: [
          ProcessWidget(
            title: 'Đang xử lý',
            isProcessed: processing == 1 ? true : false,
          ),
          ProcessWidget(
            title: 'Đang vận chuyển',
            isProcessed: processing == 2 ? true : false,
          ),
          ProcessWidget(
            title: 'Đã giao',
            isProcessed: processing == 3 ? true : false,
            theLast: true,
          ),
        ],
      ),
    );
  }
}

class ProcessWidget extends StatelessWidget {
  final String? title;
  final bool theLast;
  final bool isProcessed;

  const ProcessWidget({
    this.title,
    this.theLast = false,
    this.isProcessed = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Circle Status
        Column(
          children: [
            // build circle container
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: isProcessed ? kPrimaryColor : kColorItemGrey,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            !theLast
                ? Container(
                    width: 1.0,
                    height: 48.0,
                    color: kColorItemGrey,
                  )
                : SizedBox.shrink(),
          ],
        ),
        const SizedBox(width: 8.0),
        // Information
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title!,
              fontSize: FontSize.MEDIUM - 1,
              color: isProcessed ? kTextDark : kTextColorGrey,
            ),
            SizedBox(height: 16.0),
            isProcessed
                ? CustomText(
                    '09-09-2021 21:15',
                    fontSize: FontSize.SMALL,
                    color: Color(0xFF909090),
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
