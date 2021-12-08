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
            isProcessed: processing! >= 1,
            theFirst: true,
          ),
          ProcessWidget(
            title: 'Đang vận chuyển',
            isProcessed: processing! >= 2,
          ),
          ProcessWidget(
            title: 'Đã giao',
            isProcessed: processing! >= 3,
          ),
        ],
      ),
    );
  }
}

class ProcessWidget extends StatelessWidget {
  final String? title;
  final bool theFirst;
  final bool isProcessed;

  const ProcessWidget({
    this.title,
    this.theFirst = false,
    this.isProcessed = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Circle Status
        Column(
          children: [
            // build circle container
            !theFirst
                ? Container(
                    width: 1.5,
                    height: 48.0,
                    color: isProcessed ? kPrimaryColor : kColorItemGrey,
                  )
                : SizedBox.shrink(),
            Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                color: isProcessed ? kPrimaryColor : kColorItemGrey,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
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
            SizedBox(height: 8.0),
            isProcessed
                ? CustomText(
                    '09-09-2021 21:15',
                    fontSize: FontSize.SMALL - 1,
                    color: Color(0xFF909090),
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
