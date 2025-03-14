import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/presentation/bloc/counter_event.dart';
import 'package:flutter_application_2/presentation/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterState()){
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
  }

void _onIncrement(IncrementEvent event, Emitter<CounterState> emit){
  emit(state.copyWith(counter: state.counter + 1));
}
void _onDecrement(DecrementEvent event, Emitter<CounterState> emit){
  emit(state.copyWith(counter: state.counter - 1));
}

}
