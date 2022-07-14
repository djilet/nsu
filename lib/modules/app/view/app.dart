import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsu_cab/global_cubits/current_user/current_user_cubit.dart';
import 'package:nsu_cab/l10n/l10n.dart';
import 'package:nsu_cab/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final CurrentUserCubit _currentUserCubit = sl.get<CurrentUserCubit>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Future.delayed(Duration(milliseconds: 1)).then(
      (value) => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CurrentUserCubit>(
              create: (_) => _currentUserCubit,
            ),
          ],
          child: MaterialApp(
            themeMode: ThemeMode.light,
            theme: NsuCabThemes.lightTheme,
            darkTheme: NsuCabThemes.darkTheme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: sl.get<GlobalKey<NavigatorState>>(),
            routes: sl<Map<String, WidgetBuilder>>(),
            initialRoute: Routes.welcome,
          ),
        );
      },
    );
  }
}
