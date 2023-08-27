import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internetcubit_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStream;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    monitorInternetConnection();

  }

  void monitorInternetConnection(){
    connectivityStream = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.wifi);
      }
      else if (connectivityResult == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.mobile);
      }
      else if (connectivityResult == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }

  @override
  Future<void> close() {
     connectivityStream.cancel();
    return super.close();
  }

  void emitInternetConnected(ConnectionType type){
    emit(InternetConnected(connectionType: type));
  }
  void emitInternetDisconnected(){
    emit(InternetDisconnected());
  }

}
