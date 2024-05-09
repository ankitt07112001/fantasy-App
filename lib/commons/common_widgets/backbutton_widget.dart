import '../all.dart';

class CommonBackButton extends StatelessWidget {
  final Color? color;
  final bool? imageChange;
  final String? image;
  final double? height;
  final VoidCallback onClickBack;

  const CommonBackButton({
    Key? key,
    this.color,
    this.image,
    this.height,
    required this.onClickBack,
    this.imageChange = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: 45.px,
        height: 45.px,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors().lightText.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.px),
        ),
        child: imageChange!
            ? RotatedBox(
                quarterTurns: selectedLang == Constants.languageCodeAr ? 2 : 0,
                child: Icon(Icons.arrow_back),
              )
            : Image.asset(
                image!,
                height: height,
              ),
      ),
    );
  }
}
