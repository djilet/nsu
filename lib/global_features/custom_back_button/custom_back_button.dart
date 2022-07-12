import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/common/icons/nsu_cab_icons.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.fromLTRB(13, 9, 14, 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          color: NsuCabCommonColors.lightColor1,
        ),
        child: NsuCabIcon(
          NsuCabIcons.back,
          color: NsuCabLightColors.darkColor1,
          size: 18,
        ),
      ),
    );
  }
}
