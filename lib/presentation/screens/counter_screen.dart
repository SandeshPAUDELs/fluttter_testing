import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/counter_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/counter_event.dart';
import 'package:flutter_application_2/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Row(
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
                  return Text(state.counter.toString(),
                      style: TextStyle(fontSize: 30));
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
    );
  }
}