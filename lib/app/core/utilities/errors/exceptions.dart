import 'package:equatable/equatable.dart';

import 'failure.dart';

class ServerException extends Equatable implements Exception {
  final Failure err;
  const ServerException(this.err);
  @override
  List<Object?> get props => [err];
}

class ConnectionException extends Equatable implements Exception {
  final Failure err;
  const ConnectionException(this.err);
  @override
  List<Object?> get props => [err];
}
