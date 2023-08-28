
import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';




part 'countercubit_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {

  CounterCubit() : super(CounterState(counterValue: 0));


  increment() => emit(CounterState(counterValue: state.counterValue+1,isIncremented: true));
  decrement() => emit(CounterState(counterValue: state.counterValue-1,isIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }


}
