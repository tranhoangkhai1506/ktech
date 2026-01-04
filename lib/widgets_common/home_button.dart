import 'package:flutter/material.dart';
import 'package:ktechshop/consts/consts.dart';

Widget homeButton({width, height, icon,String? title, onPress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26,),
        5.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
    ).box.rounded.white.size(width, height).make();
}