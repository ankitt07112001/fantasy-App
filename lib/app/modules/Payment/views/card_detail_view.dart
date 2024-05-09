import 'package:fantacy_user/api_repository/api_function.dart';
import 'package:fantacy_user/app/modules/Payment/views/payment_done_view.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../../../../commons/Headerwidget.dart';
import '../../../../commons/all.dart';
import '../../../../commons/common_widgets/button_widget.dart';
import '../../../../responsive/scaling_query.dart';
import '../controllers/creditcard_controller.dart';

class CreditCardView extends StatelessWidget {
  final CreditCardController controller = Get.put(CreditCardController());
  OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: ScalingQuery(context).height,
        child: Headerwidget(
          headername: Strings.paymenttitle,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Obx(() => CreditCardWidget(
              cardNumber: controller.cardNumber.value,
              expiryDate: controller.expiryDate.value,
              cardHolderName: controller.cardHolderName.value,
              cvvCode: controller.cvvCode.value,
              bankName: 'Axis Bank',
              showBackView: controller.isCvvFocused.value,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.pinkAccent.shade700,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[],
            )),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: controller.cardNumber.value,
                      cvvCode: controller.cvvCode.value,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: controller.cardHolderName.value,
                      expiryDate: controller.expiryDate.value,
                      inputConfiguration: InputConfiguration(
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      ),
                      onCreditCardModelChange: controller.updateCreditCardModel,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // _showValidDialog(context);
                          print('valid!');
                        } else {
                          print('invalid!');
                        }
                      },
                      child: CommonButton(
                        title: Strings.enterotp,
                        onTap: () {
                          Get.to(PaymentDoneView());
                        },
                        radius: 30,
                        isBig: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
