import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/global_features/custom_back_button/custom_back_button.dart';
import 'package:nsu_cab/l10n/l10n.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

class HaveNoAccountScreen extends StatelessWidget {
  const HaveNoAccountScreen({Key? key}) : super(key: key);

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
                _l10n.haveNoAccountScreenTitle,
                style: _textTheme.headline1,
              ),
              SizedBox(height: NsuCabMargin.titleBot),
              Text(
                _l10n.haveNoAccountScreenSubtitle,
                style: _textTheme.bodyText1,
              ),
              SizedBox(height: 27.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _l10n.haveNoAccountScreenTextHalf1,
                      style: _textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: _l10n.supportEmail,
                      style: _textTheme.bodyText1?.copyWith(
                        color: NsuCabLightColors.greenColor,
                      ),
                    ),
                    TextSpan(
                      text: _l10n.haveNoAccountScreenTextHalf2,
                      style: _textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
