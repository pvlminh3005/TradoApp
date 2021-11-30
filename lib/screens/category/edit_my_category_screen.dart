import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/auth_controller.dart';
import '/providers/category_provider.dart';
import '/components/loading/loading_app.dart';
import '/utils/firebase_utils.dart';
import '/components/custom_input.dart';
import '/components/custom_text.dart';
import '/components/primary_button.dart';
import '/constants/sizes.dart';
import '/utils/validator.dart';
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
  bool status = true;
  List<File> listFiles = [];
  List<dynamic> listConvertFiles = [];
  String validatorImage = '';
  final categoryKey = GlobalKey<FormState>();

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
    quantityProductController = TextEditingController(text: '1');

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCustomImage(),
                listFiles.isEmpty ? SizedBox.shrink() : _buildCustomNewImage(),
              ],
            ),
            validatorImage.isNotEmpty
                ? CustomText(
                    validatorImage,
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimen.verticalSpacing_5),
                    color: kErrorColor,
                    fontSize: FontSize.SMALL,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomImage() {
    return InkWell(
      onTap: () async {
        await ImageController.showBottomSheetManageImage(context);
        if (ImageController.file == null) return;
        setState(() {
          listFiles.add(ImageController.file!);
        });
        ImageController.file = null;
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
    return Row(
      children: listFiles.map((image) {
        return Padding(
          padding: const EdgeInsets.only(left: AppDimen.verticalSpacing_5),
          child: Container(
            height: 95.0,
            width: 95.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildListInput() {
    return Form(
      key: categoryKey,
      child: Column(
        children: [
          CustomInput(
            controller: nameProductController,
            labelText: 'Tên sản phẩm',
            margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
            maxLength: 70,
            validator: Validator.validateEmpty,
          ),
          CustomInput(
            controller: priceProductController,
            labelText: 'Giá (đ)',
            margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
            keyboardType: TextInputType.number,
            validator: Validator.validatePrice,
          ),
          CustomInput(
            controller: discountProductController,
            labelText: 'Giảm giá (%)',
            margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
            keyboardType: TextInputType.number,
            maxLength: 3,
          ),
          CustomInput(
            controller: descriptionProductController,
            hintText: 'Mô tả chi tiết sản phẩm',
            margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
            maxLines: 10,
            validator: Validator.validateEmpty,
          ),
          CustomInput(
            controller: quantityProductController,
            labelText: 'Số lượng',
            margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
            keyboardType: TextInputType.number,
          ),
          _buildSwitch(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Consumer<CategoryProvider>(
      builder: (ctx, provider, _) => PrimaryButton(
        title: 'Thêm sản phẩm mới',
        margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_2),
        onPressed: () async {
          String idUser = AuthController.idUser;
          if (categoryKey.currentState!.validate()) {
            if (listFiles.isEmpty) {
              setState(() {
                validatorImage = 'Vui lòng chọn ít nhất 1 ảnh';
              });
              return;
            } else {
              setState(() {
                validatorImage = '';
              });

              listFiles.asMap().forEach((index, image) async {
                final ref = FirebaseStorage.instance
                    .ref()
                    .child(FirebaseUtils.categoryImage)
                    .child('${idUser}_${nameProductController.text}_$index' +
                        '.jpg');
                await ref.putFile(image);
                await ref.getDownloadURL().then((url) {
                  setState(() {
                    listConvertFiles.add(url);
                  });
                });
              });

              await provider.createCategory(
                idUser: idUser,
                title: nameProductController.text,
                description: descriptionProductController.text,
                price: int.parse(priceProductController.text),
                priceSale: int.parse(discountProductController.text),
                imageUrl: listConvertFiles,
                quantity: int.parse(quantityProductController.text),
                status: status,
              );
              LoadingApp.LOADSUCCESS(title: 'Tạo mới sản phẩm thành công');
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context, true);
            }
          }
        },
      ),
    );
  }

  Widget _buildSwitch() {
    return Container(
      margin: const EdgeInsets.only(top: AppDimen.spacing_1),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kColorItemGrey,
          ),
        ),
      ),
      child: Row(
        children: [
          CustomText(
            'Trạng thái (Còn hàng): ',
            color: kTextColorGrey,
            fontSize: FontSize.MEDIUM - 1,
          ),
          const SizedBox(width: 6.0),
          _buildStatusCategory(),
        ],
      ),
    );
  }

  Widget _buildStatusCategory() {
    return Switch.adaptive(
        value: status,
        activeColor: kPrimaryColor,
        onChanged: (value) {
          setState(() {
            status = value;
          });
        });
  }
}