import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_input.dart';
import '/components/custom_text.dart';
import '/components/primary_button.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/providers/shipping_address_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';

class AddShippingAddressScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String address;
  final String note;

  const AddShippingAddressScreen({
    this.name = '',
    this.phone = '',
    this.address = '',
    this.note = '',
    Key? key,
  }) : super(key: key);

  @override
  State<AddShippingAddressScreen> createState() =>
      _AddShippingAddressScreenState();
}

class _AddShippingAddressScreenState extends State<AddShippingAddressScreen> {
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
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildInput() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            InputAddressWidget(
              title: 'Họ và tên',
              controller: nameController,
            ),
            InputAddressWidget(
              title: 'Số điện thoại',
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
            InputAddressWidget(
              title: 'Địa chỉ nhận hàng',
              controller: addressController,
            ),
            InputAddressWidget(
              title: 'Ghi chú thêm',
              controller: noteController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Consumer<ShippingAddressProvider>(builder: (ctx, provider, _) {
      Future<void> onPressed() async {
        await provider.addNewAddress(
          name: nameController.text,
          phone: phoneController.text,
          address: addressController.text,
          note: noteController.text,
        );
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: CustomText('Thêm địa chỉ thành công!',
                  align: TextAlign.center),
            );
          },
        );
        await Future.delayed(Duration(milliseconds: 1500));
        Navigator.of(context).popAndPushNamed(RouteManage.my_profile);
      }

      return PrimaryButton(
        onPressed: onPressed,
        title: 'Thêm địa chỉ',
      );
    });
  }
}

class InputAddressWidget extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  const InputAddressWidget({
    this.title,
    this.controller,
    this.keyboardType = TextInputType.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      controller: controller,
      labelText: title!,
      backgroundColor: kBackgroundColorWhite,
      borderWidth: 1,
      borderColor: kColorItemGrey,
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_16),
      fontSize: FontSize.SMALL_1,
      fontWeight: FontWeight.w700,
      keyboardType: keyboardType,
    );
  }
}