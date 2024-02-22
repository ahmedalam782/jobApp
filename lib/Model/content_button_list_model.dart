import 'package:flutter/material.dart';

class ContentButtonListModel {
  final Widget? image;
  final String title;
  final String routeName;

  ContentButtonListModel(
      {required this.routeName, required this.title, this.image});
}
