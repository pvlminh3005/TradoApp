import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/loading/loading_app.dart';
import 'package:trado_app_uit/utils/validator.dart';
import '/components/custom_alert.dart';
import '/components/custom_input.dart';
import '/components/primary_button.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/providers/shipping_address_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';

class AddShippingAddressScreen extends StatefulWidget {
  final String? id;
  final String name;
  final String phone;
  final String address;
  final String note;
  final bool isEditAddress;

  const AddShippingAddressScreen({
    this.id,
    this.name = '',
    this.phone = '',
    this.address = '',
    this.note = '',
    this.isEditAddress = false,
    Key? key,
  }) : super(key: key);

  @override
  State<AddShippingAddressScreen> createState() =>
      _AddShippingAddressScreenState();
}

class _AddShippingAddressScreenState extends State<AddShippingAddressScreen> {
  final addressKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController noteController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    addressController = TextEditingController(text: widget.address);
    noteController = TextEditingController(text: widget.note);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      title: 'Thông tin địa chỉ giao hàng',
      background: kBackgroundColorWhite,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.spacing_2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInput(),
          Column(
            children: [
              _buildButtonAdd(),
              widget.isEditAddress
                  ? _buildButtonRemove()
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInput() {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: addressKey,
          child: Column(
            children: [
              InputAddressWidget(
                title: 'Họ và tên',
                controller: nameController,
                validator: Validator.validateName,
              ),
              InputAddressWidget(
                title: 'Số điện thoại',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: Validator.validateEmpty,
              ),
              InputAddressWidget(
                title: 'Địa chỉ nhận hàng',
                controller: addressController,
                validator: Validator.validateEmpty,
              ),
              InputAddressWidget(
                controller: noteController,
                hintTitle: 'Ghi chú thêm',
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonAdd() {
    return Consumer<ShippingAddressProvider>(builder: (ctx, provider, _) {
      Future<void> onPressed() async {
        if (addressKey.currentState!.validate()) {
          await provider.addNewAddress(
            name: nameController.text,
            phone: phoneController.text,
            address: addressController.text,
            note: noteController.text,
          );
          LoadingApp.LOADSUCCESS(title: 'Thêm địa chỉ thành công');
          await Future.delayed(Duration(milliseconds: 1500));
          Navigator.of(context).popAndPushNamed(RouteManage.my_profile);
        }
      }

      return PrimaryButton(
        onPressed: onPressed,
        showShadow: false,
        margin:
            const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_5),
        title: 'Thêm địa chỉ',
      );
    });
  }

  Widget _buildButtonRemove() {
    return Consumer<ShippingAddressProvider>(builder: (ctx, provider, _) {
      Future<void> onPressed() async {
        showDialog(
          context: context,
          builder: (context) {
            return CustomAlert(
              subContent: 'Bạn có chắc muốn xoá địa chỉ này không?',
              onPressed: () async {
                await provider.removeAddress(widget.id!);
                await Future.delayed(Duration(milliseconds: 1500));
                Navigator.of(context)
                    .popAndPushNamed(RouteManage.shipping_address);
              },
            );
          },
        );
      }

      return PrimaryButton(
        onPressed: onPressed,
        margin:
            const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_5),
        backgroundColor: kErrorColor,
        showShadow: false,
        title: 'Xoá địa chỉ',
      );
    });
  }
}

class InputAddressWidget extends StatelessWidget {
  final String title;
  final String hintTitle;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;

  const InputAddressWidget({
    this.title = '',
    this.hintTitle = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      controller: controller,
      labelText: title,
      hintText: hintTitle,
      backgroundColor: kBackgroundColorWhite,
      borderWidth: 1,
      borderColor: kColorItemGrey,
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_16),
      fontSize: FontSize.SMALL_1,
      fontWeight: FontWeight.w700,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
    );
  }
}
