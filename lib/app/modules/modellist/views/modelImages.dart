import 'package:fantacy_user/app/modules/modellist/controllers/modellist_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/FullImage_widget.dart';
import 'package:fantacy_user/commons/common_widgets/toprate_widget.dart';
import 'package:fantacy_user/commons/imageUrl.dart';

class ModelImages extends GetView<ModellistController> {
  const ModelImages({super.key});

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
            fullscreenDailog(modelImagesurl, context);
          },
          child: TopRate_widget(
            backgroundcolor: controller.appColors.grey,
            image: modelImagesurl,
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
