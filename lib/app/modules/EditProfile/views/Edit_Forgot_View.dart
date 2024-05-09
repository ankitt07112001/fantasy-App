import 'package:fantacy_user/app/modules/EditProfile/views/password_verfication_view.dart';
import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/myTextField_Widget.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';

import '../controllers/edit_profile_controller.dart';

class Edit_Forgot_View extends GetView<EditProfileController> {
  const Edit_Forgot_View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: ScalingQuery(context).height,
        child: Headerwidget(
          headername: "Change Password",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.px,
            ),
            Center(
                child: CircleAvatar(
              backgroundColor: controller.appColors.lightpink,
              radius: 70,
              child: Icon(
                Icons.lock,
                size: 53.px,
                color: controller.appColors.white,
              ),
            )),
            SizedBox(
              height: 60.px,
            ),
            My_TextField_Widget(
              hintname: "Old Password",
            ),
            SizedBox(
              height: 15.px,
            ),
            My_TextField_Widget(
              hintname: "New Password",
            ),
            SizedBox(
              height: 15.px,
            ),
            My_TextField_Widget(
              hintname: "Confirm Password",
            ),
            SizedBox(
              height: 150.px,
            ),
            CommonButton(
              color: controller.appColors.lightpink,
              title: 'Update',
              onTap: () {
                Get.to(PasswordVerficationView());
              },
            ).paddingSymmetric(horizontal: 30.px)
          ],
        ),
      ),
    );
  }
}
