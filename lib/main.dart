import 'package:caculator/logic/bloc/changetheme_bloc.dart';
import 'package:caculator/screens/up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/bloc/calculate_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculateBloc>(create: (context) => CalculateBloc()),
        BlocProvider<ChangethemeBloc>(create: (context) => ChangethemeBloc()),
      ],
      child: BlocBuilder<ChangethemeBloc, ChangethemeState>(
          builder: (context, state) {
        if (state is changethe) {
          return MaterialApp(
            theme: ThemeData(
              brightness: state.theme ? Brightness.dark : Brightness.light,
            ),
            home: viewscreen(),
          );
        } else if (state is ChangethemeInitial) {
          return MaterialApp(
            home: viewscreen(),
          );
        } else {
          // You can provide a default theme here if needed
          return MaterialApp(
            theme: ThemeData(brightness: Brightness.light),
            home: Scaffold(),
          );
        }
      }),
    );
  }
}
