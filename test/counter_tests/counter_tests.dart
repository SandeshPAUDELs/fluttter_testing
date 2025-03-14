import 'package:flutter_application_2/presentation/bloc/counter_bloc.dart';
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

    // blocTest('', build: build)

  });
}