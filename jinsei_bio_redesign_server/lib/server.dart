import 'package:serverpod/serverpod.dart';
import 'src/endpoints/health_endpoint.dart';

/// Serverpod initialization & launcher entrypoint for Jinsei Bio Redesign Server
void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // Configure CORS Policy for Web client access
  pod.webServer.addRoute(
    RouteRoot(),
    '*',
  );

  // Start the Serverpod Server
  await pod.start();
}

/// Fallback Protocol definition for Serverpod endpoints
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

/// Endpoints registry for Serverpod Server
class Endpoints extends EndpointDispatch {
  @override
  void initializeEndpoints(Serverpod pod) {
    var endpoints = <String, Endpoint>{
      'health': HealthEndpoint()..initialize(pod, 'health', null),
    };

    connectEndpoints(endpoints);
  }
}
