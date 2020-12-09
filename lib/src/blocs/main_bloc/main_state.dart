import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart';

@immutable
abstract class MainState {}

class InitialState extends MainState {
  @override
  String toString() => 'InitialState';
}

class FirstScreenState extends MainState {
  @override
  String toString() => 'FirstScreenState';
}

class SecondScreenState extends MainState {
  GVars gVars;

  SecondScreenState(this.gVars);

  @override
  String toString() => 'SecondScreenState';
}

class ThirdScreenState extends MainState {
  GVars gVars;

  ThirdScreenState(this.gVars);

  @override
  String toString() => 'ThirdScreenState';
}
