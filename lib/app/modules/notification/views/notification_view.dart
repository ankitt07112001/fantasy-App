import 'package:fantacy_user/app/modules/notification/views/privacy_view.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import '../../../../commons/Headerwidget.dart';
import '../../../../responsive/scaling_query.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: ScalingQuery(context).height,
          child: Headerwidget(
            headername: Strings.Notificationhed,
          )),
      body: Column(
        children: [
          Center(
              child: Image.asset(ImagePath.Allow)
                  .paddingAll(50)
                  .paddingOnly(top: 40)),
          Text(
            Strings.Allow,
            style: MyTextStyle(textSize: 32.px, textWeight: FontWeight.w700),
          ),
          Text(
            Strings.info,
            style: MyTextStyle(textSize: 16, textWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ).paddingAll(20),
          CommonButton(
            title: Strings.enable,
            onTap: () {
              Get.to(PrivacyView());
            },
            isSmall: true,
            radius: 30,
            color: Colors.pinkAccent,
          ).paddingOnly(left: 150),
          InkWell(onTap: () {
            Get.back();
          }, child: Text(Strings.notnow).paddingAll(50))
        ],
      ),
    );
  }
}
