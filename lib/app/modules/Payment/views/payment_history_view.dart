import 'package:fantacy_user/app/modules/Payment/views/ph_view.dart';
import 'package:fantacy_user/app/modules/Payment/views/wallet_history_view.dart';
import 'package:fantacy_user/commons/all.dart';
import '../../../../commons/Headerwidget.dart';
import '../../../../commons/common_widgets/mytext_widgets.dart';
import '../../../../responsive/scaling_query.dart';

class PaymentHistoryView extends StatefulWidget {
  const PaymentHistoryView({Key? key}) : super(key: key);

  @override
  _PaymentHistoryViewState createState() => _PaymentHistoryViewState();
}

class _PaymentHistoryViewState extends State<PaymentHistoryView> {
  bool isWalletHistorySelected =
      true; // Initially set to true to show Wallet History

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: ScalingQuery(context).height,
        child: Headerwidget(
          headername: Strings.paymenthis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      isWalletHistorySelected = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return isWalletHistorySelected
                            ? Colors
                                .pinkAccent // Change color for selected button
                            : Colors
                                .white; // Change color for unselected button
                      },
                    ),
                  ),
                  child: Text("Wallet History",
                      style: MyTextStyle(
                          textWeight: FontWeight.w600,
                          textSize: 14,
                          textColor: Colors.black)),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      isWalletHistorySelected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return isWalletHistorySelected
                            ? Colors.white // Change color for unselected button
                            : Colors
                                .pinkAccent; // Change color for selected button
                      },
                    ),
                  ),
                  child: Text("Payment History",
                      style: MyTextStyle(
                          textWeight: FontWeight.w600,
                          textSize: 14,
                          textColor: Colors.black)),
                ),
              ],
            ).paddingAll(10),
            isWalletHistorySelected
                ? WalletHistoryView() // Show Wallet History when selected
                : P_history(), // Show Payment History when selected
          ],
        ),
      ),
    );
  }
}
