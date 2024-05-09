import 'package:fantacy_user/app/modules/home/controllers/home_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/toprate_widget.dart';
import 'package:fantacy_user/commons/imageUrl.dart';

import '../../../routes/app_pages.dart';

class HomeRecommendedList extends GetView<HomeController> {
  const HomeRecommendedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextView(
              Strings.recommended,
              isMaxLineWrap: true,
              fontfamilyname: 'Montserrat',
              textStyleNew: MyTextStyle(
                textColor: controller.appColors.darkblue,
                textWeight: FontWeight.w500,
                textSize: 18.px,
              ),
              textAlignNew: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.MODELLIST,
                  arguments: Strings.recommended,
                );
              },
              child: MyTextView(
                Strings.seeall,
                isMaxLineWrap: true,
                fontfamilyname: 'Montserrat',
                textStyleNew: MyTextStyle(
                  textColor: controller.appColors.lightblue,
                  textWeight: FontWeight.w500,
                  textSize: 16.px,
                ),
                textAlignNew: TextAlign.center,
              ),
            )
          ],
        ).paddingSymmetric(vertical: 5),
        Container(
          height: 190.px,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: TopRate_widget(
                        backgroundcolor: controller.appColors.grey,
                        image: recommendedUrl,
                        loaderclr: controller.appColors.appColor,
                        isonline: true,
                        namelabelshow: true,
                      ),
                    )
                  ],
                );
              }),
        )
      ],
    ).paddingSymmetric(horizontal: 15);
  }
}
