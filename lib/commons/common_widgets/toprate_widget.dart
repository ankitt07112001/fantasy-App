import 'package:cached_network_image/cached_network_image.dart';
import 'package:fantacy_user/app/modules/home/controllers/home_controller.dart';
import 'package:fantacy_user/commons/SvgString.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopRate_widget extends GetView<HomeController> {
  final backgroundcolor;
  final String image;
  final loaderclr;
  final isonline;
  final namelabelshow;
  const TopRate_widget({
    super.key,
    this.backgroundcolor,
    required this.image,
    this.isonline = false,
    this.loaderclr,
    this.namelabelshow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.px,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: 190.px,
            width: 158.px,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: backgroundcolor,
                border: Border.all(
                    width: 0.2,
                    color: controller.appColors.grey.withOpacity(0.2))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                height: 190.px,
                width: 158.px,
                imageUrl: image,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      color: loaderclr, value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          if (isonline)
            Positioned(top: 10, right: 10, child: SvgPicture.string(onlinesvg)),
          if (namelabelshow)
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: controller.appColors.lightpink.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          child: MyTextView(
                            'Alina' + ',',
                            fontfamilyname: 'Montserrat',
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.txtwhite,
                              textWeight: FontWeight.w500,
                              textSize: 15.px,
                            ),
                            textAlignNew: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 10,
                          child: MyTextView(
                            '20',
                            fontfamilyname: 'Montserrat',
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.txtwhite,
                              textWeight: FontWeight.w500,
                              textSize: 15.px,
                            ),
                            textAlignNew: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 0, right: 3),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: controller.appColors.lightpink.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: controller.appColors.yellow,
                        ),
                        // MyTextView(
                        //   '4.7',
                        //   isMaxLineWrap: true,
                        //   fontfamilyname: 'Montserrat',
                        //   textStyleNew: MyTextStyle(
                        //     textColor: controller.appColors.txtwhite,
                        //     textWeight: FontWeight.w500,
                        //     textSize: 14.px,
                        //   ),
                        //   textAlignNew: TextAlign.center,
                        // ),
                      ],
                    ),
                  ).paddingOnly(right: 0),
                ],
              ).paddingSymmetric(horizontal: 3, vertical: 5),
            ).paddingOnly(bottom: 5)
        ],
      ).paddingSymmetric(horizontal: 1),
    );
  }
}
