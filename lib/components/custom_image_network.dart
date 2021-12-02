import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/widgets/loading_page.dart';

import 'custom_icon.dart';

class CustomImageNetWork extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;

  const CustomImageNetWork({
    this.image,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image!,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: (ctx, url, error) => CustomIcon(
        Icons.error,
        color: kErrorColor,
      ),
      placeholder: (ctx, _) => LoadingPage(),
    );
  }
}
