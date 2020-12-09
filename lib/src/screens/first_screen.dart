import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/blocs/main_bloc/main_cubit.dart';
import 'package:flutter_app/globals.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int index1 = 0;
  int index2 = 0;
  int index3 = 0;
  int index4 = 0;
  GVars gVars = new GVars();
  final pitLordsController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/app_style/app_bg.jpg"),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(0),
          child: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 35,
                  child: Text("Choose artifacts",
                      style: TextStyle(color: Color.fromRGBO(250, 228, 150, 1),
                          fontSize: 20)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 58.0,
                        height: 64.0,
                        child: Image.asset('images/artifacts/ring1.jpg')),
                    Container(
                        width: 66.0 * 1.5,
                        height: 32.0 * 1.5,
                        child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: RaisedButton(
                                onPressed: () {
                                  gVars.ring1 = !gVars.ring1;
                                  gVars.elixir = false;
                                  index4 = 0;
                                  if (gVars.ring1 == false) {
                                    index1 = 0;
                                  } else {
                                    index1 = 1;
                                  }
                                  BlocProvider.of<MainCubit>(context)
                                      .toFirstScreen();
                                },
                                padding: EdgeInsets.all(0.0),
                                child: gVars.stateImg[index1]))),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 58.0,
                        height: 64.0,
                        child: Image.asset('images/artifacts/ring2.jpg')),
                    Container(
                        width: 66.0 * 1.5,
                        height: 32.0 * 1.5,
                        child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: RaisedButton(
                                onPressed: () {
                                  gVars.ring2 = !gVars.ring2;
                                  gVars.elixir = false;
                                  index4 = 0;
                                  if (gVars.ring2 == false) {
                                    index2 = 0;
                                  } else {
                                    index2 = 1;
                                  }
                                  BlocProvider.of<MainCubit>(context)
                                      .toFirstScreen();
                                },
                                padding: EdgeInsets.all(0.0),
                                child: gVars.stateImg[index2]))),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 58.0,
                        height: 64.0,
                        child: Image.asset('images/artifacts/vial.jpg')),
                    Container(
                        width: 66.0 * 1.5,
                        height: 32.0 * 1.5,
                        child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: RaisedButton(
                                onPressed: () {
                                  gVars.vial = !gVars.vial;
                                  gVars.elixir = false;
                                  index4 = 0;
                                  if (gVars.vial == false) {
                                    index3 = 0;
                                  } else {
                                    index3 = 1;
                                  }
                                  BlocProvider.of<MainCubit>(context)
                                      .toFirstScreen();
                                },
                                padding: EdgeInsets.all(0.0),
                                child: gVars.stateImg[index3]))),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 58.0,
                        height: 64.0,
                        child: Image.asset('images/artifacts/elixir.jpg')),
                    Container(
                        width: 66.0 * 1.5,
                        height: 32.0 * 1.5,
                        child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: RaisedButton(
                                onPressed: () {
                                  gVars.elixir = !gVars.elixir;
                                  if (gVars.elixir == false) {
                                    gVars.ring1 = false;
                                    gVars.ring2 = false;
                                    gVars.vial = false;
                                    index1 = 0;
                                    index2 = 0;
                                    index3 = 0;
                                    index4 = 0;
                                  } else {
                                    gVars.ring1 = true;
                                    gVars.ring2 = true;
                                    gVars.vial = true;
                                    index1 = 1;
                                    index2 = 1;
                                    index3 = 1;
                                    index4 = 1;
                                  }
                                  BlocProvider.of<MainCubit>(context)
                                      .toFirstScreen();
                                },
                                padding: EdgeInsets.all(0.0),
                                child: gVars.stateImg[index4]))),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6.45,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: 41.0,
                          height: 93.0,
                          child:
                              Image.asset('images/units/inferno/pit_lord.gif')),
                    ],
                  ),
                ),
                Container(
                    height: 90,
                    child: Form(
                      key: gVars.formPit_LordKey,
                    child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'How many Pit Lords you have?',
                          labelStyle: TextStyle(color: Color.fromRGBO(250, 228, 150, 1),
                          fontSize: 20),
                        ),
                        keyboardType: TextInputType.number,
                        controller: pitLordsController,
                        onSaved: (String value) {
                          gVars.unitsInfo['pit_lord'] = int.parse(value);
                        },
                        validator: (String value) {
                          if ( int.parse(value) == 0) {
                            print('you entered 0');
                            return ('amount should be greater than 0');
                          } else if (int.parse(value) < 0) {
                            print ('you entered value < 0');
                            return ('amount cannot be negative');
                          } else {
                            print ('all gucci');
                            return null;
                          }
                    }
                        ))),
                Container(
                    width: 66.0 * 1.5,
                    height: 32.0 * 1.5,
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: RaisedButton(
                            onPressed: () {
                              if (gVars.formPit_LordKey.currentState.validate()) {
                                gVars.formPit_LordKey.currentState.save();
                               }
                              if(gVars.unitsInfo['pit_lord'] > 0) {
                                BlocProvider.of<MainCubit>(context)
                                    .toSecondScreen(gVars);
                              }
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('images/app_style/ok.png'))))
              ])),
    ));
  }
}
