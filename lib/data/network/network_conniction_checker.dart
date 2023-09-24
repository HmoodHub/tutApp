import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnection;
}

class CheckNetwork implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  CheckNetwork(this._connectionChecker);

  @override
  // TODO: implement isConnection
  Future<bool> get isConnection => _connectionChecker.hasConnection;
}
