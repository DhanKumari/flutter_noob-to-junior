import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String strength;
  Color boxColor;
  bool viewIsSelected; //it will change the color of view button 

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.strength,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List < DietModel > getDiets() {
    List < DietModel > diets = [];

    diets.add(
      DietModel(
       name: 'iron man',
       iconPath: 'assets/icons/iron man.svg',
       level: 'Easy',
       duration: '30mins',
       strength: '180',
       viewIsSelected: true,
       boxColor: Color(0xff9DCEFF)
      )
    );

    diets.add(
      DietModel(
       name: 'mummy',
       iconPath: 'assets/icons/mummy.svg',
       level: 'Easy',
       duration: '20mins',
       strength: '230',
       viewIsSelected: false,
       boxColor: Color(0xffEEA4CE)
      )
    );

    return diets;
  }
}