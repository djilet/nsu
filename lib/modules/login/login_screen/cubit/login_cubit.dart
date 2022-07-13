import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/services/keycloak/keycloak.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Keycloak keycloak;
  final GlobalKey<NavigatorState> navigatorKey;

  LoginCubit({
    required this.navigatorKey,
    required this.keycloak,
  }) : super(LoginState());

  FutureOr<void> onLoginChanged(String login) async {
    emit(state.copyWith(isFailure: false, login: login));
  }

  FutureOr<void> onPassChanged(String pass) async {
    emit(state.copyWith(isFailure: false, pass: pass));
  }

  FutureOr<void> onButtonPressed() async {
    try {
      // await keycloak.getTokens(state.login, state.pass);
      navigatorKey.currentState!.pushNamed(Routes.selectRole);
    } catch (e) {
      print(e.toString());
    }
  }
}
