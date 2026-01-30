import 'package:flutter/material.dart';
import 'package:ktechshop/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "00".text.fontFamily(bold).color(darkFontGrey).size(16).make(),
          "In your cart".text.color(darkFontGrey).make(),
        ],
      ).box.white.rounded
      .width(width / 3.5)
      .height(60)
      .padding(const EdgeInsets.all(8))
      .make();
}
