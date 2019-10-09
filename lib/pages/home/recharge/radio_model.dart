import 'package:flutter/material.dart';

class RadioModel {
  bool isSelected;
  final Image radioIcon;
  final String text;
  final Color selectedColor;

  RadioModel(this.isSelected, this.radioIcon, this.text, this.selectedColor);
}