import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_event.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_state.dart';
import 'package:flutter_application_2/presentation/bloc/internet/internet_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/internet/internet_state.dart';
import 'package:flutter_application_2/presentation/screens/product_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetConnectionDisconnected) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.signal_wifi_off, size: 50, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    'You are not connected to the internet',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ],
              );
            }
            
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementEvent());
                      },
                      child: const Icon(Icons.add),
                    ),
                    BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        return Text(
                          state.counter.toString(),
                          style: TextStyle(fontSize: 30),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementEvent());
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductScreen()),
                    );
                  },
                  child: Text('Product Screen'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
