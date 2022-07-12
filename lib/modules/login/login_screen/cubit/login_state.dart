part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.isFailure = false,
    this.successfullyLoggedIn = false,
    // ----
    this.login = '',
    this.pass = '',
  });

  final bool isLoading;
  final bool isFailure;
  final bool successfullyLoggedIn;
  // ----
  final String login;
  final String pass;

  LoginState copyWith({
    bool? isLoading,
    bool? isFailure,
    bool? successfullyLoggedIn,
    // ----
    String? login,
    String? pass,
  }) =>
      LoginState(
        isLoading: isLoading ?? this.isLoading,
        isFailure: isFailure ?? this.isFailure,
        successfullyLoggedIn: successfullyLoggedIn ?? this.successfullyLoggedIn,
        // ----
        login: login ?? this.login,
        pass: pass ?? this.pass,
      );

  @override
  List<Object> get props => [
        isLoading,
        isFailure,
        successfullyLoggedIn,
        // ----
        login,
        pass,
      ];
}
