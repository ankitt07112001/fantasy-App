import 'package:fantacy_user/app/modules/EditProfile/views/edit_profile_view.dart';
import 'package:fantacy_user/app/modules/Profile/controllers/profile_controller.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter/material.dart';

class Model_Post_Widget extends StatefulWidget {
  final image;
  final TextDescription;
  final likeNum;
  final CommentNum;
  const Model_Post_Widget(
      {super.key,
      required this.image,
      required this.TextDescription,
      required this.likeNum,
      required this.CommentNum});

  @override
  State<Model_Post_Widget> createState() => _Model_Post_WidgetState();
}

class _Model_Post_WidgetState extends State<Model_Post_Widget> {
  BaseController controller = Get.put(BaseController());
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.red,
          height: 50.px,
          width: 393.px,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 25.px,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.EDIT_PROFILE);
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/ModelImage1.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 15.px,
                  ),
                  MyTextView(Strings.userName),
                  SizedBox(
                    width: 70.px,
                  ),
                ],
              ),
              Row(
                children: [
                  PopupMenuButton(
                    color: controller.appColors.lightergrey,
                    initialValue: profileController
                        .selected, // add your initial value here
                    itemBuilder: (BuildContext ctx) {
                      return <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          child: Text("Follow"),
                          value: "Ankara",
                        ),
                        PopupMenuItem(
                          child: Text("Share"),
                          value: "İzmir",
                        ),
                        PopupMenuItem(
                          child: Text("Report"),
                          value: "Ankara",
                        ),
                      ];
                    },
                    onSelected: (String city) {
                      // setState(() {
                      profileController.selected = city;
                      // });
                    },
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.px,
        ),
        Container(
          height: 506.px,
          width: 428.px,
          child: Image.network(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5.px,
        ),
        Container(
          // color: Colors.red,
          height: 31.px,
          width: 351.px,
          child: MyTextView(widget.TextDescription),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(
                  Icons.favorite_border_outlined,
                  color: controller.appColors.black,
                  size: 29.px,
                ),
                MyTextView(
                  widget.likeNum,
                  textStyleNew:
                      TextStyle(color: controller.appColors.textBlack),
                ),
                MyTextView(
                  "Likes",
                  textStyleNew:
                      TextStyle(color: controller.appColors.textBlack),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.messenger_outline_outlined,
                  color: controller.appColors.black,
                  size: 29.px,
                ),
                MyTextView(
                  widget.CommentNum,
                  textStyleNew:
                      TextStyle(color: controller.appColors.textBlack),
                ),
                MyTextView(
                  "Comment",
                  textStyleNew:
                      TextStyle(color: controller.appColors.textBlack),
                ),
                SizedBox(
                  width: 20.px,
                ),
                Icon(Icons.share)
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20.px,
        )
      ],
    );
  }
}
