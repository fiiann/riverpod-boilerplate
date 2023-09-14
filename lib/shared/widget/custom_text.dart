import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/constants/app_theme.dart';
import 'package:flutter_boilerplate/shared/constants/custom_text_style.dart';

enum FontType {
  highlight,
  h1,
  h1Thin,
  h1SemiBold,
  h2,
  h2Thin,
  h2SemiBold,
  h3,
  h3Thin,
  h3SemiBold,
  h4,
  h4Thin,
  h4SemiBold,
  h5,
  h5Thin,
  h5SemiBold,
  h6,
  h6Thin,
  h6SemiBold,
  body1,
  body1SemiBold,
  body2,
  body2SemiBold,
  subtitle1,
  subtitle1SemiBold,
  subtitle2,
  subtitle2SemiBold,
  caption,
  captionSemiBold,
  overline,
  overlineSemiBold,
  buttonLarge,
  buttonMedium,
  buttonSmall,
  inputLabel,
  helperText,
  inputText,
  avatarInitials,
  chip,
  tooltip,
  alertTitle,
  tableHeader,
  badgeLabel,
  toast,

  smallText,
  smallTextLight,
  smallTextBold,
  button,
  note,
  smallNote,
  smallNoteBold,
  formTitle,
  formInfield,
  mobileMenu,
  delay,

  normal,

  // from design system
}

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.color = AppColors.textPrimary,
    this.type = FontType.body1,
    this.ellipsis = false,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.maxLines,
    this.height,
  });
  final String text;
  final Color? color;
  final FontType type;
  final bool ellipsis;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int? maxLines;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: CustomTextStyle(type: type)
            .get()
            .copyWith(color: color, decoration: decoration, height: height),
        overflow: ellipsis ? TextOverflow.ellipsis : null,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}
