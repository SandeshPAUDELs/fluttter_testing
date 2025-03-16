
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/constants/enums.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetEvent {
  final ConnectionType connectionType;

  const InternetConnected({required this.connectionType});

  @override
  List<Object> get props => [connectionType];
}

class InternetDisconnected extends InternetEvent {}