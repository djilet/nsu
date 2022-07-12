import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/common/icons/nsu_cab_icons.dart';
import 'package:nsu_cab/global_features/custom_back_button/custom_back_button.dart';
import 'package:nsu_cab/l10n/l10n.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

class RestorePasswordScreen extends StatelessWidget {
  const RestorePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _textTheme = Theme.of(context).textTheme;

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
                _l10n.restorePasswordScreenTitle,
                style: _textTheme.headline1,
              ),
              SizedBox(height: NsuCabMargin.titleBot),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _l10n.restorePasswordScreenSubtitle + ' ',
                      style: _textTheme.bodyText1,
                    ),
                    WidgetSpan(
                      child: SizedBox(
                        height: 16.r,
                        width: 16.r,
                        child: Image.asset(NsuCabIcons.fingerDown),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              _ListPoint(
                richText: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: _l10n.restorePasswordScreenPoint1_1,
                        style: _textTheme.bodyText1,
                      ),
                      TextSpan(
                        text: _l10n.restorePasswordScreenPoint1_2,
                        style: _textTheme.bodyText1
                            ?.copyWith(color: NsuCabLightColors.greenColor),
                      ),
                    ],
                  ),
                ),
              ),
              _ListPoint(
                richText: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: _l10n.restorePasswordScreenPoint2_1,
                        style: _textTheme.bodyText1,
                      ),
                      TextSpan(
                        text: _l10n.restorePasswordScreenPoint2_2,
                        style: _textTheme.bodyText1
                            ?.copyWith(color: NsuCabLightColors.greenColor),
                      ),
                      TextSpan(
                        text: _l10n.restorePasswordScreenPoint2_3,
                        style: _textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
              _ListPoint(
                richText: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: _l10n.restorePasswordScreenPoint3_1,
                        style: _textTheme.bodyText1,
                      ),
                      TextSpan(
                        text: _l10n.supportEmail,
                        style: _textTheme.bodyText1
                            ?.copyWith(color: NsuCabLightColors.greenColor),
                      ),
                      TextSpan(
                        text: _l10n.restorePasswordScreenPoint3_2,
                        style: _textTheme.bodyText1,
                      ),
                    ],
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

class _ListPoint extends StatelessWidget {
  final Widget richText;

  const _ListPoint({
    Key? key,
    required this.richText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: NsuCabIcon(
              NsuCabIcons.nsuStar,
              size: 16.h,
              color: NsuCabLightColors.greenColor,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: richText,
          ),
        ],
      ),
    );
  }
}
