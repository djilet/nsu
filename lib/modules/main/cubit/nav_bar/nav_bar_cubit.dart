import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubbit extends Cubit<bool> {
  NavBarCubbit() : super(true);
  void show() => emit(true);
  void hide() => emit(false);
}
