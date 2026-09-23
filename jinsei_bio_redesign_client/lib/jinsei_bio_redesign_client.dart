import 'package:serverpod_client/serverpod_client.dart';

/// Serverpod Auto-Generated Client SDK Protocol & Caller Scaffold
class Client extends ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    health = EndpointHealth(this);
  }

  late final EndpointHealth health;

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'health': health,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}

class Protocol extends SerializationManager {
  @override
  String get architectureVersion => '1.0';

  @override
  Map<String, String> get classNameTable => {};

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    throw UnimplementedError();
  }
}

class EndpointHealth extends EndpointRef {
  EndpointHealth(EndpointCaller caller) : super(caller);

  @override
  String get name => 'health';

  Future<String> ping() async {
    var response = await caller.callServerEndpoint<String>(
      'health',
      'ping',
      {},
    );
    return response;
  }

  Future<Map<String, String>> status() async {
    var response = await caller.callServerEndpoint<Map<String, String>>(
      'health',
      'status',
      {},
    );
    return response;
  }
}
