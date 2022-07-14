import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nsu_cab/common/enums/enums.dart';
import 'package:nsu_cab/common/icons/nsu_cab_icons.dart';
import 'package:nsu_cab/global_cubits/current_user/current_user_cubit.dart';
import 'package:nsu_cab/l10n/l10n.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

const _WidgetColors = {
  'buttonColor': {
    UserRole.STUDENT: {
      Brightness.light: NsuCabLightColors.greenColor,
      Brightness.dark: NsuCabDarkColors.greenColor,
    },
    UserRole.TEACHER: {
      Brightness.light: NsuCabLightColors.blueColor,
      Brightness.dark: NsuCabDarkColors.blueColor,
    },
  },
};

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onTabChange;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;

    final UserRole _userRole = context.select(
      (CurrentUserCubit e) => e.state.activeRole,
    );
    final Brightness _brightness = Theme.of(context).brightness;

    final _backgroundColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor;

    final _buttonColor =
        _WidgetColors['buttonColor']![_userRole]![_brightness]!;

    final _defaultIcon = Icons.home;
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
      color: _backgroundColor,
      // child: SafeArea(
      child: GNav(
        rippleColor: Colors.transparent,
        hoverColor: Colors.transparent,
        gap: 7.w,
        activeColor: Colors.green,
        tabBorderRadius: 5.r,
        iconSize: 24,
        padding: EdgeInsets.fromLTRB(9.w, 9.h, 5.w, 9.h),
        duration: Duration(milliseconds: 300),
        tabBackgroundColor: _buttonColor,
        color: Colors.white,
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13.sm,
          height: 0,
          fontFamily: 'Montserrat',
          color: Colors.white,
        ),
        tabs: [
          GButton(
            leading: NsuCabIcon(
              NsuCabIcons.menuHome,
              color: Colors.white,
              size: 18.r,
            ),
            icon: _defaultIcon,
            text: _l10n.menuButton1,
            iconColor: Colors.white,
          ),
          GButton(
            leading: NsuCabIcon(
              NsuCabIcons.menuTimetable,
              color: Colors.white,
              size: 18.r,
            ),
            icon: _defaultIcon,
            text: _l10n.menuButton2,
          ),
          GButton(
            leading: NsuCabIcon(
              NsuCabIcons.menuDeanoffice,
              color: Colors.white,
              size: 18.r,
            ),
            icon: _defaultIcon,
            text: _l10n.menuButton3,
          ),
          GButton(
            leading: Badge(
              badgeColor: _buttonColor,
              elevation: 0,
              child: NsuCabIcon(
                NsuCabIcons.menuMessages,
                color: Colors.white,
                size: 18.r,
              ),
            ),
            icon: _defaultIcon,
            text: _l10n.menuButton4,
          ),
          GButton(
            leading: NsuCabIcon(
              NsuCabIcons.menuServices,
              color: Colors.white,
              size: 18.r,
            ),
            icon: _defaultIcon,
            text: _l10n.menuButton5,
          ),
        ],
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
      ),
      // ),
    );
  }
}
