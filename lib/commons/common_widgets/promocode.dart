import 'package:fantacy_user/api_repository/api_function.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast package
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../app/modules/home/controllers/home_controller.dart';
import '../strings.dart';
import 'package:flutter/services.dart';

class PromocodeWidget extends GetView<HomeController> {
  final String title;

  const PromocodeWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.promoheading,
                style: MyTextStyle(
                    textSize: 20,
                    textWeight: FontWeight.w700,
                    textColor: Colors.blue),
              ).paddingOnly(left: 20,),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: title));
                  Fluttertoast.showToast( // Show toast message
                    msg: "Coupon code copied",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey[900],
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
                child: Icon(Icons.file_copy_outlined),
              ),
            ],
          ),
        ).paddingOnly(left: 15, right: 15),
        Positioned(
          left: 0,
          top: 10,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Match container background color
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 10,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,// Match container background color
            ),
          ),
        ),
      ],
    );
  }
}
