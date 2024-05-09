import 'package:cached_network_image/cached_network_image.dart';
import 'package:fantacy_user/app/modules/home/controllers/home_controller.dart';
import 'package:fantacy_user/commons/all.dart';

HomeController controller = Get.put(HomeController());

class FullImage_widget extends StatelessWidget {
  final image;
  const FullImage_widget({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(color: controller.appColors.appColor, value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() {
                  Get.back();
                }),
                child: Container(
                    child: Icon(
                  Icons.arrow_back,
                  color: controller.appColors.white,
                )).paddingOnly(bottom: 8),
              ),
              // GestureDetector(
              //   onTap: () {
              //     widget.onlike!();
              //   },
              //   child: Container(
              //       child: widget.islike
              //           ? SvgPicture.string(
              //               fillheartbackgroundsvg,
              //               height: 40,
              //             )
              //           : SvgPicture.string(
              //               unfillheartbackgroundsvg,
              //               height: 40,
              //             )),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
