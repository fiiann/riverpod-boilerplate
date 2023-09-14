import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/widget/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  final FontType type;

  CustomTextStyle({this.type = FontType.normal});

  TextStyle get() {
    double fontSize;
    FontWeight fontWeight;
    double letterSpacing = 0;

    switch (type) {
      case FontType.body1:
        fontSize = 16;
        letterSpacing = 0.15;
        break;
      case FontType.body1SemiBold:
        fontSize = 16;
        letterSpacing = 0.15;
        break;
      case FontType.body2:
        fontSize = 14;
        letterSpacing = 0.15;
        break;
      case FontType.body2SemiBold:
        fontSize = 14;
        letterSpacing = 0.15;
        break;
      case FontType.caption:
        fontSize = 12;
        letterSpacing = 0.4;
        break;
      case FontType.tableHeader:
        fontSize = 12;
        letterSpacing = 0.17;
        break;
      case FontType.button:
        fontSize = 14;
        break;
      case FontType.buttonLarge:
        fontSize = 15;
        break;
      case FontType.buttonSmall:
        fontSize = 13;
        break;
      case FontType.buttonMedium:
        fontSize = 14;
        break;

      case FontType.inputLabel:
        fontSize = 12;
        break;
      case FontType.helperText:
        fontSize = 12;
        break;

      case FontType.inputText:
        fontSize = 16;
        break;

      case FontType.avatarInitials:
        fontSize = 20;
        break;

      case FontType.chip:
        fontSize = 13;
        break;

      case FontType.tooltip:
        fontSize = 10;
        break;

      case FontType.alertTitle:
        fontSize = 16;
        break;

      case FontType.tableHeader:
        fontSize = 12;
        break;

      case FontType.badgeLabel:
        fontSize = 12;
        break;

      case FontType.toast:
        fontSize = 12;
        break;
      case FontType.highlight:
        fontSize = 32;
        break;
      case FontType.formInfield:
        fontSize = 32;
        break;
      case FontType.formTitle:
        fontSize = 13;
        break;
      case FontType.note:
        fontSize = 13;
        break;
      case FontType.smallNote:
        fontSize = 12;
        break;
      case FontType.mobileMenu:
      case FontType.delay:
        fontSize = 11;
        break;
      default:
        fontSize = 16;
    }

    if (type == FontType.h1 ||
        type == FontType.h1SemiBold ||
        type == FontType.h1Thin) {
      fontSize = 96;
    } else if (type == FontType.h2 ||
        type == FontType.h2SemiBold ||
        type == FontType.h2Thin) {
      fontSize = 60;
    } else if (type == FontType.h3 ||
        type == FontType.h3SemiBold ||
        type == FontType.h3Thin) {
      fontSize = 48;
    } else if (type == FontType.h4 ||
        type == FontType.h4SemiBold ||
        type == FontType.h4Thin) {
      fontSize = 34;
    } else if (type == FontType.h5 ||
        type == FontType.h5SemiBold ||
        type == FontType.h5Thin) {
      fontSize = 24;
    } else if (type == FontType.h6 ||
        type == FontType.h6SemiBold ||
        type == FontType.h6Thin) {
      fontSize = 20;
    } else if (type == FontType.body1 || type == FontType.body1SemiBold) {
      fontSize = 16;
    } else if (type == FontType.body2 || type == FontType.body2SemiBold) {
      fontSize = 14;
    } else if (type == FontType.subtitle1 ||
        type == FontType.subtitle1SemiBold) {
      fontSize = 16;
    } else if (type == FontType.subtitle2 ||
        type == FontType.subtitle2SemiBold) {
      fontSize = 14;
    } else if (type == FontType.caption || type == FontType.captionSemiBold) {
      fontSize = 12;
    } else if (type == FontType.caption || type == FontType.captionSemiBold) {
      fontSize = 12;
    } else if (type == FontType.overline || type == FontType.overlineSemiBold) {
      fontSize = 12;
    }

    switch (type) {
      case FontType.button:
        fontWeight = FontWeight.w500;
        break;
      case FontType.buttonMedium:
        fontWeight = FontWeight.w500;
        break;
      case FontType.buttonLarge:
        fontWeight = FontWeight.w500;
        break;
      case FontType.buttonSmall:
        fontWeight = FontWeight.w500;
        break;

      case FontType.subtitle2:
        fontWeight = FontWeight.w500;
        break;
      case FontType.tooltip:
        fontWeight = FontWeight.w500;
        break;
      case FontType.alertTitle:
        fontWeight = FontWeight.w500;
        break;

      case FontType.tableHeader:
        fontWeight = FontWeight.w600;
        break;

      case FontType.badgeLabel:
        fontWeight = FontWeight.w500;
        break;
      case FontType.highlight:
        fontWeight = FontWeight.w300;
        break;
      case FontType.smallTextLight:
        fontWeight = FontWeight.w400;
        break;
      case FontType.note:
        fontWeight = FontWeight.w300;
        break;
      case FontType.smallNote:
        fontWeight = FontWeight.w300;
        break;
      default:
        fontWeight = FontWeight.normal;
    }
    if (type == FontType.h1SemiBold ||
        type == FontType.h2SemiBold ||
        type == FontType.h3SemiBold ||
        type == FontType.h4SemiBold ||
        type == FontType.h5SemiBold ||
        type == FontType.h6SemiBold ||
        type == FontType.body1SemiBold ||
        type == FontType.body2SemiBold ||
        type == FontType.subtitle1SemiBold ||
        type == FontType.subtitle2SemiBold ||
        type == FontType.captionSemiBold ||
        type == FontType.overlineSemiBold ||
        type == FontType.smallNoteBold) {
      fontWeight = FontWeight.w600;
    }

    if (type == FontType.h1Thin ||
        type == FontType.h2Thin ||
        type == FontType.h3Thin ||
        type == FontType.h4Thin ||
        type == FontType.h5Thin ||
        type == FontType.h6Thin) {
      fontWeight = FontWeight.w300;
    }

    if (type == FontType.h1 ||
        type == FontType.h2 ||
        type == FontType.h3 ||
        type == FontType.h4 ||
        type == FontType.h5 ||
        type == FontType.h6) {
      fontWeight = FontWeight.w500;
    }

    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }
}
