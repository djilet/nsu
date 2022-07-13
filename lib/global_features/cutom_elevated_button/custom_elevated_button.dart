import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double? pVertical;
  final double? borderRadius;
  final double width;

  final String text;
  final void Function()? onTap;

  CustomElevatedButton({
    Key? key,
    this.primaryColor = NsuCabLightColors.greenColor,
    this.secondaryColor = NsuCabCommonColors.greenColor2,
    this.pVertical,
    this.borderRadius,
    this.width = double.infinity,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _paddingVertical = EdgeInsets.symmetric(vertical: pVertical ?? 10.h);

    final _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      height: 0,
      fontFamily: 'Montserrat',
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
      child: Container(
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: _paddingVertical,
              width: width,
              alignment: Alignment.center,
              child: Text(text, style: _textStyle),
            ),
            highlightColor: Colors.black.withOpacity(0.2),
            splashColor: Colors.black.withOpacity(0.05),
          ),
          color: Colors.transparent,
        ),
        color: onTap != null ? primaryColor : secondaryColor,
      ),
    );
  }
}
