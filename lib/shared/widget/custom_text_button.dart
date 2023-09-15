import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/widget/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.buttonText,
    required this.onClick,
    this.primaryColor = Colors.lightBlueAccent,
    this.borderRadius = 0,
    this.isLoading = false,
    this.disable = false,
    this.height = 42,
    this.width,
    this.padding,
    this.prefixIcon,
    this.minimumSize = 50,
    this.suffixIcon,
    this.buttonTextColor,
    this.borderSide = BorderSide.none,
    this.fontType = FontType.buttonMedium,
    super.key,
  });
  final bool isLoading;
  final bool disable;
  final String buttonText;
  final VoidCallback onClick;
  final Color primaryColor;
  final double borderRadius;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final double minimumSize;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FontType fontType;
  final BorderSide borderSide;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
      child: ElevatedButton(
        onPressed: () => disable ? null : onClick(),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  CustomText(
                    buttonText,
                    type: fontType,
                    color: buttonTextColor,
                  ),
                  if (suffixIcon != null) suffixIcon!,
                ],
              ),
      ),
    );
  }
}
