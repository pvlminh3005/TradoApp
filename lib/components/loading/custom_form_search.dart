import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_search_bar.dart';
import '../data_search.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '../custom_icon.dart';
import '../custom_text.dart';
import '/constants/dimen.dart';

class CustomFormSearch extends StatelessWidget {
  final dynamic data;

  const CustomFormSearch({
    this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: DataSearch(data: data));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppDimen.verticalSpacing_10,
          horizontal: AppDimen.horizontalSpacing_5,
        ),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: kBackgroundColorWhite,
          borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              spreadRadius: 1,
              offset: Offset(0, 3),
              color: kColorItemGrey.withOpacity(.7),
            )
          ],
        ),
        child: Row(
          children: [
            CustomIcon(
              Icons.search,
              color: kTextColorGrey.withOpacity(.5),
            ),
            const SizedBox(width: AppDimen.spacing_1),
            CustomText(
              'Tìm kiếm',
              color: kTextColorGrey.withOpacity(.5),
              fontSize: FontSize.MEDIUM - 1,
            ),
          ],
        ),
      ),
    );
  }
}
