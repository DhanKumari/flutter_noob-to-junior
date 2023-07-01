import 'package:flutter/material.dart';

class CategoryModel {
  String name; // there r 3 parameters: name icon n color
  String iconPath;
  Color boxColor;

//constructor of the class
  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'smurf',
        iconPath: 'assets/icons/smurf.svg',
        boxColor: Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: 'kitty',
        iconPath: 'assets/icons/kitty.svg',
        boxColor: Color(0xffC58BF2)));

    categories.add(CategoryModel(
        name: 'ginie',
        iconPath: 'assets/icons/genie.svg',
        boxColor: Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: 'frog',
        iconPath: 'assets/icons/frog.svg',
        boxColor: Color(0xffC58BF2)));

    return categories;
  }
}
