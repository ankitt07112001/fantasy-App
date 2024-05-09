import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/toprate_widget.dart';
import 'package:fantacy_user/commons/imageUrl.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';

import '../../../routes/app_pages.dart';
import '../controllers/modellist_controller.dart';

class ModellistView extends GetView<ModellistController> {
  const ModellistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModellistController>(
        init: ModellistController(),
        assignId: true,
        builder: (_) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: ScalingQuery(context).height,
                child: Headerwidget(headername: controller.title)),
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
                    image: topRateUrl,
                    loaderclr: controller.appColors.appColor,
                    isonline: true,
                    namelabelshow: true,
                  ),
                );
              },
            ),
          );
        });
  }
}
