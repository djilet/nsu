import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/global_features/cutom_elevated_button/custom_elevated_button.dart';
import 'package:nsu_cab/l10n/l10n.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome_screen.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: _l10n.welcomScreenTitleHalf1 + ' ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.sp,
                            height: 1.2,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        TextSpan(
                          text: _l10n.welcomScreenTitleHalf2,
                          style: TextStyle(
                            color: NsuCabLightColors.greenColor,
                            fontSize: 42.sp,
                            height: 1.2,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _l10n.welcomScreenSubtitleHalf1,
                    style: _textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _l10n.welcomScreenSubtitleHalf2,
                    style: _textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 27.h),
                  Container(
                    // height: 40.h,
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 197.29.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4F8D12),
                          NsuCabLightColors.greenColor,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: CustomElevatedButton(
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.login,
                      ),
                      borderRadius: 3.r,
                      primaryColor: Colors.transparent,
                      text: _l10n.enter,
                    ),
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    _l10n.whatIsHere,
                    style: _textTheme.button!.copyWith(
                      color: NsuCabLightColors.greenColor,
                    ),
                  ),
                  SizedBox(height: 89),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
