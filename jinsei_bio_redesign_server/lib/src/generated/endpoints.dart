/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/b2b_endpoint.dart' as _i2;
import '../endpoints/health_endpoint.dart' as _i3;
import '../endpoints/home_endpoint.dart' as _i4;
import '../endpoints/science_endpoint.dart' as _i5;
import '../endpoints/solutions_endpoint.dart' as _i6;
import '../endpoints/team_endpoint.dart' as _i7;
import 'package:jinsei_bio_redesign_server/src/generated/pillar_item.dart'
    as _i8;
import 'package:jinsei_bio_redesign_server/src/generated/executive_stat.dart'
    as _i9;
import 'package:jinsei_bio_redesign_server/src/generated/product_vertical.dart'
    as _i10;
import 'package:jinsei_bio_redesign_server/src/generated/science_step.dart'
    as _i11;
import 'package:jinsei_bio_redesign_server/src/generated/science_header_metric.dart'
    as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'b2b': _i2.B2bEndpoint()
        ..initialize(
          server,
          'b2b',
          null,
        ),
      'health': _i3.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
      'home': _i4.HomeEndpoint()
        ..initialize(
          server,
          'home',
          null,
        ),
      'science': _i5.ScienceEndpoint()
        ..initialize(
          server,
          'science',
          null,
        ),
      'solutions': _i6.SolutionsEndpoint()
        ..initialize(
          server,
          'solutions',
          null,
        ),
      'team': _i7.TeamEndpoint()
        ..initialize(
          server,
          'team',
          null,
        ),
    };
    connectors['b2b'] = _i1.EndpointConnector(
      name: 'b2b',
      endpoint: endpoints['b2b']!,
      methodConnectors: {
        'getModalContent': _i1.MethodConnector(
          name: 'getModalContent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['b2b'] as _i2.B2bEndpoint).getModalContent(session),
        )
      },
    );
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
              (endpoints['health'] as _i3.HealthEndpoint).ping(session),
        ),
        'status': _i1.MethodConnector(
          name: 'status',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['health'] as _i3.HealthEndpoint).status(session),
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
              (endpoints['home'] as _i4.HomeEndpoint).getHomeContent(session),
        ),
        'createPillar': _i1.MethodConnector(
          name: 'createPillar',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i8.PillarItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i4.HomeEndpoint).createPillar(
            session,
            params['item'],
          ),
        ),
        'updatePillar': _i1.MethodConnector(
          name: 'updatePillar',
          params: {
            'item': _i1.ParameterDescription(
              name: 'item',
              type: _i1.getType<_i8.PillarItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i4.HomeEndpoint).updatePillar(
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
              (endpoints['home'] as _i4.HomeEndpoint).deletePillar(
            session,
            params['id'],
          ),
        ),
        'createExecutiveStat': _i1.MethodConnector(
          name: 'createExecutiveStat',
          params: {
            'stat': _i1.ParameterDescription(
              name: 'stat',
              type: _i1.getType<_i9.ExecutiveStat>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i4.HomeEndpoint).createExecutiveStat(
            session,
            params['stat'],
          ),
        ),
        'updateExecutiveStat': _i1.MethodConnector(
          name: 'updateExecutiveStat',
          params: {
            'stat': _i1.ParameterDescription(
              name: 'stat',
              type: _i1.getType<_i9.ExecutiveStat>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i4.HomeEndpoint).updateExecutiveStat(
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
              (endpoints['home'] as _i4.HomeEndpoint).deleteExecutiveStat(
            session,
            params['id'],
          ),
        ),
        'createProductVertical': _i1.MethodConnector(
          name: 'createProductVertical',
          params: {
            'vertical': _i1.ParameterDescription(
              name: 'vertical',
              type: _i1.getType<_i10.ProductVertical>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i4.HomeEndpoint).createProductVertical(
            session,
            params['vertical'],
          ),
        ),
        'updateProductVertical': _i1.MethodConnector(
          name: 'updateProductVertical',
          params: {
            'vertical': _i1.ParameterDescription(
              name: 'vertical',
              type: _i1.getType<_i10.ProductVertical>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['home'] as _i4.HomeEndpoint).updateProductVertical(
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
              (endpoints['home'] as _i4.HomeEndpoint).deleteProductVertical(
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
              (endpoints['science'] as _i5.ScienceEndpoint)
                  .getScienceContent(session),
        ),
        'getScienceSteps': _i1.MethodConnector(
          name: 'getScienceSteps',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i5.ScienceEndpoint)
                  .getScienceSteps(session),
        ),
        'getHeaderMetrics': _i1.MethodConnector(
          name: 'getHeaderMetrics',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i5.ScienceEndpoint)
                  .getHeaderMetrics(session),
        ),
        'getClinicalQa': _i1.MethodConnector(
          name: 'getClinicalQa',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i5.ScienceEndpoint)
                  .getClinicalQa(session),
        ),
        'createScienceStep': _i1.MethodConnector(
          name: 'createScienceStep',
          params: {
            'step': _i1.ParameterDescription(
              name: 'step',
              type: _i1.getType<_i11.ScienceStep>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i5.ScienceEndpoint).createScienceStep(
            session,
            params['step'],
          ),
        ),
        'updateScienceStep': _i1.MethodConnector(
          name: 'updateScienceStep',
          params: {
            'step': _i1.ParameterDescription(
              name: 'step',
              type: _i1.getType<_i11.ScienceStep>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i5.ScienceEndpoint).updateScienceStep(
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
              (endpoints['science'] as _i5.ScienceEndpoint).deleteScienceStep(
            session,
            params['id'],
          ),
        ),
        'createHeaderMetric': _i1.MethodConnector(
          name: 'createHeaderMetric',
          params: {
            'metric': _i1.ParameterDescription(
              name: 'metric',
              type: _i1.getType<_i12.ScienceHeaderMetric>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i5.ScienceEndpoint).createHeaderMetric(
            session,
            params['metric'],
          ),
        ),
        'updateHeaderMetric': _i1.MethodConnector(
          name: 'updateHeaderMetric',
          params: {
            'metric': _i1.ParameterDescription(
              name: 'metric',
              type: _i1.getType<_i12.ScienceHeaderMetric>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['science'] as _i5.ScienceEndpoint).updateHeaderMetric(
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
              (endpoints['science'] as _i5.ScienceEndpoint).deleteHeaderMetric(
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
              (endpoints['solutions'] as _i6.SolutionsEndpoint)
                  .getSolutionsContent(session),
        ),
        'getSolutions': _i1.MethodConnector(
          name: 'getSolutions',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['solutions'] as _i6.SolutionsEndpoint)
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
              (endpoints['solutions'] as _i6.SolutionsEndpoint)
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
              (endpoints['solutions'] as _i6.SolutionsEndpoint)
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
              (endpoints['team'] as _i7.TeamEndpoint)
                  .getLeadershipContent(session),
        ),
        'getTeamMembers': _i1.MethodConnector(
          name: 'getTeamMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['team'] as _i7.TeamEndpoint).getTeamMembers(session),
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
              (endpoints['team'] as _i7.TeamEndpoint).getTeamMembersByCategory(
            session,
            params['category'],
          ),
        ),
      },
    );
  }
}
