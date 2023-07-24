import 'package:caculator/logic/bloc/changetheme_bloc.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:caculator/screens/down_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/calculate_bloc.dart';

class viewscreen extends StatefulWidget {
  viewscreen({super.key});

  @override
  State<viewscreen> createState() => _viewscreenState();
}

class _viewscreenState extends State<viewscreen> {
  List num = [];

  String stringnum = '';

  String operatio = '';

  List num2 = [];

  String stringnum2 = '';

  int result = 0;

  double resultd = 0.0;

  bool isdouble = false;

  late int _clear;

  bool isclear = false;

  bool _isdark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CalculateBloc, CalculateState>(
        listener: (context, state) {
          print(state);
          if (state is number) {
            num.add(state.num);
            operatio == '' ? stringnum = num.join('') : print('nothin');
          } else if (state is operation) {
            operatio = state.op;
          } else if (state is number2) {
            num2.add(state.num);
            stringnum2 = num2.join('');
          } else if (state is result_state) {
            if (state.reso is int)
              result = state.reso;
            else {
              isdouble = true;
              resultd = state.reso;
            }
          } else if (state is clear) {
            isclear = true;
            _clear = state.clears;
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Container(
                height: 130,
                padding: EdgeInsets.only(top: 50),
                child: Align(
                  child: DayNightSwitcher(
                    isDarkModeEnabled: _isdark,
                    onStateChanged: (isDarkModeEnabled) {
                      setState(() {
                        _isdark = isDarkModeEnabled;
                      });
                      BlocProvider.of<ChangethemeBloc>(context)
                          .add(changetheme(isDarkModeEnabled));
                    },
                  ),
                  alignment: Alignment.topCenter,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 1, left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  isclear == false ? stringnum : '',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 30),
                                ),
                                Text(
                                  isclear == false ? ' $operatio ' : '',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 30),
                                ),
                                Text(
                                  isclear == false ? stringnum2 : '',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 30),
                                ),
                              ],
                            ),
                            Text(
                              isclear == false
                                  ? isdouble == false
                                      ? result.toString()
                                      : resultd.toString()
                                  : _clear.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 60),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //the down button
                            Down(
                              opra: operatio != '' ? true : false,
                              input1: stringnum,
                              input2: stringnum2,
                              opration: operatio,
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
