import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';

class CustomImageBttomSheetWidget extends StatelessWidget {
  final Function()? onTapGallery;
  final Function()? onTapCamera;

  const CustomImageBttomSheetWidget({
    this.onTapGallery,
    this.onTapCamera,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.spacing_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            title: 'Chọn ảnh từ thư viện',
            icon: CupertinoIcons.photo_fill_on_rectangle_fill,
            onTap: onTapGallery,
          ),
          const SizedBox(height: AppDimen.verticalSpacing_10),
          _buildButton(
            title: 'Chụp ảnh',
            icon: CupertinoIcons.camera_fill,
            onTap: onTapCamera,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    String title = '',
    IconData? icon,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: 27,
            color: kPrimaryColor,
          ),
          title: CustomText(
            title,
            fontSize: FontSize.MEDIUM + 1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
