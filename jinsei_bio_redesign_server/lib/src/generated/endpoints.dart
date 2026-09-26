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
import 'package:jinsei_bio_redesign_server/src/generated/pillar_item.dart'
    as _i4;
import 'package:jinsei_bio_redesign_server/src/generated/executive_stat.dart'
    as _i5;
import 'package:jinsei_bio_redesign_server/src/generated/product_vertical.dart'
    as _i6;

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
        ),
        'createPillar': _i1.MethodConnector(
          name: 'createPillar',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i4.PillarItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).createPillar(
            session,
            params['item'],
          ),
        ),
        'updatePillar': _i1.MethodConnector(
          name: 'updatePillar',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i4.PillarItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).updatePillar(
            session,
            params['item'],
          ),
        ),
        'deletePillar': _i1.MethodConnector(
          name: 'deletePillar',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).deletePillar(
            session,
            params['id'],
          ),
        ),
        'createExecutiveStat': _i1.MethodConnector(
          name: 'createExecutiveStat',
          params: {
            'stat': _i1.ParameterDescription(
              name: 'stat',
              type: _i1.getType<_i5.ExecutiveStat>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).createExecutiveStat(
            session,
            params['stat'],
          ),
        ),
        'updateExecutiveStat': _i1.MethodConnector(
          name: 'updateExecutiveStat',
          params: {
            'stat': _i1.ParameterDescription(
              name: 'stat',
              type: _i1.getType<_i5.ExecutiveStat>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).updateExecutiveStat(
            session,
            params['stat'],
          ),
        ),
        'deleteExecutiveStat': _i1.MethodConnector(
          name: 'deleteExecutiveStat',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).deleteExecutiveStat(
            session,
            params['id'],
          ),
        ),
        'createProductVertical': _i1.MethodConnector(
          name: 'createProductVertical',
          params: {
            'vertical': _i1.ParameterDescription(
              name: 'vertical',
              type: _i1.getType<_i6.ProductVertical>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).createProductVertical(
            session,
            params['vertical'],
          ),
        ),
        'updateProductVertical': _i1.MethodConnector(
          name: 'updateProductVertical',
          params: {
            'vertical': _i1.ParameterDescription(
              name: 'vertical',
              type: _i1.getType<_i6.ProductVertical>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).updateProductVertical(
            session,
            params['vertical'],
          ),
        ),
        'deleteProductVertical': _i1.MethodConnector(
          name: 'deleteProductVertical',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i3.HomeEndpoint).deleteProductVertical(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
