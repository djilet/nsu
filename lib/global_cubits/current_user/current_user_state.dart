part of 'current_user_cubit.dart';

class CurrentUserState extends Equatable {
  const CurrentUserState({
    this.isLoading = false,
    this.isFailure = false,
    this.failureReason = '',
    // ---
    this.user,
    this.activeRole = UserRole.STUDENT,
  });

  final bool isLoading;
  final bool isFailure;
  final String failureReason;
  // ---
  final UserModel? user;
  final UserRole activeRole;

  CurrentUserState copyWith({
    bool? isLoading,
    bool? isFailure,
    String? failureReason,
    // ---
    UserModel? user,
    UserRole? activeRole,
  }) =>
      CurrentUserState(
        isLoading: isLoading ?? this.isLoading,
        isFailure: isFailure ?? this.isFailure,
        failureReason: failureReason ?? this.failureReason,
        // ---
        user: user ?? this.user,
        activeRole: activeRole ?? this.activeRole,
      );

  @override
  List<Object?> get props => [
        isLoading,
        isFailure,
        failureReason,
        // ---
        user,
        activeRole,
      ];
}
