/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/health_endpoint.dart' as _i2;
import '../endpoints/home_endpoint.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'health': _i2.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
      'home': _i3.HomeEndpoint()
        ..initialize(
          server,
          'home',
          null,
        ),
    };
    connectors['health'] = _i1.EndpointConnector(
      name: 'health',
      endpoint: endpoints['health']!,
      methodConnectors: {
        'ping': _i1.MethodConnector(
          name: 'ping',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['health'] as _i2.HealthEndpoint).ping(session),
        ),
        'status': _i1.MethodConnector(
          name: 'status',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['health'] as _i2.HealthEndpoint).status(session),
        ),
      },
    );
    connectors['home'] = _i1.EndpointConnector(
      name: 'home',
      endpoint: endpoints['home']!,
      methodConnectors: {
        'getHomeContent': _i1.MethodConnector(
          name: 'getHomeContent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).getHomeContent(session),
        )
      },
    );
  }
}
