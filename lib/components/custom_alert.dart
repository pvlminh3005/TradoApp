import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';

import 'custom_text.dart';

class CustomAlert extends StatefulWidget {
  final String? alertContent;
  final String? subContent;
  final Function()? onPressed;
  final bool showButton;

  const CustomAlert({
    this.alertContent = 'Thông báo',
    this.subContent = '',
    this.onPressed,
    this.showButton = true,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
      ),
      elevation: 8,
      title: CustomText(
        widget.alertContent!,
        align: TextAlign.center,
        fontWeight: FontWeight.w700,
        fontSize: FontSize.BIG,
      ),
      contentPadding: const EdgeInsets.all(AppDimen.spacing_2),
      content: widget.subContent != ''
          ? CustomText(
              widget.subContent!,
              align: TextAlign.center,
              fontSize: FontSize.MEDIUM + 1,
              color: kTextColorGrey,
            )
          : const SizedBox.shrink(),
      actions: widget.showButton
          ? [
              isLoading
                  ? SizedBox(
                      width: 22,
                      height: 22,
                      child: LoadingPage(),
                    )
                  : TextButton(
                      child: CustomText(
                        'Có',
                        fontSize: FontSize.BIG,
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor,
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await widget.onPressed!();
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
              TextButton(
                child: CustomText(
                  'Không',
                  fontSize: FontSize.BIG,
                  fontWeight: FontWeight.w700,
                  color: kTextColorGrey,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ]
          : null,
    );
  }
}
