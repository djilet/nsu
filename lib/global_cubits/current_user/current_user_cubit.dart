import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsu_cab/common/enums/enums.dart';
import 'package:nsu_cab/common/utils/enum.dart';
import 'package:nsu_cab/models/user/user_model.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/services/user_role_storage/user_role_storage.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  final GlobalKey<NavigatorState> navigatorKey;
  final UserRoleStorage userRoleStorage;

  CurrentUserCubit({
    required this.navigatorKey,
    required this.userRoleStorage,
  }) : super(CurrentUserState());

  FutureOr<void> setUserDataAndRedirect(UserModel user) async {
    // await userRoleStorage.deleteRole();
    if (user.roles.length == 2) {
      final storageRole = await userRoleStorage.getRole();

      if (storageRole != null) {
        final enumRole = enumFromString(storageRole, UserRole.values)!;

        emit(state.copyWith(user: user, activeRole: enumRole));

        navigatorKey.currentState!.pushNamedAndRemoveUntil(
          Routes.main,
          (route) => false,
        );
      } else {
        emit(state.copyWith(user: user));

        navigatorKey.currentState!.pushNamed(Routes.selectRole);
      }
    } else {
      emit(state.copyWith(user: user, activeRole: user.roles[0]));

      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        Routes.main,
        (route) => false,
      );
    }
  }

  FutureOr<void> setActiveRoleAndRedirect(UserRole role) async {
    // await userRoleStorage.writeRole(enumToString(role));

    emit(state.copyWith(activeRole: role));

    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      Routes.main,
      (route) => false,
    );
  }
}
