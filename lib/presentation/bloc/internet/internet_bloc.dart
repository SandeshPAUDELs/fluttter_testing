import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/constants/enums.dart';
import 'package:flutter_application_2/presentation/bloc/internet/internet_event.dart';
import 'package:flutter_application_2/presentation/bloc/internet/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  InternetBloc({required this.connectivity}) : super(InternetLoading()) {
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((connectivityResults) {
      final connectivityResult = connectivityResults.isNotEmpty ? connectivityResults.first : ConnectivityResult.none;

      if (connectivityResult == ConnectivityResult.wifi) {
        add(InternetConnected(connectionType: ConnectionType.Wifi));
      } else if (connectivityResult == ConnectivityResult.mobile) {
        add(InternetConnected(connectionType: ConnectionType.Mobile));
      } else if (connectivityResult == ConnectivityResult.none) {
        add(InternetDisconnected());
      }
    });

    on<InternetConnected>((event, emit) {
      emit(InternetConnectionSuccess(connectionType: event.connectionType));
    });

    on<InternetDisconnected>((event, emit) {
      emit(InternetConnectionDisconnected(connectionType: ConnectionType.None));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
