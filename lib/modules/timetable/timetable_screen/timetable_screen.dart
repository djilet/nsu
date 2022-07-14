import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsu_cab/global_cubits/current_user/current_user_cubit.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userRole =
        context.select((CurrentUserCubit e) => e.state.activeRole);

    return Container(
      child: Center(
        child: Text('TimetableScreen ' + _userRole.toString()),
      ),
    );
  }
}
