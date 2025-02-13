import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

/// <<<--- To get text View -------------------->>>
class MyTextView extends Text {
  final TextAlign? textAlignNew;
  final int? maxLinesNew;
  final TextStyle? textStyleNew;
  final TextOverflow? overflowText;
  final bool? isMaxLineWrap;
  final TextDirection? textAlignment;
  final fontfamilyname;
  MyTextView(
    String? s, {
    Key? key,
    this.fontfamilyname = 'Urbanist',
    this.textAlignment,
    this.textAlignNew = TextAlign.start,
    this.maxLinesNew = 1,
    this.overflowText = TextOverflow.ellipsis,
    this.isMaxLineWrap = false,
    this.textStyleNew,
  })  : assert(s != null && maxLinesNew != null),
        super(
          s!,
          key: key,
          textAlign: textAlignNew,
          maxLines: isMaxLineWrap! ? null : maxLinesNew,
          overflow: isMaxLineWrap ? null : overflowText,
          style: GoogleFonts.getFont(fontfamilyname, textStyle: textStyleNew),
          textDirection: textAlignment,
        );
}

/// <<<--- To get text view style --------------->>>
class MyTextStyle extends TextStyle {
  final Color? textColor;
  final FontWeight? textWeight;
  final double? textSize;
  final String? textFamily;
  final TextDecoration? textDecorations;
  final Paint? textBackground;
  final double? textLetterSpacing;
  final double? textHeight;
  final FontStyle? textStyle;

  MyTextStyle({
    this.textHeight = 1.0,
    this.textColor = Colors.black,
    this.textWeight = FontWeight.normal,
    this.textSize = 14,
    this.textFamily,
    this.textDecorations = TextDecoration.none,
    this.textBackground,
    this.textLetterSpacing = 0.0,
    this.textStyle = FontStyle.normal,
  })  : /*assert(textColor != null && textWeight != null),*/
        super(
          color: textColor,
          fontWeight: textWeight,
          fontSize: textSize,
          fontFamily: textFamily ?? fontFamilyMedium,
          decoration: textDecorations,
          background: textBackground,
          letterSpacing: textLetterSpacing,
          height: textHeight,
          fontStyle: textStyle,
        );
}
