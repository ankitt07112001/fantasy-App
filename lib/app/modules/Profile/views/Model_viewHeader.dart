import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantacy_user/app/modules/Profile/controllers/profile_controller.dart';
import 'package:fantacy_user/app/modules/modellist/controllers/modellist_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';

class Model_Profile_Header extends GetView<ProfileController> {
  const Model_Profile_Header({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 300,
              child: Container(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      // width: screenWidthPercentage(context, percentage: 1),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: 900,
                            viewportFraction: 1.0,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true),
                        items: controller.carousel.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: size.width,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  // i -- use form image
                                  imageUrl: i,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60.0, left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              Get.back();
                            }),
                            child: Container(
                                child: Icon(
                              Icons.arrow_back,
                              color: controller.appColors.white,
                            )).paddingOnly(bottom: 8),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     widget.onlike!();
                          //   },
                          //   child: Container(
                          //       child: widget.islike
                          //           ? SvgPicture.string(
                          //               fillheartbackgroundsvg,
                          //               height: 40,
                          //             )
                          //           : SvgPicture.string(
                          //               unfillheartbackgroundsvg,
                          //               height: 40,
                          //             )),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 35,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: controller.appColors.appColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextView(
                        Strings.like,
                        isMaxLineWrap: true,
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.white,
                          textWeight: FontWeight.w600,
                          textSize: 16.px,
                        ),
                        textAlignNew: TextAlign.center,
                      ).paddingOnly(left: 5),
                      MyTextView(
                        '20',
                        isMaxLineWrap: true,
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.white,
                          textWeight: FontWeight.w600,
                          textSize: 16.px,
                        ),
                        textAlignNew: TextAlign.center,
                      ).paddingOnly(left: 5),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: controller.appColors.appColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextView(
                        Strings.followers,
                        isMaxLineWrap: true,
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.white,
                          textWeight: FontWeight.w600,
                          textSize: 16.px,
                        ),
                        textAlignNew: TextAlign.center,
                      ).paddingOnly(left: 5),
                      MyTextView(
                        '20',
                        isMaxLineWrap: true,
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.white,
                          textWeight: FontWeight.w600,
                          textSize: 16.px,
                        ),
                        textAlignNew: TextAlign.center,
                      ).paddingOnly(left: 5),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: controller.appColors.appColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextView(
                        Strings.following,
                        isMaxLineWrap: true,
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.white,
                          textWeight: FontWeight.w600,
                          textSize: 16.px,
                        ),
                        textAlignNew: TextAlign.center,
                      ).paddingOnly(left: 5),
                      MyTextView(
                        '20',
                        isMaxLineWrap: true,
                        fontfamilyname: 'Montserrat',
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.white,
                          textWeight: FontWeight.w600,
                          textSize: 16.px,
                        ),
                        textAlignNew: TextAlign.center,
                      ).paddingOnly(left: 5),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10).paddingSymmetric(vertical: 10),
          ),
        ),
      ],
    );
  }
}
