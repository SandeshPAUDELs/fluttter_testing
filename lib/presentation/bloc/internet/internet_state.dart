import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/constants/enums.dart';

abstract class InternetState extends Equatable{}

class InternetLoading extends InternetState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InternetConnectionSuccess extends InternetState {
  final ConnectionType connectionType;

  InternetConnectionSuccess({required this.connectionType});
  
  @override
  List<Object?> get props => [connectionType];
}


class InternetConnectionDisconnected extends InternetState{
  final ConnectionType connectionType;

  InternetConnectionDisconnected({required this.connectionType});
  @override
  List<Object?> get props => [connectionType];
}

