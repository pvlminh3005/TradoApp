import 'package:flutter/material.dart';

class InfoModel {
  final String title;
  final IconData icon;
  final bool isChecked;
  final String routeName;

  InfoModel({
    required this.title,
    required this.icon,
    required this.isChecked,
    required this.routeName,
  });
}

final List<InfoModel> listInfo = [
  InfoModel(
    title: 'CMND',
    icon: Icons.perm_contact_cal_rounded,
    isChecked: false,
    routeName: '',
  ),
  InfoModel(
    title: 'Điện thoại',
    icon: Icons.phone,
    isChecked: false,
    routeName: '',
  ),
  InfoModel(
    title: 'Địa chỉ',
    icon: Icons.pin_drop,
    isChecked: true,
    routeName: '',
  ),
  InfoModel(
    title: 'Email',
    icon: Icons.email,
    isChecked: true,
    routeName: '',
  ),
];
