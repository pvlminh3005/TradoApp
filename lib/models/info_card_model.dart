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
