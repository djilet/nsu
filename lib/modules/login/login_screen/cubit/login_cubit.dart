import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsu_cab/common/enums/enums.dart';
import 'package:nsu_cab/global_cubits/current_user/current_user_cubit.dart';
import 'package:nsu_cab/models/user/user_model.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/services/keycloak/keycloak.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CurrentUserCubit currentUserCubit;
  final Keycloak keycloak;
  final GlobalKey<NavigatorState> navigatorKey;

  LoginCubit({
    required this.currentUserCubit,
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

      // demo data
      final user = UserModel(
        id: 1,
        name: 'Антон',
        surname: 'Войтенко',
        patronymic: 'Максимович',
        roles: [UserRole.STUDENT, UserRole.TEACHER],
      );

      await currentUserCubit.setUserDataAndRedirect(user);
    } catch (e) {
      print(e.toString());
    }
  }
}
