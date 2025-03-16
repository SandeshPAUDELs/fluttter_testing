import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/presentation/bloc/internet/internet_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/internet/internet_state.dart';

import 'connection_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('InternetBloc', () {
    late InternetBloc internetBloc;
    late MockConnectivity mockConnectivity;

    setUp(() {
      internetBloc = InternetBloc(connectivity: Connectivity());
      mockConnectivity = MockConnectivity();
    });
    tearDown(() {
      internetBloc.close();
    });

    test('initial state is InternetLoading', () {
      expect(
        InternetBloc(connectivity: Connectivity()).state,
        InternetLoading(),
      );
    });
    


  });
}