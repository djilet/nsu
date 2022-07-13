import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/common/icons/nsu_cab_icons.dart';
import 'package:nsu_cab/global_features/custom_back_button/custom_back_button.dart';
import 'package:nsu_cab/global_features/cutom_elevated_button/custom_elevated_button.dart';
import 'package:nsu_cab/l10n/l10n.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _textTheme = Theme.of(context).textTheme;
    final _buttonTheme = Theme.of(context).elevatedButtonTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: NsuCabMargin.contentHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: NsuCabMargin.backButtonTop),
              CustomBackButton(),
              SizedBox(height: NsuCabMargin.backButtonBot),
              Text(
                _l10n.selectRoleScreenTitle,
                style: _textTheme.headline1,
              ),
              SizedBox(height: NsuCabMargin.titleBot),
              Text(
                _l10n.selectRoleScreenSubtitleHalf1,
                style: _textTheme.bodyText1,
              ),
              Text(
                _l10n.selectRoleScreenSubtitleHalf2,
                style: _textTheme.bodyText1,
              ),
              SizedBox(height: 28.h),
              _RoleCard(
                button: CustomElevatedButton(
                  onTap: () => {},
                  text: _l10n.student,
                  pVertical: 3.25.h,
                ),
              ),
              _RoleCard(
                button: CustomElevatedButton(
                  onTap: () => {},
                  text: _l10n.teacher,
                  primaryColor: NsuCabCommonColors.blueColor,
                  pVertical: 3.25.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final Widget button;

  const _RoleCard({Key? key, required this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 23.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 22,
            offset: Offset(4, 4),
            color: NsuCabLightColors.shadow1,
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 34.h),
          SvgPicture.asset(
            NsuCabIcons.owl,
            width: 120.w,
            height: 71.19.h,
            color: NsuCabLightColors.darkColor1,
          ),
          SizedBox(height: 28.81.h),
          Container(
            constraints: BoxConstraints(maxWidth: 215.w),
            child: button,
          ),
          SizedBox(height: 36.h),
        ],
      ),
    );
  }
}
