import 'dart:io';

import 'package:fantacy_user/app/modules/modellist/controllers/modellist_controller.dart';
import 'package:fantacy_user/commons/SvgString.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../commons/all.dart';
import '../../../../commons/common_widgets/base_widgets.dart';
import '../../../../commons/get_storage_data.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/bottom_controller.dart';

var isBottom = false;

class BottomScreen extends GetView<BottomController> {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Utils.backWholeApp();
      },
      child: GetBuilder<BottomController>(
        assignId: true,
        builder: (_) {
          return BaseScreen(
            bottomNavigationBar: Container(
              height: Platform.isIOS
                  ? 60.px + MediaQuery.of(context).padding.bottom
                  : 65.px + MediaQuery.of(context).padding.bottom,
              decoration: BoxDecoration(
                color: controller.appColors.white,
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(15.px),
                //   topLeft: Radius.circular(15.px),
                // ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.screenIndex.value = 0;
                        controller.isMarkerDiscount = true;
                        Get.put<HomeController>(HomeController());
                        HomeController().onInit();
                        isBottom = false;
                        controller.update();
                      },
                      child: Column(
                        children: [
                          controller.screenIndex.value == 0
                              ? ClipPath(
                                  clipper: CustomHalfCircleClipper(),
                                  child: Container(
                                    height: 10,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: controller.appColors.appColor,
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width /
                                              2),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 10,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.string(
                            homesvg ?? "",
                            height: 28.px,
                            width: 28.px,
                            color: controller.screenIndex.value == 0
                                ? controller.appColors.appColor
                                : controller.appColors.grey.withOpacity(0.5),
                          ),
                          // Image.asset(
                          //   ImagePath.icMapMarker,
                          //   height: 28.px,
                          //   width: 28.px,
                          //   color: controller.screenIndex.value == 0
                          //       ? controller.appColors.buttonColor
                          //       : controller.appColors.grey.withOpacity(0.5),
                          // ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.screenIndex.value = 1;
                        // if (GetStorageData().containKey(GetStorageData().loginData)) {
                        Get.put<ModellistController>(ModellistController());
                        ModellistController().onInit();
                        isBottom = true;

                        //   controller.update();
                        // } else {
                        //   // loginUserDialog();
                        // }

                        controller.update();
                      },
                      child: Column(
                        children: [
                          controller.screenIndex.value == 1
                              ? ClipPath(
                                  clipper: CustomHalfCircleClipper(),
                                  child: Container(
                                    height: 10,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: controller.appColors.appColor,
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width /
                                              2),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 10,
                                ),
                          const SizedBox(
                            height: 10,
                          ),

                          SvgPicture.string(
                            likesvg ?? "",
                            height: 28.px,
                            width: 28.px,
                            color: controller.screenIndex.value == 1
                                ? controller.appColors.appColor
                                : controller.appColors.grey.withOpacity(0.5),
                          ),

                          // Image.asset(
                          //   ImagePath.indicator,
                          //   height: 28.px,
                          //   width: 28.px,
                          //   color: controller.screenIndex.value == 1
                          //       ? controller.appColors.buttonColor
                          //       : controller.appColors.grey.withOpacity(0.5),
                          // ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.screenIndex.value = 2;
                        isBottom = false;
                        if (GetStorageData()
                            .containKey(GetStorageData().loginData)) {
                          controller.isMarkerDiscount = false;
                          // Get.put<CameraBottomController>(CameraBottomController());
                          controller.update();
                        } else {
                          // loginUserDialog();
                        }

                        controller.update();
                      },
                      child: Column(
                        children: [
                          controller.screenIndex.value == 2
                              ? ClipPath(
                                  clipper: CustomHalfCircleClipper(),
                                  child: Container(
                                    height: 10,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: controller.appColors.appColor,
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width /
                                              2),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 10,
                                ),
                          const SizedBox(
                            height: 10,
                          ),

                          SvgPicture.string(
                            chatsvg ?? "",
                            height: 28.px,
                            width: 28.px,
                            color: controller.screenIndex.value == 2
                                ? controller.appColors.appColor
                                : controller.appColors.grey.withOpacity(0.5),
                          ),

                          // Image.asset(
                          //   ImagePath.camera,
                          //   height: 28.px,
                          //   width: 28.px,
                          //   color: controller.screenIndex.value == 2
                          //       ? controller.appColors.buttonColor
                          //       : controller.appColors.grey.withOpacity(0.5),
                          // ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.screenIndex.value = 3;
                        isBottom = false;
                        // Get.put<CloudHomeController>(CloudHomeController());
                        controller.update();
                      },
                      child: Column(
                        children: [
                          controller.screenIndex.value == 3
                              ? ClipPath(
                                  clipper: CustomHalfCircleClipper(),
                                  child: Container(
                                    height: 10,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: controller.appColors.appColor,
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width /
                                              2),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 10,
                                ),
                          const SizedBox(
                            height: 10,
                          ),

                          SvgPicture.string(
                            profile,
                            height: 28.px,
                            width: 28.px,
                            color: controller.screenIndex.value == 3
                                ? controller.appColors.appColor
                                : controller.appColors.grey.withOpacity(0.5),
                          ),
                          // Image.asset(
                          //   ImagePath.icDownload,
                          //   height: 28.px,
                          //   width: 28.px,
                          //   color: controller.screenIndex.value == 3
                          //       ?controller.appColors.buttonColor
                          //       :controller.appColors.grey.withOpacity(0.5),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.px),
                    bottomLeft: Radius.circular(20.px),
                  ),
                ),
                child: controller.screen[controller.screenIndex.value]),
          );
        },
      ),
    );
  }
}
