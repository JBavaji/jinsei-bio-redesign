import 'package:serverpod/serverpod.dart';

/// Lightweight Mock Session for Serverpod Endpoint unit testing without PostgreSQL
class MockSession implements Session {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
