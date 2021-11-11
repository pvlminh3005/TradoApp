import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/controllers/choose_image_controller.dart';
import 'package:trado_app_uit/models/user_model.dart';
import 'package:trado_app_uit/providers/auth_provider.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import '/components/primary_button.dart';
import '/components/custom_input.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/widgets/appbar_widget.dart';

enum EditProfileType { register, profile }

class EditProfileScreen extends StatefulWidget {
  final editType;

  const EditProfileScreen({
    this.editType = EditProfileType.profile,
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? chooseImage;
  late UserModel infoUser;
  late TextEditingController nameController;
  late TextEditingController verifyController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    infoUser = AuthProvider.currentUser;

    nameController = TextEditingController(text: infoUser.name);
    verifyController = TextEditingController(text: infoUser.verify);
    phoneController = TextEditingController(text: infoUser.phoneNumber);
    addressController = TextEditingController(text: infoUser.address);
    emailController = TextEditingController(text: infoUser.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    verifyController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();

    super.dispose();
  }

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
                    controller: nameController,
                    title: 'Họ và tên',
                    icon: CupertinoIcons.person_circle,
                  ),
                  _buildInputField(
                    controller: verifyController,
                    title: 'CMND / CCCD',
                    icon: CupertinoIcons.doc_text_viewfinder,
                  ),
                  _buildInputField(
                    controller: phoneController,
                    title: 'Số điện thoại',
                    icon: CupertinoIcons.phone,
                  ),
                  _buildInputField(
                    controller: addressController,
                    title: 'Địa chỉ',
                    icon: Icons.location_on_outlined,
                  ),
                  _buildInputField(
                    controller: emailController,
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
    return InkWell(
      onTap: () async {
        final image = await ImageController.openImageFromGallery();
        setState(() {
          chooseImage = image;
        });
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            backgroundImage: chooseImage == null
                ? infoUser.imageUrl == null
                    ? null
                    : NetworkImage(infoUser.imageUrl!) as ImageProvider
                : FileImage(chooseImage!),
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
    TextEditingController? controller,
    String? title = '',
    IconData? icon,
  }) {
    return CustomInput(
      controller: controller,
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
      onPressed: () {
        switch (widget.editType) {
          case EditProfileType.register:
            Navigator.pushReplacementNamed(context, RouteManage.diff_profile);
            break;
          default:
            Navigator.pushReplacementNamed(context, RouteManage.my_profile);
            break;
        }
      },
    );
  }
}
