import 'package:fantacy_user/app/modules/Profile/controllers/profile_controller.dart';
// ignore: unused_import
import 'package:fantacy_user/app/modules/modellist/controllers/modellist_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';

class Model_Profile_detail extends GetView<ProfileController> {
  const Model_Profile_detail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MyTextView(
                'Jessica Parker,23',
                isMaxLineWrap: true,
                textStyleNew: MyTextStyle(
                  textColor: controller.appColors.black,
                  textWeight: FontWeight.w600,
                  textSize: 24.px,
                ),
                textAlignNew: TextAlign.start,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: controller.appColors.appColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_1,
                    color: controller.appColors.white,
                  ).paddingOnly(right: 4),
                  MyTextView(
                    Strings.follow,
                    isMaxLineWrap: true,
                    textStyleNew: MyTextStyle(
                      textColor: controller.appColors.white,
                      textWeight: FontWeight.w600,
                      textSize: 16.px,
                    ),
                    textAlignNew: TextAlign.center,
                  ),
                ],
              ).paddingSymmetric(vertical: 5, horizontal: 14),
            )
          ],
        ),
        Container(
          width: size.width * 0.6,
          child: MyTextView(
            "Hello! I'm fantasy Qeen, And be your Fantasy-Qeen!",
            isMaxLineWrap: true,
            textStyleNew: MyTextStyle(
              textColor: controller.appColors.black,
              textWeight: FontWeight.w500,
              textSize: 16.px,
            ),
            textAlignNew: TextAlign.start,
          ),
        ).paddingOnly(top: 5, bottom: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: controller.appColors.lightpink.withOpacity(0.3)),
              child: Row(
                children: [
                  Image.asset(
                    ImagePath.coinimg,
                    height: 40,
                    width: 50,
                  ),
                  MyTextView(
                    "10 Coins/ min",
                    isMaxLineWrap: true,
                    textStyleNew: MyTextStyle(
                      textColor: controller.appColors.lightgrey,
                      textWeight: FontWeight.w600,
                      textSize: 16.px,
                    ),
                    textAlignNew: TextAlign.start,
                  )
                ],
              ).paddingOnly(right: 30),
            ),
            Row(
              children: [
                Icon(
                  Icons.favorite_border_outlined,
                  color: controller.appColors.lightergrey,
                ).paddingOnly(right: 5),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: controller.appColors.lightpink.withOpacity(0.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: controller.appColors.yellow,
                      ),
                      MyTextView(
                        "4.7",
                        isMaxLineWrap: true,
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.darkblue,
                          textWeight: FontWeight.w600,
                          textSize: 14.px,
                        ),
                        textAlignNew: TextAlign.start,
                      ).paddingOnly(right: 2)
                    ],
                  ).paddingSymmetric(horizontal: 8, vertical: 2),
                )
              ],
            )
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 10, vertical: 10);
  }
}
