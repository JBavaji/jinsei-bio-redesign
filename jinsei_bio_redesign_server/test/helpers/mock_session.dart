import 'package:serverpod/serverpod.dart';

/// Lightweight Mock Session for Serverpod Endpoint unit testing without PostgreSQL
class MockSession implements Session {
  @override
  void log(
    String message, {
    LogLevel? level,
    dynamic exception,
    StackTrace? stackTrace,
  }) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
