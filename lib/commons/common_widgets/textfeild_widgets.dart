import '../all.dart';

class CommonTextField extends StatelessWidget {
  final labeltxt;
  // final prefixicon;
  final suffixicon;
  final Bgcolor;
  final Function? ontap;
  final TextEditingController? controller;
  final bool readtype;
  final style;
  final bool iconorimage;
  final String? imagepath;
  final String? hinttext;
  final hintstyle;
  final bool suffixshowicon;
  final inputformate;
  // final bool? prefixshowicon;
  final keyboradtype;
  final height;
  final width;
  final maxline;
  final double radius;
  final leftpadding;
  final toppadding;
  final bottompadding;
  final bool? obsecuretext;
  final Function? ontapsufixicon;
  final showprefixicon;
  final suffix_icon_color;
  final double size;
  final maxlength;
  final showborder;
  final descbox;
  final prefixicon;
  final showoutlineborder;
  final child;
  final label;
  final labelstyle;
  final outerborderclr;
  final autofocus;
  final onchange;
  final textInputAction;
  String? Function(String?)? validator;

  CommonTextField({
    Key? key,
    this.labeltxt,
    // this.prefixicon,
    this.suffixicon,
    this.Bgcolor,
    this.ontap,
    this.controller,
    this.readtype = false,
    this.style,
    this.iconorimage = false,
    this.imagepath,
    this.hinttext,
    this.hintstyle,
    this.suffixshowicon = false,
    this.keyboradtype = TextInputType.text,
    this.height,
    this.width,
    this.maxline = 1,
    this.radius = 5,
    this.leftpadding = 20.0,
    this.obsecuretext = false,
    this.ontapsufixicon,
    this.suffix_icon_color,
    this.size = 20.0,
    this.showborder = false,
    this.showoutlineborder = true,
    required this.validator,
    this.maxlength,
    this.descbox = false,
    this.showprefixicon = false,
    this.prefixicon = null,
    this.child,
    this.inputformate,
    this.label,
    this.labelstyle,
    this.toppadding = 15.0,
    this.bottompadding = 15.0,
    this.outerborderclr,
    this.autofocus = false,
    this.onchange,
    this.textInputAction,
    // this.prefixshowicon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Bgcolor, borderRadius: BorderRadius.circular(radius)),
      child: TextFormField(
        //  scrollPadding: EdgeInsets.symmetric(
        //       vertical: MediaQuery.of(context).viewInsets.bottom),
        textInputAction: textInputAction,
        onChanged: (value) {
          onchange(value);
        },
        cursorColor: AppColors().black,
        inputFormatters: inputformate,
        validator: validator,
        maxLines: maxline,
        keyboardType: keyboradtype,
        obscureText: obsecuretext!,
        onTap: () {
          ontap!();
        },
        style: style,
        autofocus: autofocus,
        readOnly: readtype,
        controller: controller,
        maxLength: maxlength,
        decoration: InputDecoration(
          enabledBorder: showoutlineborder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: outerborderclr ?? AppColors().border,
                  ),
                  borderRadius: BorderRadius.circular(10))
              : showborder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: outerborderclr ?? AppColors().border,
                      ),
                    )
                  : InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: outerborderclr ?? AppColors().border, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIconConstraints: BoxConstraints(
            maxWidth: showprefixicon ? 80 : 0,
            maxHeight: showprefixicon ? 70 : 0,
          ),
          prefixIcon: showprefixicon ? prefixicon : null,
          isDense: true,
          contentPadding: EdgeInsets.only(
              left: leftpadding, top: toppadding, bottom: bottompadding),
          border: showborder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: outerborderclr ?? AppColors().border,
                  ),
                )
              : showoutlineborder
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: outerborderclr ?? AppColors().border,
                      ),
                      borderRadius: BorderRadius.circular(15))
                  : InputBorder.none,
          labelText: label,
          labelStyle: labelstyle,
          hintText: hinttext,
          hintStyle: hintstyle,
          suffixIconConstraints: BoxConstraints(
            maxWidth: suffixshowicon ? 30 : 0,
            maxHeight: suffixshowicon ? 20 : 0,
          ),
          suffixIcon: suffixshowicon
              ? iconorimage
                  ? GestureDetector(
                      onTap: () {
                        ontapsufixicon!();
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: child),
                    )
                  : GestureDetector(
                      onTap: () {
                        ontapsufixicon!();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          suffixicon,
                          color: suffix_icon_color,
                          size: size,
                        ),
                      ),
                    )
              : Padding(
                  padding: EdgeInsets.all(5),
                ),
        ),
      ),
    );
  }
}
