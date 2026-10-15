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
import '../endpoints/science_endpoint.dart' as _i4;
import '../endpoints/solutions_endpoint.dart' as _i5;
import '../endpoints/team_endpoint.dart' as _i6;
import 'package:jinsei_bio_redesign_server/src/generated/pillar_item.dart'
    as _i7;
import 'package:jinsei_bio_redesign_server/src/generated/executive_stat.dart'
    as _i8;
import 'package:jinsei_bio_redesign_server/src/generated/product_vertical.dart'
    as _i9;
import 'package:jinsei_bio_redesign_server/src/generated/science_step.dart'
    as _i10;
import 'package:jinsei_bio_redesign_server/src/generated/science_header_metric.dart'
    as _i11;

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
      'science': _i4.ScienceEndpoint()
        ..initialize(
          server,
          'science',
          null,
        ),
      'solutions': _i5.SolutionsEndpoint()
        ..initialize(
          server,
          'solutions',
          null,
        ),
      'team': _i6.TeamEndpoint()
        ..initialize(
          server,
          'team',
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
              type: _i1.getType<_i7.PillarItem>(),
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
              type: _i1.getType<_i7.PillarItem>(),
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
              type: _i1.getType<_i8.ExecutiveStat>(),
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
              type: _i1.getType<_i8.ExecutiveStat>(),
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
              type: _i1.getType<_i9.ProductVertical>(),
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
              type: _i1.getType<_i9.ProductVertical>(),
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
    connectors['science'] = _i1.EndpointConnector(
      name: 'science',
      endpoint: endpoints['science']!,
      methodConnectors: {
        'getScienceContent': _i1.MethodConnector(
          name: 'getScienceContent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint)
                  .getScienceContent(session),
        ),
        'getScienceSteps': _i1.MethodConnector(
          name: 'getScienceSteps',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint)
                  .getScienceSteps(session),
        ),
        'getHeaderMetrics': _i1.MethodConnector(
          name: 'getHeaderMetrics',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint)
                  .getHeaderMetrics(session),
        ),
        'getClinicalQa': _i1.MethodConnector(
          name: 'getClinicalQa',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint)
                  .getClinicalQa(session),
        ),
        'createScienceStep': _i1.MethodConnector(
          name: 'createScienceStep',
          params: {
            'step': _i1.ParameterDescription(
              name: 'step',
              type: _i1.getType<_i10.ScienceStep>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint).createScienceStep(
            session,
            params['step'],
          ),
        ),
        'updateScienceStep': _i1.MethodConnector(
          name: 'updateScienceStep',
          params: {
            'step': _i1.ParameterDescription(
              name: 'step',
              type: _i1.getType<_i10.ScienceStep>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint).updateScienceStep(
            session,
            params['step'],
          ),
        ),
        'deleteScienceStep': _i1.MethodConnector(
          name: 'deleteScienceStep',
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
              (endpoints['science'] as _i4.ScienceEndpoint).deleteScienceStep(
            session,
            params['id'],
          ),
        ),
        'createHeaderMetric': _i1.MethodConnector(
          name: 'createHeaderMetric',
          params: {
            'metric': _i1.ParameterDescription(
              name: 'metric',
              type: _i1.getType<_i11.ScienceHeaderMetric>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint).createHeaderMetric(
            session,
            params['metric'],
          ),
        ),
        'updateHeaderMetric': _i1.MethodConnector(
          name: 'updateHeaderMetric',
          params: {
            'metric': _i1.ParameterDescription(
              name: 'metric',
              type: _i1.getType<_i11.ScienceHeaderMetric>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i4.ScienceEndpoint).updateHeaderMetric(
            session,
            params['metric'],
          ),
        ),
        'deleteHeaderMetric': _i1.MethodConnector(
          name: 'deleteHeaderMetric',
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
              (endpoints['science'] as _i4.ScienceEndpoint).deleteHeaderMetric(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['solutions'] = _i1.EndpointConnector(
      name: 'solutions',
      endpoint: endpoints['solutions']!,
      methodConnectors: {
        'getSolutionsContent': _i1.MethodConnector(
          name: 'getSolutionsContent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['solutions'] as _i5.SolutionsEndpoint)
                  .getSolutionsContent(session),
        ),
        'getSolutions': _i1.MethodConnector(
          name: 'getSolutions',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['solutions'] as _i5.SolutionsEndpoint)
                  .getSolutions(session),
        ),
        'getSolutionsByCategory': _i1.MethodConnector(
          name: 'getSolutionsByCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['solutions'] as _i5.SolutionsEndpoint)
                  .getSolutionsByCategory(
            session,
            params['category'],
          ),
        ),
        'getSolutionMetrics': _i1.MethodConnector(
          name: 'getSolutionMetrics',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['solutions'] as _i5.SolutionsEndpoint)
                  .getSolutionMetrics(session),
        ),
      },
    );
    connectors['team'] = _i1.EndpointConnector(
      name: 'team',
      endpoint: endpoints['team']!,
      methodConnectors: {
        'getLeadershipContent': _i1.MethodConnector(
          name: 'getLeadershipContent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['team'] as _i6.TeamEndpoint)
                  .getLeadershipContent(session),
        ),
        'getTeamMembers': _i1.MethodConnector(
          name: 'getTeamMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['team'] as _i6.TeamEndpoint).getTeamMembers(session),
        ),
        'getTeamMembersByCategory': _i1.MethodConnector(
          name: 'getTeamMembersByCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['team'] as _i6.TeamEndpoint).getTeamMembersByCategory(
            session,
            params['category'],
          ),
        ),
      },
    );
  }
}
