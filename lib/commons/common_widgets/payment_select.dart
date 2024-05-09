import '../all.dart';

class PaymentMethodSelectionWidget extends StatelessWidget {
  final bool initialValue;
  final Function(bool?)? onChanged;
  final String? imagePath;
  final String text;

  const PaymentMethodSelectionWidget({
    Key? key,
    required this.initialValue,
    this.onChanged,
    this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: initialValue ? 1.0 : 0.5, // Adjust opacity based on selectability
      child: GestureDetector(
        onTap: () {
          if (onChanged != null) {
            onChanged!(!initialValue); // Toggle selection state
          }
        },
        child: Container(
          height: 50,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Radio<bool>(
                value: initialValue,
                groupValue: true,
                onChanged: onChanged,
              ),
              SizedBox(width: 10),
              Text(text).paddingOnly(right: 50),
              if (imagePath != null) ...[
                Image.asset(imagePath!, width: 50, height: 50),
                SizedBox(width: 10),
              ],
            ],
          ),
        ),
      ),
    ).paddingSymmetric(horizontal: 20, vertical: 10);
  }
}
