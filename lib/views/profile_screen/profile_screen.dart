import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktechshop/consts/consts.dart';
import 'package:ktechshop/consts/lists.dart';
import 'package:ktechshop/controllers/auth_controller.dart';
import 'package:ktechshop/controllers/profile_controller.dart';
import 'package:ktechshop/services/firestore_services.dart';
import 'package:ktechshop/views/auth_screen/login_screen.dart';
import 'package:ktechshop/views/profile_screen/components/details_card.dart';
import 'package:ktechshop/views/profile_screen/edit_profile_screen.dart';
import 'package:ktechshop/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  );
                } else {
                  var userInfors = snapshot.data!.docs[0];

                  return SafeArea(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.edit, color: whiteColor),
                          ).onTap(() async {
                            controller.nameController.text = userInfors['name'];
                            controller.passController.text =
                                userInfors['password'];
                            Get.to(() => EditProfileScreen(data: userInfors));
                          }),
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
                                    "${userInfors['name']}".text
                                        .fontFamily(semibold)
                                        .white
                                        .make(),
                                    "${userInfors['email']}".text
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
                                  await Get.put(
                                    AuthController(),
                                  ).signoutMethod(context);
                                  Get.offAll(() => LoginScreen());
                                },
                                child: logout.text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                              ),
                            ],
                          ),
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              detailsCard(
                                width: context.screenWidth,
                                count: userInfors['cart_count'],
                                title: "In your cart",
                              ),
                              detailsCard(
                                width: context.screenWidth,
                                count: userInfors['wishlist_count'],
                                title: "In your wishlist",
                              ),
                              detailsCard(
                                width: context.screenWidth,
                                count: userInfors['orders_count'],
                                title: "Your orders",
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
                              .padding(
                                const EdgeInsetsGeometry.symmetric(
                                  horizontal: 16,
                                ),
                              )
                              .shadowSm
                              .make(),
                        ],
                      ),
                    ),
                  );
                }
              },
        ),
      ),
    );
  }
}
