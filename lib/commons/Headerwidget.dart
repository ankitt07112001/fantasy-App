import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import '../app/modules/bottom/views/bottom_screen.dart';
import 'common_widgets/mytext_widgets.dart';

class Headerwidget extends StatefulWidget {
  final headername;
  const Headerwidget({super.key, this.headername});

  @override
  State<Headerwidget> createState() => _HeaderwidgetState();
}

class _HeaderwidgetState extends State<Headerwidget> {
  BaseController controller = Get.put(BaseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      color: controller.appColors.appColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          !isBottom
              ? GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: controller.appColors.white,
                  ).paddingOnly(right: 20),
                )
              : SizedBox(),
          MyTextView(
            widget.headername,
            isMaxLineWrap: true,
            fontfamilyname: 'Montserrat',
            textStyleNew: MyTextStyle(
              textColor: controller.appColors.white,
              textWeight: FontWeight.w500,
              textSize: 16.px,
            ),
            textAlignNew: TextAlign.center,
          ),
          // Icon(
          //   Icons.arrow_back,
          //   size: 20,
          //   color: controller.appColors.appColor,
          // ),
        ],
      ).paddingOnly(top: 20, left: 15, right: 10),
    );
  }
}
