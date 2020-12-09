import 'package:flutter_app/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialState());

  Future<void> toFirstScreen() async {
    emit(FirstScreenState());
  }

  Future<void> toSecondScreen(GVars gVars) async {
    emit(SecondScreenState(gVars));
  }

  Future<void> toThirdScreen(GVars gVars) async {
    emit(ThirdScreenState(gVars));
  }
}
