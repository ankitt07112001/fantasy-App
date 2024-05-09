import 'package:fantacy_user/app/modules/auth/controllers/auth_controller.dart';
import 'package:fantacy_user/commons/SvgString.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter_svg/svg.dart';

class AuthHeader extends GetView<AuthController> {
  final title;
  final showback;
  const AuthHeader({
    Key? key,
    this.title,
    this.showback = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          child: SvgPicture.string(
            halfcircle,
            width: size.width,
            color: controller.appColors.linearGradient2,
          ),
        ),
        Positioned(
          top: 50,
          left: 30,
          right: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showback
                  ? InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: controller.appColors.white,
                      ),
                    )
                  : Container(),
              MyTextView(
                title,
                isMaxLineWrap: true,
                textStyleNew: MyTextStyle(
                  textColor: controller.appColors.white,
                  textWeight: FontWeight.w700,
                  textSize: 20.px,
                ),
                textAlignNew: TextAlign.center,
              ),
              showback
                  ? InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
