import 'package:flutter/material.dart';
import 'package:ktechshop/consts/consts.dart';
import 'package:ktechshop/consts/lists.dart';
import 'package:ktechshop/views/home_screen/components/feature_button.dart';
import 'package:ktechshop/widgets_common/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searching,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child:
                              Image.asset(sliderList[index], fit: BoxFit.fill)
                                  .box
                                  .rounded
                                  .clip(Clip.antiAlias)
                                  .margin(
                                    const EdgeInsets.symmetric(horizontal: 8),
                                  )
                                  .make(),
                        );
                      },
                    ),
                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todayDeal : flashsale,
                        ),
                      ),
                    ),
                    10.heightBox,

                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child:
                              Image.asset(
                                    secondSliderList[index],
                                    fit: BoxFit.fill,
                                  ).box.rounded
                                  .clip(Clip.antiAlias)
                                  .margin(
                                    const EdgeInsets.symmetric(horizontal: 8),
                                  )
                                  .make(),
                        );
                      },
                    ),
                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 3.5,
                          icon: index == 0
                              ? icTopCategories
                              : index == 1
                              ? icBrands
                              : icTopSeller,
                          title: index == 0
                              ? topCategory
                              : index == 1
                              ? brand
                              : topSallers,
                        ),
                      ),
                    ),

                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          2,
                          (index) => Column(
                            children: [
                              featuredButton(
                                icon: featuredImages1[index],
                                title: featuredTitles1[index],
                              ),
                              10.heightBox,
                              featuredButton(
                                icon: featuredImages2[index],
                                title: featuredTitles2[index],
                              ),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(18),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featureProducts.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                6,
                                (index) =>
                                    Column(
                                          children: [
                                            Image.asset(
                                              imgP1,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            10.heightBox,
                                            "Laptop 4GB/64GB".text
                                                .fontFamily(semibold)
                                                .color(darkFontGrey)
                                                .make(),
                                            "\$599".text
                                                .fontFamily(semibold)
                                                .color(redColor)
                                                .size(16)
                                                .make(),
                                          ],
                                        ).box.white
                                        .margin(
                                          const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                        )
                                        .rounded
                                        .padding(const EdgeInsets.all(8))
                                        .make(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child:
                              Image.asset(
                                    secondSliderList[index],
                                    fit: BoxFit.fill,
                                  ).box.rounded
                                  .clip(Clip.antiAlias)
                                  .margin(
                                    const EdgeInsets.symmetric(horizontal: 8),
                                  )
                                  .make(),
                        );
                      },
                    ),
                    20.heightBox,

                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300,
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP5,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                const Spacer(),
                                "Laptop 4GB/64GB".text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                "\$599".text
                                    .fontFamily(semibold)
                                    .color(redColor)
                                    .size(16)
                                    .make(),
                              ],
                            ).box.white
                            .margin(const EdgeInsets.symmetric(horizontal: 6))
                            .rounded
                            .padding(const EdgeInsets.all(12))
                            .make();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
