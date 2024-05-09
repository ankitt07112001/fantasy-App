import 'package:fantacy_user/app/modules/home/controllers/home_controller.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/toprate_widget.dart';
import 'package:fantacy_user/commons/imageUrl.dart';

class HomeTopRateList extends GetView<HomeController> {
  const HomeTopRateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextView(
              Strings.toprated,
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
                  arguments: Strings.toprated,
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
                      onTap: () {
                        Get.toNamed(Routes.MODELDETAIL);
                      },
                      child: TopRate_widget(
                        backgroundcolor: controller.appColors.grey,
                        image: topRateUrl,
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
    ).paddingSymmetric(horizontal: 15, vertical: 10);
  }
}
