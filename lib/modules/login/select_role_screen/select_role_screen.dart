import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/common/icons/nsu_cab_icons.dart';
import 'package:nsu_cab/global_features/custom_back_button/custom_back_button.dart';
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

    final _buttonSize = MaterialStateProperty.all(Size(215.63.w, 24.h));

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
                button: ElevatedButton(
                  onPressed: () => {},
                  child: Text(_l10n.student),
                  style: _buttonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(bottom: 4.h),
                    ),
                    maximumSize: _buttonSize,
                    minimumSize: _buttonSize,
                  ),
                ),
              ),
              _RoleCard(
                button: ElevatedButton(
                  onPressed: () => {},
                  child: Text(_l10n.teacher),
                  style: _buttonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      NsuCabCommonColors.blueColor,
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 1, 152, 186),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(bottom: 4.h),
                    ),
                    maximumSize: _buttonSize,
                    minimumSize: _buttonSize,
                  ),
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
          button,
          SizedBox(height: 36.h),
        ],
      ),
    );
  }
}
