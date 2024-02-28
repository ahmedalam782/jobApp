import 'package:flutter/material.dart';

class ContentButtonListModel {
  final Widget? image;
  final String title;
  final String routeName;
  final String text;

  ContentButtonListModel(
      {this.text = '', this.routeName = '', required this.title, this.image});
}
