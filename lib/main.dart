import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/internet/internet_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_bloc.dart';
import 'package:flutter_application_2/presentation/screens/counter_screen.dart';
import 'package:flutter_application_2/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  injection();
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  MyApp({super.key, required this.connectivity });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(
          create: (context) => ProductBloc(getIt()),
        ),
        BlocProvider(create: (context) => InternetBloc(connectivity: Connectivity())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: CounterScreen(),
      ),
    );
  }
}
