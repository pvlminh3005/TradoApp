import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_icon.dart';
import '/components/custom_image_network.dart';
import '/controllers/convert_file_image.dart';
import '/models/category_model.dart';
import '/controllers/auth_controller.dart';
import '/providers/category_provider.dart';
import '/components/loading/loading_app.dart';
import '/components/custom_input.dart';
import '/components/custom_text.dart';
import '/components/primary_button.dart';
import '/constants/sizes.dart';
import '/utils/validator.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/controllers/choose_image_controller.dart';
import '/widgets/appbar_widget.dart';

enum EditCategoryType {
  NEWCATEGORY,
  EDITCATEGORY,
}

class EditMyCategoryScreen extends StatefulWidget {
  final CategoryModel? category;
  final EditCategoryType type;

  EditMyCategoryScreen({
    this.category,
    this.type = EditCategoryType.NEWCATEGORY,
    Key? key,
  }) : super(key: key);

  @override
  State<EditMyCategoryScreen> createState() => _EditMyCategoryScreenState();
}

class _EditMyCategoryScreenState extends State<EditMyCategoryScreen> {
  bool status = true;
  List<File> listFiles = [];
  List<dynamic> listConvertFiles = []; //memory save url post to api
  List<dynamic> listInitImages = []; //memory save image when initState
  String validatorImage = '';
  final categoryKey = GlobalKey<FormState>();

  late TextEditingController nameProductController;
  late TextEditingController priceProductController;
  late TextEditingController discountProductController;
  late TextEditingController descriptionProductController;
  late TextEditingController quantityProductController;

  @override
  void initState() {
    if (widget.type == EditCategoryType.EDITCATEGORY) {
      nameProductController =
          TextEditingController(text: widget.category!.title);
      priceProductController =
          TextEditingController(text: widget.category!.price.toString());
      discountProductController =
          TextEditingController(text: widget.category!.priceSale.toString());
      descriptionProductController =
          TextEditingController(text: widget.category!.description);
      quantityProductController =
          TextEditingController(text: widget.category!.quantity.toString());

      setState(() {
        listInitImages = widget.category!.imageUrl;
      });
    } else {
      initController();
    }

    super.initState();
  }

  void initController() {
    nameProductController = TextEditingController();
    priceProductController = TextEditingController();
    discountProductController = TextEditingController();
    descriptionProductController = TextEditingController();
    quantityProductController = TextEditingController(text: '1');
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
                _buildInitImages(),
                _buildCustomNewImage(),
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
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
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
              CustomIcon(
                Icons.highlight_remove_rounded,
                color: Colors.white,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildInitImages() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: listInitImages.map((image) {
        return Padding(
          padding: const EdgeInsets.only(left: AppDimen.verticalSpacing_5),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
                child: CustomImageNetWork(
                  width: 95.0,
                  height: 95.0,
                  image: image,
                ),
              ),
              CustomIcon(
                Icons.highlight_remove_rounded,
                color: Colors.white,
                size: AppDimen.icon_size_big,
              ),
            ],
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
    return widget.type == EditCategoryType.NEWCATEGORY
        ? Consumer<CategoryProvider>(
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

                    for (var index = 0; index < listFiles.length; index++) {
                      final String url =
                          '${idUser}_${nameProductController.text}_$index';
                      await ConvertFileImageToString.addImageToStorage(
                        url: url,
                        file: listFiles[index],
                      );
                      var data =
                          await ConvertFileImageToString.convertFileToSring(
                              url: url);
                      setState(() {
                        listConvertFiles.add(data);
                      });
                    }

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

                    LoadingApp.LOADSUCCESS(
                        title: 'Tạo mới sản phẩm thành công');
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pop(context, true);
                  }
                }
              },
            ),
          )
        : _buildEditButton();
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

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: Row(
        children: [
          Consumer<CategoryProvider>(
            builder: (ctx, provider, _) => Flexible(
              child: PrimaryButton(
                title: 'Chỉnh sửa',
                onPressed: () async {},
              ),
            ),
          ),
          const SizedBox(width: 6.0),
          Consumer<CategoryProvider>(
            builder: (ctx, provider, _) => Flexible(
              child: PrimaryButton(
                title: 'Xoá',
                backgroundColor: kErrorColor,
                onPressed: () async {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
