import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/widgets/custom_image_bottom_sheet_widget.dart';
import '/components/primary_button.dart';
import '/controllers/choose_image_controller.dart';
import '/components/custom_input.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/widgets/appbar_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? imageUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimen.verticalSpacing_10,
              horizontal: AppDimen.horizontalSpacing_16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _buildAvatar(),
                  _buildInputField(
                    title: 'Họ và tên',
                    icon: CupertinoIcons.person_circle,
                  ),
                  _buildInputField(
                    title: 'CMND / CCCD',
                    icon: CupertinoIcons.doc_text_viewfinder,
                  ),
                  _buildInputField(
                    title: 'Số điện thoại',
                    icon: CupertinoIcons.phone,
                  ),
                  _buildInputField(
                    title: 'Địa chỉ',
                    icon: Icons.location_on_outlined,
                  ),
                  _buildInputField(
                    title: 'Email',
                    icon: CupertinoIcons.at,
                  ),
                ],
              ),
              const SizedBox(height: AppDimen.spacing_3),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      title: 'Thông tin cá nhân',
      background: kBackgroundColorWhite,
      color: kPrimaryColor,
    );
  }

  Widget _buildAvatar() {
    void showProfileBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (builder) => CustomImageBttomSheetWidget(),
      );
    }

    return InkWell(
      onTap: () async {
        // final image = await ImageController.openImageFromGallery();
        // setState(() {
        //   imageUser = image;
        // });
        showProfileBottomSheet();
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            backgroundColor: imageUser == null ? Colors.lightBlueAccent : null,
            backgroundImage: imageUser == null ? null : FileImage(imageUser!),
            radius: 50,
          ),
          CircleAvatar(
            backgroundColor: kBackgroundColorWhite,
            radius: 13,
            child: Icon(Icons.edit, color: kPrimaryColor, size: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    String? title = '',
    IconData? icon,
  }) {
    return CustomInput(
      hintText: title!,
      margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_2),
      backgroundColor: kBackgroundColorWhite,
      showPrefixIcon: true,
      prefixIcon: icon,
    );
  }

  Widget _buildButton() {
    return PrimaryButton(
      title: 'Lưu thông tin',
      showShadow: false,
      onPressed: () {},
    );
  }
}
