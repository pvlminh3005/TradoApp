import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/controllers/choose_image_controller.dart';
import '/widgets/appbar_widget.dart';

class EditMyCategoryScreen extends StatefulWidget {
  late List<Widget>? list;
  EditMyCategoryScreen({
    this.list = const <Widget>[],
    Key? key,
  }) : super(key: key);

  @override
  State<EditMyCategoryScreen> createState() => _EditMyCategoryScreenState();
}

class _EditMyCategoryScreenState extends State<EditMyCategoryScreen> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.spacing_2,
        vertical: AppDimen.spacing_1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageProduct(),
        ],
      ),
    );
  }

  Widget _buildImageProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCustomImage(),
          widget.list!.isEmpty
              ? SizedBox.shrink()
              : Row(children: widget.list!),
        ],
      ),
    );
  }

  Widget _buildCustomImage() {
    return InkWell(
      onTap: () async {
        await ImageController.showBottomSheetManageImage(context);
        setState(() {
          widget.list!.add(
            Container(
              width: 90,
              height: 90,
              child: Image.file(ImageController.file!, fit: BoxFit.cover),
            ),
          );
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
}
