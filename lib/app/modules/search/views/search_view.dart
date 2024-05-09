import 'package:fantacy_user/commons/common_widgets/textfeild_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../commons/common_widgets/toprate_widget.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import 'fillter_view.dart';

class Mysearch extends GetView<HomeController> {
  const Mysearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Increased preferred size
        child: AppBar(
          backgroundColor: controller.appColors.appColor,
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {
                Get.defaultDialog(
                  title: 'Filter',
                  content: Container(
                    child: FillterView(),
                  )
                );
              },
            ).paddingOnly(bottom: 10)
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0), // Adjusted preferred size
              child: Positioned(
                  bottom: 20,
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: CommonTextField(
                        ontap:(){
                          Get.to(Mysearch());
                        },
                        autofocus: true,
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
          ),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 22.0,
          crossAxisSpacing: 8.0,
          maxCrossAxisExtent: 200,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.MODELDETAIL);
            },
            child: TopRate_widget(
              backgroundcolor: controller.appColors.grey,
              image:
              'https://justtry.thecompletesoftech.in/uploads/app_setting/splash_logo/1701153828_65658c24cf48b.png',
              loaderclr: controller.appColors.appColor,
              isonline: true,
              namelabelshow: true,
            ),
          );
        },
      ),
    );
  }
}
