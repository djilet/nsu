import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/modules/login/have_no_account_screen/have_no_account_screen.dart';
import 'package:nsu_cab/modules/login/login_screen/cubit/login_cubit.dart';
import 'package:nsu_cab/modules/login/login_screen/view/login_screen.dart';
import 'package:nsu_cab/modules/login/restore_password_screen/restore_password_screen.dart';
import 'package:nsu_cab/modules/login/select_role_screen/select_role_screen.dart';
import 'package:nsu_cab/modules/login/welcome_screen/welcome_screen.dart';
import 'package:nsu_cab/services/http_provider/http_provider.dart';
import 'package:nsu_cab/services/keycloak/keycloak.dart';
import 'package:nsu_cab/services/keycloak_refresh_token_storage/keycloak_refresh_token_storage.dart';
import 'package:nsu_cab/services/keycloak_token_storage/keycloak_token_storage.dart';
import 'package:nsu_cab/services/secure_storage/secure_storage.dart';

final sl = GetIt.instance;

void initGetIt() {
  //router
  sl.registerLazySingleton<Map<String, WidgetBuilder>>(
    () => ({
      // login module
      Routes.welcome: (context) => sl.get<WelcomeScreen>(),
      Routes.login: (context) => sl.get<LoginScreen>(),
      Routes.restorePassword: (context) => sl.get<RestorePasswordScreen>(),
      Routes.haveNoAccount: (context) => sl.get<HaveNoAccountScreen>(),
      Routes.selectRole: (context) => sl.get<SelectRoleScreen>(),
    }),
  );

  // screens
  // login module
  sl.registerFactory<WelcomeScreen>(() => WelcomeScreen());
  sl.registerFactory<LoginScreen>(
    () => LoginScreen(
      cubit: sl.get<LoginCubit>(),
    ),
  );
  sl.registerFactory<RestorePasswordScreen>(() => RestorePasswordScreen());
  sl.registerFactory<HaveNoAccountScreen>(() => HaveNoAccountScreen());
  sl.registerFactory<SelectRoleScreen>(() => SelectRoleScreen());

  // cubits
  // login module
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      keycloak: sl.get<Keycloak>(),
      navigatorKey: sl.get<GlobalKey<NavigatorState>>(),
    ),
  );

  // repositories

  // SERVICES

  // dio - http provider
  sl.registerFactory<HttpService>(
    () => HttpService(
      keycloak: sl.get<Keycloak>(),
      keycloakTokenStorage: sl.get<KeycloakTokenStorage>(),
    ),
  );

  // keycloak
  sl.registerLazySingleton<Keycloak>(
    () => Keycloak(
      keycloakTokenStorage: sl.get<KeycloakTokenStorage>(),
      keycloakRefreshTokenStorage: sl.get<KeycloakRefreshTokenStorage>(),
      navigatorKey: sl.get<GlobalKey<NavigatorState>>(),
    ),
  );

  // local storage services
  sl.registerLazySingleton<KeycloakTokenStorage>(
    () => KeycloakTokenStorage(storage: sl.get<SecureStorage>()),
  );
  sl.registerLazySingleton<KeycloakRefreshTokenStorage>(
    () => KeycloakRefreshTokenStorage(storage: sl.get<SecureStorage>()),
  );

  // local storage
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());

  // routing navigator
  sl.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
}
