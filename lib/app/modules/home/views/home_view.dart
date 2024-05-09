import 'package:fantacy_user/app/modules/home/views/home_carousel.dart';
import 'package:fantacy_user/app/modules/home/views/home_header.dart';
import 'package:fantacy_user/app/modules/home/views/home_recommended.dart';
import 'package:fantacy_user/app/modules/home/views/hometop_rate.dart';
import 'package:fantacy_user/commons/all.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.appColors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(220.0), child: HomeHeader()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCarousel(),
            HomeTopRateList(),
            HomeRecommendedList(),
          ],
        ).paddingOnly(bottom: 10),
      ),
    );
  }
}
