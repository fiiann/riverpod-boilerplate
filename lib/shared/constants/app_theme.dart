import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ProgressStatus { initial, progress, success, failed }

abstract class AppColors {
  // Main
  static const Color primaryMain = Color(0xFF007BFF);
  static const Color secondaryMain = Color(0xFF6C757D);
  static const Color redMain = Color(0xFFDC3545);

  static const Map<int, Color> redMainColors = {
    50: Color.fromRGBO(220, 53, 69, .1),
    100: Color.fromRGBO(220, 53, 69, .2),
    200: Color.fromRGBO(220, 53, 69, .3),
    300: Color.fromRGBO(220, 53, 69, .4),
    400: Color.fromRGBO(220, 53, 69, .5),
    500: Color.fromRGBO(220, 53, 69, .6),
    600: Color.fromRGBO(220, 53, 69, .7),
    700: Color.fromRGBO(220, 53, 69, .8),
    800: Color.fromRGBO(220, 53, 69, .9),
    900: Color.fromRGBO(220, 53, 69, 1),
  };

  static const Color darkMain = Color(0xFF212529);
  static const Color infoMain = Color(0xFF17A2B8);
  static const Color successMain = Color(0xFF28A745);
  static const Color warningMain = Color(0xFFFFC107);
  static const Color primaryAlternativeLight = Color(0xFF0099FF);
  static const Color secondaryAlternativeLight = Color(0xFF9C9FA4);
  static const Color redAlternativeLight = Color(0xFFDC5345);
  static const Color darkAlternativeLight = Color(0xFF214329);
  static const Color infoAlternativeLight = Color(0xFF17C0B8);
  static const Color successAlternativeLight = Color(0xFF28C545);
  static const Color warningAlternativeLight = Color(0xFFFFDF07);
  static const Color primaryAlternativeDark = Color(0xFF007BE1);
  static const Color secondaryAlternativeDark = Color(0xFF4D5056);
  static const Color redAlternativeDark = Color(0xFFDC5345);
  static const Color darkAlternativeDark = Color(0xFF212501);
  static const Color infoAlternativeDark = Color(0xFF0E71A3);
  static const Color infoDark = Color(0xFF0E71A3);
  static const Color successAlternativeDark = Color(0xFF28A727);
  static const Color warningAlternativeDark = Color(0xFFFFA307);
  static const Color primaryContainedBackground = Color(0xFF007BF5);
  static const Color secondaryContainedBackground = Color(0xFF777B82);
  static const Color redContainedBackground = Color(0xFFDC353B);
  static const Color darkContainedBackground = Color(0xFF21251F);
  static const Color infoContainedBackground = Color(0xFF17A2AE);
  static const Color successContainedBackground = Color(0xFF28A73B);
  static const Color warningContainedBackground = Color(0xFFFFB707);
  static const Color primaryOutlinedHoverBackground = Color(0x14007BFF);
  static const Color secondaryOutlinedHoverBackground = Color(0x148A8D93);
  static const Color redOutlinedHoverBackground = Color(0x14DC3545);
  static const Color darkOutlinedHoverBackground = Color(0x14212529);
  static const Color infoOutlinedHoverBackground = Color(0x1417A2B8);
  static const Color successOutlinedHoverBackground = Color(0x1428A745);
  static const Color warningOutlinedHoverBackground = Color(0x14FFD864);
  static const Color primaryOutlinedBackground = Color(0x80007BFF);
  static const Color secondaryOutlinedBackground = Color(0x808A8D93);
  static const Color backgroundColor = Color(0xFFF4F5FA);
  static const Color chipBackgroundColor = Color(0xFFF0EFF0);
  static const Color redOutlinedBackground = Color(0x80DC3545);
  static const Color darkOutlinedBackground = Color(0x80212529);
  static const Color infoOutlinedBackground = Color(0x8017A2B8);
  static const Color successOutlinedBackground = Color(0x8028A745);
  static const Color warningOutlinedBackground = Color(0x80FFC107);

  static const Color textPrimary = Color(0xDE3A3541);
  static const Color textSecondary = Color(0xAD3A3541);
  static const Color textDisabled = Color(0x613A3541);

  static const Color actionActive = Color(0x8A3A3541);
  static const Color actionHover = Color(0x0A3A3541);
  static const Color actionSelected = Color(0x143A3541);
  static const Color actionDisabled = Color(0x423A3541);
  static const Color actionDisabledBg = Color(0x1F3A3541);
  static const Color actionFocus = Color(0x1F3A3541);

  static const Color divider = Color(0x1F3A3541);
  static const Color outlineBorder = Color(0x1F3A3541);
  static const Color inputLine = Color(0x383A3541);
  static const Color overlay = Color(0x803A3541);
  static const Color snackbarBackground = Color(0xFF212121);

  static const Color customBgPrimary = Color(0xFFF2EAFF);
  static const Color customBgSecondary = Color(0xFFF1F1F2);
  static const Color customBgInfo = Color(0xFFE4F2FE);
  static const Color customBgSuccess = Color(0xffE9F5ea);
  static const Color customBgWarning = Color(0xfffdede0);
  static const Color customBgError = Color(0xffFee9e7);

  static const Color primaryHoverBackground = Color(0x14007BFF);
  static const Color secondaryHoverBackground = Color(0xFF777B82);
  static const Color redHoverBackground = Color(0xFFDC353B);
  static const Color darkHoverBackground = Color(0xFF21251F);
  static const Color infoHoverBackground = Color(0xFF17A2AE);
  static const Color successHoverBackground = Color(0xFF28A73B);
  static const Color warningHoverBackground = Color(0xFFFFB707);

  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorPrimary = Color(0xFF323232);
  static const Color textColorGreyDark = Color(0xFF979797);
  static const Color backgroundWarning = Color(0xFFFDEDE1);
  static const Color textWarning = Color(0xFFFFB400);
  static const Color textSuccess = Color(0xFF56CA00);
  static const Color errorBackground = Color(0xFFFEE8E7);
  static const Color textError = Color(0xFFFF4C51);
  static const Color textInfo = Color(0xFF0E71A3);
  static const Color successSolid = Color(0xFF28A745);
  static const Color warningSolid = Color(0xFFFFC107);
  static const Color successBackground = Color(0x1428A745);
  static const Color infoBackground = Color(0xFFE4F2FE);
  static const Color warningBackground = Color(0x14FFD864);
  static const Color devider = Color(0x1F3A3541);

  // Leaderboard
  static const Color goldColor = Color(0xFFFFA307);
  static const Color goldBackground = Color(0x33FFA307);
  static const Color silverColor = Color(0xFF6C757D);
  static const Color silverBackground = Color(0x33777B82);
  static const Color bronzeColor = Color(0xFF886D5A);
  static const Color bronzeBackground = Color(0xFFFFE9DA);
  static const Color otherColor = Color(0x0A3A3541);
  static const Color otherBackground = Color(0xFFF4F5FA);
  static const Color otherTextColor = Color(0xDE3A3541);

  static const Color unSelectedMenu = Color(0x423A3541);

  static const Color outlineColorBorder = Color(0x3B3A3541);

  //HOME
  static const Color homeBackground = Color(0xFFF4F5FA);
  static const Color animationBackground = Color(0xFFFCEAD5);

  //LOGIN
  static const Color loginBackround = Color(0xffffffff);

  //LEAVE
  static const Color leaveBackgroundDecorationColor = Color(0xff0E71A3);
  static const Color leaveHeaderColor = Color(0xffffffff);
  static const Color leaveBackgroundScreenColor = Color(0xffF4F5FA);
  static const Color leaveStatusSelectedColor = Color(0xffDC043A);
  static const Color leaveStatusNotSelectedColor = Color(0xff9E9E9E);
  static const Color leaveStatusApprovedBg = Color(0xffeef8f0);
  static const Color leaveStatusRequestedBg = Color(0xfffffcf3);
  static const Color leaveStatusRejectedBg = Color(0xfffceff0);
  static const Color leaveStatusDraftBg = Color(0xfff1fafb);
  static const Color leaveStatusApprovedText = Color(0xff28A745);
  static const Color leaveStatusRequestedText = Color(0xffFFC107);
  static const Color leaveStatusRejectedText = Color(0xffdd3545);
  static const Color leaveStatusDraftText = Color(0xff57bccc);
  static const Color leaveGreyText = Colors.grey;

  static const Color leaveDarkGreyText = Color(0xff3A3541);
  static const Color leaveLessDarkGreyText = Colors.black54;
  static const Color leaveGrey = Colors.grey;
  static const Color leaveLightGrey = Color(0xfff1f1f2);
  static const Color leaveDisabledColor = Colors.black26;
  static const Color leavesButtonColor = Color(0xffDC3545);
  static const Color leaveTextError = Color(0xffFF4C51);
  static const Color leaveRedColor = Color(0xffDC3545);
  static const Color leaveDetailBackgroundScreenColor = Color(0xff0E71A3);
  static const Color leaveApproveButtonColor = Color(0xff56CA00);

  //figma
  static Color lightTextSecondary = const Color(0xff3A3541).withOpacity(0.68);
  static Color lightTextPrimary = const Color(0xff3A3541).withOpacity(0.87);
  static Color lightTextDisabled = const Color(0xff3A3541).withOpacity(0.35);
  static Color lightAlertErrorContent = const Color(0xffFF4C51);
  static Color lightActionSelected = const Color(0x083A3541);
  static Color lightActionActive = const Color(0xff938c91);
  static Color redOutlineHoverBackground =
      const Color(0xffDC3545).withOpacity(0.08);
  static Color warningOutlineHoverBackground =
      const Color(0xffFFD864).withOpacity(0.08);
  static Color successOutlineHoverBackground =
      const Color(0xff28A745).withOpacity(0.08);
  static Color lightBackgroundBody = const Color(0xffF4F5FA);
  static Color lightBackgroundPageHeader = const Color(0xffF9FAFC);
  static Color chipPurple = const Color(0xff9155FD);
  static Color chipBgPurple = const Color(0xffe9adff);
  static Color lightGreyGrey = const Color(0xffe0e0e0);
  static Color lightCustomBackgroundSuccess = const Color(0xffe9f5ea);
  static Color hkWarningOutlinedHoverBackground = const Color(0x08FFD864);
  static Color hkRedOutlinedHoverBackground = const Color(0xfffceff0);
  static Color lightSecondaryMain = const Color(0xff8A8D93);
  static Color blueBgTransparent = const Color(0xffb7f0fb);
  static Color blueTextTransparent = const Color(0xff16B1FF);

  //nine box succession
  static Color nineBoxLightPurple = const Color(0xffF1E3FF);
  static Color nineBoxDarkPurple = const Color(0xff7E00FD);
  static Color nineBoxLightRed = const Color(0xffFFC9C9);
  static Color nineBoxDarkRed = const Color(0xffFF0100);
}

const int kPageSize = 10;
final kHourFormat = DateFormat('HH:mm');
final kDayFormat = DateFormat('EEE, dd');
final kDayMonthFormat = DateFormat('EEE, dd MMM');
final kDayMonthYearFormat = DateFormat('EEE, dd MMM yyyy');
final kFullFormat = DateFormat('EEE, dd MMM yyyy HH:mm');
final kDayShortFormat = DateFormat('dd');
final kDayMonthShortFormat = DateFormat('dd MMM');
final kDayMonthYearShortFormat = DateFormat('dd MMM yyyy');
final kDefaultDateFormat = DateFormat('yyyy-MM-dd');
final kFormatAbbrMonth = DateFormat(DateFormat.ABBR_MONTH, 'id');
