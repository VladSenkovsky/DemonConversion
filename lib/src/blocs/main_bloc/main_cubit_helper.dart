import 'package:flutter/material.dart';
import 'package:flutter_app/src/blocs/main_bloc/main_state.dart';
import 'package:flutter_app/src/screens/first_screen.dart';
import 'package:flutter_app/src/screens/second_screen.dart';
import 'package:flutter_app/src/screens/third_screen.dart';

class MainCubitHelper {
  Widget mainWidget(MainState state) {
    Widget widget;
    switch (state.toString()) {
      case ('InitialState'):
        {
          widget = FirstScreen();
          return widget;
        }
        break;
      case ('FirstScreenState'):
        {
          widget = FirstScreen();
          return widget;
        }
        break;
      case ('SecondScreenState'):
        {
          SecondScreenState secondScreenState = state as SecondScreenState;
          widget = SecondScreen(secondScreenState.gVars);
          return widget;
        }
        break;
      case ('ThirdScreenState'):
        {
          ThirdScreenState thirdScreenState = state as ThirdScreenState;
          widget = ThirdScreen(thirdScreenState.gVars);
          return widget;
        }
        break;
      default:
        {
          return Container();
        }
        break;
    }
  }
}
