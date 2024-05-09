import 'package:fantacy_user/app/modules/Payment/views/payment_history_view.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';

class ContainerPaymentpageView extends GetView {
  const ContainerPaymentpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                Strings.totalWallet,
                style: MyTextStyle(textWeight: FontWeight.w600, textSize: 16),
              ).paddingAll(20),
              Icon(
                Icons.account_balance_wallet_rounded,
                size: 60,
              ).paddingAll(20)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.money,
                  style: MyTextStyle(
                    textWeight: FontWeight.w600,
                    textSize: 16,
                  )),
              GestureDetector(
                onTap: (){
                  Get.to(PaymentHistoryView());
                },
                child: Text(Strings.Payment,
                    style: MyTextStyle(
                        textWeight: FontWeight.w600,
                        textSize: 16,
                        textColor: Colors.blue)),
              ),
            ],
          ).paddingAll(10),
        ],
      ),
    ).paddingAll(30);
  }
}
