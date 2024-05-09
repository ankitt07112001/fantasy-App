import 'package:fantacy_user/app/modules/Payment/views/promocode_view.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/textfeild_widgets.dart';
import '../../../../commons/Headerwidget.dart';
import '../../../../commons/common_widgets/payment_select.dart';
import '../../../../responsive/scaling_query.dart';
import '../controllers/payment_controller.dart';
import 'card_detail_view.dart';
import 'container_paymentpage_view.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
              preferredSize: ScalingQuery(context).height,
              child: Headerwidget(
                headername: Strings.paymenttitle,
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ContainerPaymentpageView(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.orange,
                      ),
                      Text(Strings.addmoney),
                    ],
                  ).paddingOnly(left: 30,bottom: 7),
                CommonTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an amount';
                    }
                    double? amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'Please enter a valid amount';
                    }
                    return null;
                  },
                  label: Strings.enteramt,
                  radius: 30,
                  keyboradtype: TextInputType.number,
                ).paddingOnly(left: 25,right: 25,),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                        ),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            PromocodeView(),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    Strings.promocode,
                    style: MyTextStyle(textSize: 20, textColor: Colors.blue),
                  ),
                ).paddingAll(20),
                PaymentMethodSelectionWidget(
                  initialValue: false,
                  onChanged: (isSelected) {},
                  imagePath: ImagePath.upi,
                  text: Strings.pay,
                ).paddingOnly(right:10),
                PaymentMethodSelectionWidget(
                  initialValue: false,
                  onChanged: (isSelected) {},
                  imagePath: ImagePath.card,
                  text: Strings.pay,
                ).paddingOnly(right:10),
                PaymentMethodSelectionWidget(
                  initialValue: false,
                  onChanged: (isSelected) {},
                  text: Strings.svaecard,
                ).paddingOnly(right:10),
                CommonButton(
                  radius: 30,
                  title: Strings.next,
                  onTap: () {
                    Get.to(CreditCardView());
                  },
                  isBig: true,
                ).paddingAll(50),
              ],
            ),

          ),
        ),
      ],
    );
  }
}
