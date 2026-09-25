/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:jinsei_bio_redesign_client/src/protocol/home_content.dart'
    as _i3;
import 'package:jinsei_bio_redesign_client/src/protocol/pillar_item.dart'
    as _i4;
import 'package:jinsei_bio_redesign_client/src/protocol/executive_stat.dart'
    as _i5;
import 'package:jinsei_bio_redesign_client/src/protocol/product_vertical.dart'
    as _i6;
import 'protocol.dart' as _i7;

/// Serverpod endpoint for health check & system status
/// {@category Endpoint}
class EndpointHealth extends _i1.EndpointRef {
  EndpointHealth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'health';

  _i2.Future<String> ping() => caller.callServerEndpoint<String>(
        'health',
        'ping',
        {},
      );

  _i2.Future<Map<String, String>> status() =>
      caller.callServerEndpoint<Map<String, String>>(
        'health',
        'status',
        {},
      );
}

/// Serverpod Endpoint for Home Screen content & PostgreSQL database pipeline
/// {@category Endpoint}
class EndpointHome extends _i1.EndpointRef {
  EndpointHome(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'home';

  _i2.Future<_i3.HomeContent> getHomeContent() =>
      caller.callServerEndpoint<_i3.HomeContent>(
        'home',
        'getHomeContent',
        {},
      );

  _i2.Future<_i4.PillarItem> createPillar(_i4.PillarItem item) =>
      caller.callServerEndpoint<_i4.PillarItem>(
        'home',
        'createPillar',
        {'item': item},
      );

  _i2.Future<_i4.PillarItem> updatePillar(_i4.PillarItem item) =>
      caller.callServerEndpoint<_i4.PillarItem>(
        'home',
        'updatePillar',
        {'item': item},
      );

  _i2.Future<void> deletePillar(int id) => caller.callServerEndpoint<void>(
        'home',
        'deletePillar',
        {'id': id},
      );

  _i2.Future<_i5.ExecutiveStat> createExecutiveStat(_i5.ExecutiveStat stat) =>
      caller.callServerEndpoint<_i5.ExecutiveStat>(
        'home',
        'createExecutiveStat',
        {'stat': stat},
      );

  _i2.Future<_i5.ExecutiveStat> updateExecutiveStat(_i5.ExecutiveStat stat) =>
      caller.callServerEndpoint<_i5.ExecutiveStat>(
        'home',
        'updateExecutiveStat',
        {'stat': stat},
      );

  _i2.Future<void> deleteExecutiveStat(int id) =>
      caller.callServerEndpoint<void>(
        'home',
        'deleteExecutiveStat',
        {'id': id},
      );

  _i2.Future<_i6.ProductVertical> createProductVertical(
          _i6.ProductVertical vertical) =>
      caller.callServerEndpoint<_i6.ProductVertical>(
        'home',
        'createProductVertical',
        {'vertical': vertical},
      );

  _i2.Future<_i6.ProductVertical> updateProductVertical(
          _i6.ProductVertical vertical) =>
      caller.callServerEndpoint<_i6.ProductVertical>(
        'home',
        'updateProductVertical',
        {'vertical': vertical},
      );

  _i2.Future<void> deleteProductVertical(int id) =>
      caller.callServerEndpoint<void>(
        'home',
        'deleteProductVertical',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    health = EndpointHealth(this);
    home = EndpointHome(this);
  }

  late final EndpointHealth health;

  late final EndpointHome home;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'health': health,
        'home': home,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
