import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/blocs/main_bloc/main_cubit.dart';

class SecondScreen extends StatefulWidget {
  GVars gVars;
  SecondScreen(this.gVars);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  GVars get gVars => widget.gVars;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/app_style/app_bg.jpg"),
              fit: BoxFit.cover)),
      padding: EdgeInsets.all(0.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              width: 140,
              height: 40,
              child: Text("Choose town", style: TextStyle(color: Color.fromRGBO(250, 228, 150, 1),
                  fontSize: 20, decoration: TextDecoration.none, fontWeight: FontWeight.normal))
          ),
          SizedBox (height: MediaQuery.of(context).size.height / 3.5),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
          Container(
                width: 75.0 * 1.5,
                height: 35.0 * 1.5,
                child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: RaisedButton(
                        onPressed:() {
                          gVars.town = "castle";
                          BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                        },
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset('images/towns/castle.gif')))),
          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "rampart";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/rampart.gif')))),
          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "tower";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/tower.gif'))))
          ]
          ),
          SizedBox (height:5),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "inferno";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/inferno.gif')))),
          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "dungeon";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/dungeon.gif')))),

          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "stronghold";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/stronghold.gif')))),
        ]
      ),
          SizedBox (height:5),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "fortress";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/fortress.gif')))),
          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "conflux";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/conflux.gif')))),
          Container(
              width: 75.0 * 1.5,
              height: 35.0 * 1.5,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "cove";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/cove.gif')))),
          ]
      ),
          SizedBox (height:5),
          Container(
              width: 100.0,
              height: 48.0,
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: RaisedButton(
                      onPressed:() {
                        gVars.town = "neutrals";
                        BlocProvider.of<MainCubit>(context).toThirdScreen(gVars);
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('images/towns/neutrals.jpg')))),
          SizedBox (height: MediaQuery.of(context).size.height / 5),
        Container(
            width: 66.0 * 1.5,
            height: 32.0 * 1.5,
            child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: RaisedButton(
                    onPressed: () {
                      BlocProvider.of<MainCubit>(context)
                          .toFirstScreen();
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset('images/app_style/cancel.png'))))
          ,
        ],
      ),
    ));
  }
}
