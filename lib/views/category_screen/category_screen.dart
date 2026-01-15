import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:ktechshop/consts/consts.dart';
import 'package:ktechshop/consts/lists.dart';
import 'package:ktechshop/consts/strings.dart';
import 'package:ktechshop/views/category_screen/categories_detail.dart';
import 'package:ktechshop/widgets_common/bg_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200), 
            itemBuilder: (context, index){
              return Column(
                children: [
                  Image.asset(cateImages[index], height: 150, width: 200, fit: BoxFit.cover,),
                  10.heightBox,
                  "${cateList[index]}".text.color(darkFontGrey).align(TextAlign.center).make()
                ],
              ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap((){Get.to(()=>CategoriesDetail(title: cateList[index]));});
            }),
        ),
      )
    );
  }
}