import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsu_cab/common/icons/nsu_cab_icons.dart';
import 'package:nsu_cab/global_features/custom_back_button/custom_back_button.dart';
import 'package:nsu_cab/l10n/l10n.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/modules/login/login_screen/cubit/login_cubit.dart';
import 'package:nsu_cab/theme/nsu_cab_theme.dart';

class LoginScreen extends StatelessWidget {
  final LoginCubit cubit;

  LoginScreen({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _listener(BuildContext context, LoginState state) {
      if (state.successfullyLoggedIn) {}
    }

    Widget _builder(BuildContext context, LoginState state) {
      return _LoginScreenContent(state: state);
    }

    return Scaffold(
      body: BlocProvider(
        create: (context) => cubit,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: NsuCabMargin.contentHorizontal,
            ),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: _listener,
              builder: _builder,
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginScreenContent extends StatefulWidget {
  final LoginState state;

  _LoginScreenContent({Key? key, required this.state}) : super(key: key);

  @override
  State<_LoginScreenContent> createState() => __LoginScreenContentState();
}

class __LoginScreenContentState extends State<_LoginScreenContent> {
  late LoginCubit _cubit;
  late TextEditingController _loginController;
  late TextEditingController _passController;

  @override
  void initState() {
    _cubit = BlocProvider.of<LoginCubit>(context);
    _loginController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  void _onLoginChanged(String login) {
    _cubit.onLoginChanged(login);
  }

  void _onPassChanged(String pass) {
    _cubit.onPassChanged(pass);
  }

  void _onButtonPressed() {
    _cubit.onButtonPressed();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _textTheme = Theme.of(context).textTheme;

    final bool _showErrorText = widget.state.isFailure;
    final bool _canPressButton =
        widget.state.login.isNotEmpty && widget.state.pass.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: NsuCabMargin.backButtonTop),
        CustomBackButton(),
        SizedBox(height: NsuCabMargin.backButtonBot),
        Text(_l10n.loginScreenGreeting, style: _textTheme.headline1),
        SizedBox(height: NsuCabMargin.titleBot),
        Text(_l10n.loginScreenMessageHalf1, style: _textTheme.bodyText1),
        Row(
          children: [
            Text(
              _l10n.loginScreenMessageHalf2 + ' ',
              style: _textTheme.bodyText1,
            ),
            SizedBox(
              height: 16.r,
              width: 16.r,
              child: Image.asset(NsuCabIcons.viva),
            ),
          ],
        ),
        SizedBox(height: 33.h),
        Padding(
          padding: EdgeInsets.only(left: 13.w, bottom: 3.h),
          child: Text(
            _l10n.login,
            style: _textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ),
        TextFormField(
          controller: _loginController,
          decoration: InputDecoration(
            hintText: _l10n.loginScreenLoginPlaceholder,
            errorText: _showErrorText ? _l10n.errorTextField : null,
          ),
          style: _textTheme.bodyText1,
          onChanged: _onLoginChanged,
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.only(left: 13.w, bottom: 3.h),
          child: Text(
            _l10n.password,
            style: _textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
        TextFormField(
          controller: _passController,
          decoration: InputDecoration(
            hintText: _l10n.loginScreenPasswordPlaceholder,
            errorText: _showErrorText ? _l10n.errorTextField : null,
          ),
          style: _textTheme.caption,
          obscureText: true,
          obscuringCharacter: "*",
          onChanged: _onPassChanged,
        ),
        SizedBox(height: 49.h),
        ElevatedButton(
          onPressed: _canPressButton ? _onButtonPressed : null,
          child: Text(_l10n.enter),
        ),
        SizedBox(height: 17.h),
        Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.restorePassword),
              child: Text(
                _l10n.loginScreenRestorePassword,
                style: _textTheme.button?.copyWith(
                  color: NsuCabLightColors.darkColor2,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.haveNoAccount),
              child: Text(
                _l10n.loginScreenHaveNoAccount,
                style: _textTheme.button?.copyWith(
                  color: NsuCabLightColors.darkColor2,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
