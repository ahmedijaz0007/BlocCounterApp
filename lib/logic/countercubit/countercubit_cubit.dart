import 'dart:async';

import 'package:bloc/bloc.dart';

import '../internetcubit/internetcubit_cubit.dart';

part 'countercubit_state.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit() : super(CounterState(counterValue: 0));


  increment() => emit(CounterState(counterValue: state.counterValue+1,isIncremented: true));
  decrement() => emit(CounterState(counterValue: state.counterValue-1,isIncremented: false));


}
