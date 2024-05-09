import 'package:fantacy_user/app/modules/Profile/controllers/profile_controller.dart';
import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/Model_Post_Widget.dart';
import 'package:fantacy_user/commons/common_widgets/Three_dots_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Model_Post_Images extends GetView<ProfileController> {
  const Model_Post_Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: ScalingQuery(context).height,
          child: Headerwidget(headername: controller.title)),
      body: Column(
        children: [
          SizedBox(
            height: 10.px,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Model_Post_Widget(
                  image:
                      "https://miro.medium.com/v2/resize:fit:495/0*xFuo_UNWchLZ8bqS.jpeg",
                  TextDescription: "ffffffffffff",
                  likeNum: "41",
                  CommentNum: "45",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
