import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_input.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/components/primary_button.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/controllers/choose_image_controller.dart';
import '/widgets/appbar_widget.dart';

class EditMyCategoryScreen extends StatefulWidget {
  EditMyCategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditMyCategoryScreen> createState() => _EditMyCategoryScreenState();
}

class _EditMyCategoryScreenState extends State<EditMyCategoryScreen> {
  List<Widget> listImages = [];
  late TextEditingController nameProductController;
  late TextEditingController priceProductController;
  late TextEditingController discountProductController;
  late TextEditingController descriptionProductController;
  late TextEditingController quantityProductController;

  @override
  void initState() {
    nameProductController = TextEditingController();
    priceProductController = TextEditingController();
    discountProductController = TextEditingController();
    descriptionProductController = TextEditingController();
    quantityProductController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameProductController.dispose();
    priceProductController.dispose();
    discountProductController.dispose();
    descriptionProductController.dispose();
    quantityProductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBarWidget _buildAppBar(BuildContext context) {
    return AppBarWidget(
      title: 'Chi tiết sản phẩm',
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimen.spacing_2,
          vertical: AppDimen.spacing_1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageProduct(),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            _buildListInput(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_10),
        child: Row(
          children: [
            _buildCustomImage(),
            listImages.isEmpty ? SizedBox.shrink() : Row(children: listImages),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomImage() {
    return InkWell(
      onTap: () async {
        await ImageController.showBottomSheetManageImage(context);
        setState(() {
          listImages.add(_buildCustomNewImage());
        });
      },
      child: DottedBorder(
        color: kTextColorGrey,
        radius: Radius.circular(AppDimen.radiusNormal),
        borderType: BorderType.RRect,
        child: Container(
          height: 90.0,
          width: 90.0,
          child: Icon(CupertinoIcons.add, color: kTextColorGrey),
        ),
      ),
    );
  }

  Widget _buildCustomNewImage() {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimen.verticalSpacing_5),
      child: Container(
        height: 95.0,
        width: 95.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
          child: Image.file(ImageController.file!, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildListInput() {
    return Column(
      children: [
        CustomInput(
          controller: nameProductController,
          hintText: 'Tên sản phẩm',
          margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
          maxLength: 70,
        ),
        CustomInput(
          controller: priceProductController,
          hintText: 'Giá (đ)',
          margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
          keyboardType: TextInputType.number,
        ),
        CustomInput(
          controller: discountProductController,
          hintText: 'Giảm giá (%)',
          margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
          keyboardType: TextInputType.number,
          maxLength: 3,
        ),
        CustomInput(
          controller: descriptionProductController,
          hintText: 'Mô tả chi tiết sản phẩm',
          margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
          maxLines: 10,
        ),
        CustomInput(
          controller: quantityProductController,
          hintText: 'Số lượng',
          margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildButton() {
    return PrimaryButton(
      title: 'Thêm sản phẩm mới',
      margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_2),
      onPressed: () {},
    );
  }
}
