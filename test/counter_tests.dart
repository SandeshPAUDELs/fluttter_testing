import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_event.dart';
import 'package:flutter_application_2/presentation/bloc/counter/counter_state.dart';
import 'package:test/test.dart';

void main() {
  group('CounterBloc', (){
    late CounterBloc counterBloc;
    setUp((){
      counterBloc = CounterBloc();
    });
    tearDown((){
      counterBloc.close();
    });

    test('initial state is CounterState(counter: 0)', (){
      expect(counterBloc.state.counter, 0);
    });

    blocTest('when increment counter pressed the value should be increased by 1', build: () => counterBloc, act: (bloc) => bloc.add(IncrementEvent()), expect: () => [CounterState(counter: 1)]);
    blocTest('when decrement button clicked value shoule be decrased by 1', build: () => counterBloc, act: (bloc) => bloc.add(DecrementEvent()), expect: () => [CounterState(counter: -1)]);

  });
}