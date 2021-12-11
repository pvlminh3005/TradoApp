import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_icon.dart';
import '/constants/constants.dart';
import '/controllers/choose_image_controller.dart';

enum AvatarType { normalAvatar, editAvatar }

class CustomAvatar extends StatefulWidget {
  final double radius;
  final AvatarType type;
  final String imageUrl;

  const CustomAvatar({
    this.radius = 50,
    this.type = AvatarType.normalAvatar,
    this.imageUrl = '',
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  File? chooseImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: widget.radius,
          backgroundImage: chooseImage == null
              ? widget.imageUrl.isEmpty
                  ? AssetImage('assets/images/unknown_person.jpeg')
                  : CachedNetworkImageProvider(
                      widget.imageUrl,
                      errorListener: () => CustomIcon(
                        Icons.error,
                        color: kErrorColor,
                      ),
                    ) as ImageProvider
              : FileImage(chooseImage!),
        ),
        widget.type == AvatarType.editAvatar
            ? InkWell(
                onTap: () async {
                  final image = await ImageController.openImageFromGallery();
                  setState(() {
                    chooseImage = image;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: kBackgroundColorWhite,
                  radius: 13,
                  child: Icon(
                    Icons.edit,
                    color: kPrimaryColor,
                    size: 15,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
