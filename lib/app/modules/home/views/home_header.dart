import 'package:fantacy_user/app/modules/home/controllers/home_controller.dart';
import 'package:fantacy_user/app/modules/home/views/search_page_view.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/textfeild_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../routes/app_pages.dart';
import '../../Payment/views/payment_view.dart';
import '../../search/views/search_view.dart';

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: controller.appColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                color: controller.appColors.appColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).padding.top), // Adjusted
                    Center(
                      child: Container(
                        child: MyTextView(controller.appName,
                          isMaxLineWrap: true,
                          textStyleNew: MyTextStyle(
                            textFamily: GoogleFonts.urbanist().fontFamily,
                            textColor: controller.appColors.white,
                            textWeight: FontWeight.w700,
                            textSize: 33.px,
                          ),
                          textAlignNew: TextAlign.center,
                        ),
                      ).paddingAll(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 25,
                          child: Image.asset(ImagePath.profile),
                        ),
                        Text("Neeraj Mishra",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            // Get.to(PaymentView());
                          },
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container().paddingOnly(bottom: 35),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            // top: 80,
            left: 0,
            right: 0,
            child: Container(
              child: CommonTextField(
                ontap:(){
                  Get.to(Mysearch());
                },
                  readtype: true,
                  controller: controller.search,
                  validator: (value) {},
                  // borderRadius: 10.px,
                  hinttext: "Search",
                  prefixicon: Icon(
                    Icons.search,
                    size: 25,
                  ),
                  textInputAction: TextInputAction.none,
                  Bgcolor: controller.appColors.white),
            ).paddingSymmetric(horizontal: 25))
      ],
    );
  }
}
