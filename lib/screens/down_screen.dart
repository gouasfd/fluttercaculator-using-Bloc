import 'package:caculator/logic/bloc/calculate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Down extends StatelessWidget {
  bool opra = false;
  String opration = '';
  String input1 = '';
  String input2 = '';
  Down(
      {super.key,
      required this.opra,
      required this.opration,
      required this.input1,
      required this.input2});
  List<String> buttonlist = [
    "C",
    "<-",
    "%",
    "/",
    "7",
    "8",
    "9",
    "+",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "X",
    "0",
    ".",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Expanded(
        child: GridView.builder(
          itemCount: buttonlist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  print('index: $index');
                  if (index == 18) {
                    BlocProvider.of<CalculateBloc>(context).add(
                        result(int.parse(input1), int.parse(input2), opration));
                  } else if (index == 0) {
                    BlocProvider.of<CalculateBloc>(context).add(clear_event());
                  } else if (index == 2 ||
                      index == 3 ||
                      index == 7 ||
                      index == 11 ||
                      index == 15) {
                    BlocProvider.of<CalculateBloc>(context)
                        .add(oprationevent(buttonlist[index]));
                  } else if ((index == 4 ||
                          index == 5 ||
                          index == 6 ||
                          index == 8 ||
                          index == 9 ||
                          index == 10 ||
                          index == 12 ||
                          index == 13 ||
                          index == 14 ||
                          index == 16) &&
                      opra == false) {
                    BlocProvider.of<CalculateBloc>(context)
                        .add(numbers(int.parse(buttonlist[index])));
                  } else if ((index == 4 ||
                          index == 5 ||
                          index == 6 ||
                          index == 8 ||
                          index == 9 ||
                          index == 10 ||
                          index == 12 ||
                          index == 13 ||
                          index == 14 ||
                          index == 16) &&
                      opra == true) {
                    BlocProvider.of<CalculateBloc>(context)
                        .add(numbers2(int.parse(buttonlist[index])));
                  }
                },
                child: Ink(
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          index == 3 || index == 7 || index == 11 || index == 15
                              ? Colors.orange
                              : index == 0 || index == 1 || index == 2
                                  ? Colors.grey[700]
                                  : Colors.grey,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 7,
                            spreadRadius: 0.3,
                            offset: Offset(4, 4)),
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(-3, -3)),
                      ]),
                  child: Center(
                    child: Text(
                      buttonlist[index],
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
