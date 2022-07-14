import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NsuCabMargin {
  static double backButtonTop = 17.h;
  static double backButtonBot = 35.h;
  static double titleBot = 17.5.h;
  static double contentHorizontal = 15.w;
}

class NsuCabCommonColors {
  static const Color darkColor = Color(0xFF21262E);
  static const Color lightColor1 = Color(0xFFF7F7F7);
  static const Color lightColor2 = Color(0xFFFFFFFF);
  static const Color greenColor1 = Color(0xFF579B15);
  static const Color greenColor2 = Color(0xFFB4DF8A);
  static const Color orangeColor = Color(0xFFE96216);
  static const Color redColor = Color(0xFFDD3131);
  static const Color blueColor = Color(0xFF00BDE8);
}

class NsuCabLightColors {
  static const Color darkColor1 = Color(0xFF393E42);
  static const Color darkColor2 = Color(0xFF5D5D5D);
  static const Color greenColor = Color(0xFF72C81E);
  static const Color lightColor = Color(0xFFEEF2FA);
  static const Color blueColor = Color(0xFF00BDE8);

  // box shadow
  static const Color shadow1 = Color.fromARGB(16, 18, 46, 101);
}

class NsuCabDarkColors {
  static const Color darkColor1 = Color(0xFF121212);
  static const Color darkColor2 = Color(0xFF202022);
  static const Color greenColor = Color(0xFF3B9700);
  static const Color greenColor3 = Color(0xFF2C2C2E);
  static const Color blueColor = Color(0xFF1D9FE0);
}

class NsuCabThemes {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: NsuCabLightColors.darkColor1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        // alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return NsuCabCommonColors.greenColor2;
            return NsuCabLightColors.greenColor;
          },
        ),
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.h)),
        // minimumSize: MaterialStateProperty.all(Size(double.infinity, 20.h)),
        overlayColor:
            MaterialStateProperty.all<Color>(NsuCabCommonColors.greenColor1),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 2.sp, // mb change on sp
            fontWeight: FontWeight.w700,
            height: 1.43,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: NsuCabLightColors.greenColor),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: NsuCabCommonColors.darkColor,
        fontSize: 12.sp,
        height: 0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
      ),
      errorStyle: TextStyle(
        fontSize: 10.sp,
        height: 0,
        color: NsuCabCommonColors.redColor,
      ),
      errorBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: NsuCabCommonColors.redColor, width: 1.sp),
      ),
      fillColor: NsuCabCommonColors.lightColor1,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
      isDense: true,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: NsuCabCommonColors.darkColor,
        fontSize: 22.sp,
        height: 1.18,
        fontWeight: FontWeight.w800,
        fontFamily: 'Montserrat',
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        height: 1.44,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat',
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        height: 1.625,
        fontWeight: FontWeight.w800,
        fontFamily: 'Montserrat',
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        height: 1.25,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat',
      ),
      // input hint
      subtitle2: TextStyle(
        color: NsuCabCommonColors.darkColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.364,
        fontFamily: 'Montserrat',
      ),
      // input text
      caption: TextStyle(
        color: NsuCabCommonColors.darkColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.42,
        fontFamily: 'Montserrat',
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        height: 1.53,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
        height: 1.38,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(
        color: NsuCabCommonColors.darkColor,
        fontSize: 13.sp,
        height: 1.538,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      ),
    ),
  );

  static final darkTheme = ThemeData.dark();
}
