import 'dart:io';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import '../controllers/auth_controller.dart';

class IntroView extends GetView<AuthController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: MyTextView(
                Strings.exitmsg,
                isMaxLineWrap: true,
                textStyleNew: MyTextStyle(
                  textColor: controller.appColors.txtblack,
                  textWeight: FontWeight.w700,
                  textSize: 16.px,
                ),
                textAlignNew: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: MyTextView(
                    Strings.yes,
                    isMaxLineWrap: true,
                    textStyleNew: MyTextStyle(
                      textColor: controller.appColors.txtblack,
                      textWeight: FontWeight.w700,
                      textSize: 16.px,
                    ),
                    textAlignNew: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: MyTextView(
                    Strings.no,
                    isMaxLineWrap: true,
                    textStyleNew: MyTextStyle(
                      textColor: controller.appColors.txtblack,
                      textWeight: FontWeight.w700,
                      textSize: 16.px,
                    ),
                    textAlignNew: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Obx(
          () => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: controller.imageList.length,
                      controller: controller.page,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: controller.imageList[index],
                              height: 300.0,
                            ),
                            const SizedBox(height: 20.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 18,
                                right: 18,
                              ),
                              child: MyTextView(
                                controller.textList[index],
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.txtblack,
                                  textWeight: FontWeight.w700,
                                  textSize: 18.px,
                                ),
                                textAlignNew: TextAlign.center,
                              ),
                            )
                          ],
                        );
                      },
                      onPageChanged: (int index) {
                        controller.onImageIndexChange(index);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicators(),
                  ),
                  CommonButton(
                    color: controller.appColors.appColor,
                    title: Strings.next,
                    isSmall: true,
                    radius: 100.0,
                    textColor: controller.appColors.white,
                    onTap: () async {
                      if (controller.currentImageIndex.value != 2) {
                        controller.page
                            .jumpToPage(controller.currentImageIndex.value + 1);
                      } else {
                        Get.offAllNamed(Routes.SIGNUPINTRO);
                      }
                    },
                  ).paddingOnly(top: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < controller.imageList.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: controller.currentImageIndex.value == i ? 28.0 : 8.0,
            height: 8.0,
            decoration: controller.currentImageIndex.value == i
                ? BoxDecoration(
                    color: controller.appColors.appColor,
                    borderRadius: BorderRadius.circular(5.0),
                  )
                : BoxDecoration(
                    color: controller.appColors.appColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
          ),
        ),
      );
    }
    return indicators;
  }
}
