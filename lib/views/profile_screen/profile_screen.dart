import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktechshop/consts/consts.dart';
import 'package:ktechshop/consts/lists.dart';
import 'package:ktechshop/controllers/auth_controller.dart';
import 'package:ktechshop/views/auth_screen/login_screen.dart';
import 'package:ktechshop/views/profile_screen/components/details_card.dart';
import 'package:ktechshop/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.edit, color: whiteColor),
                ).onTap(() {}),
                Row(
                  children: [
                    Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Kaaka".text.fontFamily(semibold).white.make(),
                          "kaakadev@gmail.com".text
                              .fontFamily(semibold)
                              .white
                              .make(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: whiteColor),
                      ),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => LoginScreen());
                      },
                      child: logout.text.fontFamily(semibold).white.make(),
                    ),
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailsCard(
                      width: context.screenWidth,
                      count: "00",
                      title: "In your card",
                    ),
                    detailsCard(
                      width: context.screenWidth,
                      count: "20",
                      title: "In your wishlist",
                    ),
                    detailsCard(
                      width: context.screenWidth,
                      count: "202",
                      title: "your orders",
                    ),
                  ],
                ),
                30.heightBox,
                ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider(color: lightGrey);
                      },
                      itemCount: profileButtonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.asset(
                            profileButtonIcon[index],
                            width: 22,
                          ),
                          title: "${profileButtonList[index]}".text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                        );
                      },
                    ).box.white.rounded
                    .padding(const EdgeInsetsGeometry.symmetric(horizontal: 16))
                    .shadowSm
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
