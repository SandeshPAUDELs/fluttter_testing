import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_bloc.dart';
import 'package:flutter_application_2/presentation/screens/counter_screen.dart';
import 'package:flutter_application_2/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  injection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(
          create: (context) => ProductBloc(getIt()),
        ),
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
