import 'dart:async';

import 'package:bloc/bloc.dart';

import '../internetcubit/internetcubit_cubit.dart';

part 'countercubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  InternetCubit internetCubit;
  late StreamSubscription internetStream;  //make sure to cancel stream in close function
  CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0)){

   monitorCounter();
  }
 void monitorCounter(){
   internetStream = internetCubit.stream.listen((internetState){
     if (internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi){
       increment();
     }
     else if (internetState is InternetConnected && internetState.connectionType == ConnectionType.mobile){
       decrement();
     }
   });
 }

  increment() => emit(CounterState(counterValue: state.counterValue+1,isIncremented: true));
  decrement() => emit(CounterState(counterValue: state.counterValue-1,isIncremented: false));

  @override
  Future<void> close() {
    internetStream.cancel();
    return super.close();
  }
}
