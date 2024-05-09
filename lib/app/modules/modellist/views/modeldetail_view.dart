import 'package:fantacy_user/app/modules/call/views/call_view.dart';
import 'package:fantacy_user/app/modules/modellist/views/modelImages.dart';
import 'package:fantacy_user/app/modules/modellist/views/modeldetailheader.dart';
import 'package:fantacy_user/app/modules/modellist/views/modeldetails.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../commons/SvgString.dart';
import '../../Chat/controllers/chat_model.dart';

import '../controllers/modellist_controller.dart';

class ModeldetailView extends GetView<ModellistController> {
  const ModeldetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModellistController>(
        assignId: true,
        builder: (_) {
          return Scaffold(
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(() => ChatDetailPage(title: 'Jessica Parker', status: 'Online',));
                    },
                    child: InkWell(
                      child: SvgPicture.string(
                        chatcircle,
                        height: 50,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("hello");
                      Get.to(VideoCall());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: controller.appColors.appColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(children: [
                        SvgPicture.string(
                          videosvg,
                          color: controller.appColors.white,
                        ).paddingOnly(left: 25, right: 10),
                        MyTextView(
                          Strings.callnow,
                          isMaxLineWrap: true,
                          textStyleNew: MyTextStyle(
                            textColor: controller.appColors.white,
                            textWeight: FontWeight.w600,
                            textSize: 24.px,
                          ),
                          textAlignNew: TextAlign.start,
                        ).paddingOnly(right: 25)
                      ]),
                    ),
                  )
                ],
              ).paddingOnly(left: 30),
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    ModeldetailHeader(),
                    Modeldetails(),
                    Divider(
                      height: 2.px,
                      color: controller.appColors.lightergrey,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.pageIndex = 0;
                              controller.update();
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color: controller.pageIndex == 0
                                          ? controller.appColors.appColor
                                          : controller.appColors.white),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.string(
                                gallerysvg,
                                height: 30,
                                color: controller.appColors.appColor,
                              ).paddingOnly(top: 5.0, bottom: 5.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.pageIndex = 1;
                              controller.update();
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color: controller.pageIndex == 1
                                          ? controller.appColors.appColor
                                          : controller.appColors.white),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.string(
                                videosvg,
                                height: 30,
                                color: controller.appColors.appColor,
                              ).paddingOnly(top: 5.0, bottom: 5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ModelImages(),
                  ],
                ),
              ));
        });
  }
}
