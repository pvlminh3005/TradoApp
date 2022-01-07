import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/loading/loading_app.dart';
import 'package:trado_app_uit/controllers/convert_file_image.dart';
import '/controllers/auth_controller.dart';
import '/models/user_model.dart';
import '/routes/navigator_tabs_route.dart';
import '/routes/routes_manage.dart';
import '/widgets/custom_avatar.dart';
import '/components/primary_button.dart';
import '/components/custom_input.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/widgets/appbar_widget.dart';

enum EditProfileType { register, profile }

class EditProfileScreen extends StatefulWidget {
  final EditProfileType? editType;

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
  late TextEditingController idCardController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    infoUser = AuthController.currentUser;

    nameController = TextEditingController(text: infoUser.name);
    idCardController = TextEditingController(text: infoUser.idCard);
    phoneController = TextEditingController(text: infoUser.phoneNumber);
    addressController = TextEditingController(text: infoUser.address);
    emailController = TextEditingController(text: infoUser.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    idCardController.dispose();
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
            horizontal: AppDimen.horizontalSpacing_16,
          ),
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
                    controller: idCardController,
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
    return CustomAvatar(
      imageUrl: infoUser.imageUrl!,
      type: AvatarType.editAvatar,
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
      fontWeight: FontWeight.w700,
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
      onPressed: () async {
        LoadingApp.LOADWAITING(title: 'Đang cập nhật thông tin...');
        String getUrlAvatar = chooseImage != null
            ? await ConvertFileImageToString.uploadImageUserAndGetUrl(
                file: chooseImage!)
            : infoUser.imageUrl;

        var data = UserModel(
          auth: AuthModel(id: AuthController.idUser),
          name: nameController.text,
          idCard: idCardController.text,
          phoneNumber: phoneController.text,
          address: addressController.text,
          email: emailController.text,
          imageUrl: getUrlAvatar,
        );
        await AuthController.updateProfileUser(data);

        switch (widget.editType) {
          case EditProfileType.register:
            Navigator.pushReplacementNamed(context, RouteManage.navigator_tab);
            break;
          default:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigatorTab(pages: 4),
              ),
            );
            break;
        }
        LoadingApp.DISMISS();
      },
    );
  }
}
