import 'package:fantacy_user/app/modules/Profile/controllers/profile_controller.dart';
import 'package:fantacy_user/app/modules/Profile/views/Model_Post_Images.dart';
import 'package:fantacy_user/app/modules/modellist/controllers/modellist_controller.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/FullImage_widget.dart';
import 'package:fantacy_user/commons/common_widgets/toprate_widget.dart';

class Model_Images extends GetView<ProfileController> {
  const Model_Images({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      padding: EdgeInsets.all(8.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.toNamed(Routes.MODELPOST);
            // Model_Post_Images();
            // fullscreenDailog(
            //     "https://miro.medium.com/v2/resize:fit:495/0*xFuo_UNWchLZ8bqS.jpeg",
            //     // 'https://justtry.thecompletesoftech.in/uploads/app_setting/app_logo/1701150404_65657ec46fcb3.jpg',
            //     context);
          },
          child: TopRate_widget(
            backgroundcolor: controller.appColors.grey,
            image:
                'https://miro.medium.com/v2/resize:fit:495/0*xFuo_UNWchLZ8bqS.jpeg',
            loaderclr: controller.appColors.appColor,
            isonline: false,
            namelabelshow: false,
          ),
        );
      },
    );
  }

  fullscreenDailog(img, context) {
    showDialog<void>(
        context: context,
        useSafeArea: false,
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              Get.back();
            },
            child: FullImage_widget(
              image: img,
            ),
          );
        });
  }
}
