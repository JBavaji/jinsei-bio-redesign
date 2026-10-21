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
import 'package:jinsei_bio_redesign_client/src/protocol/b2b_modal_content.dart'
    as _i3;
import 'package:jinsei_bio_redesign_client/src/protocol/b2b_sample_request.dart'
    as _i4;
import 'package:jinsei_bio_redesign_client/src/protocol/collaboration_content.dart'
    as _i5;
import 'package:jinsei_bio_redesign_client/src/protocol/home_content.dart'
    as _i6;
import 'package:jinsei_bio_redesign_client/src/protocol/pillar_item.dart'
    as _i7;
import 'package:jinsei_bio_redesign_client/src/protocol/executive_stat.dart'
    as _i8;
import 'package:jinsei_bio_redesign_client/src/protocol/product_vertical.dart'
    as _i9;
import 'package:jinsei_bio_redesign_client/src/protocol/science_content.dart'
    as _i10;
import 'package:jinsei_bio_redesign_client/src/protocol/science_step.dart'
    as _i11;
import 'package:jinsei_bio_redesign_client/src/protocol/science_header_metric.dart'
    as _i12;
import 'package:jinsei_bio_redesign_client/src/protocol/clinical_qa.dart'
    as _i13;
import 'package:jinsei_bio_redesign_client/src/protocol/solutions_content.dart'
    as _i14;
import 'package:jinsei_bio_redesign_client/src/protocol/solution_card.dart'
    as _i15;
import 'package:jinsei_bio_redesign_client/src/protocol/solution_metric.dart'
    as _i16;
import 'package:jinsei_bio_redesign_client/src/protocol/leadership_content.dart'
    as _i17;
import 'package:jinsei_bio_redesign_client/src/protocol/team_member.dart'
    as _i18;
import 'protocol.dart' as _i19;

/// Serverpod Endpoint for B2B Sample Request Flow (JIN-22)
/// {@category Endpoint}
class EndpointB2b extends _i1.EndpointRef {
  EndpointB2b(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'b2b';

  /// Fetches complete dynamic modal content, commercial strains, formulation formats, and compliance metadata.
  _i2.Future<_i3.B2bModalContent> getModalContent() =>
      caller.callServerEndpoint<_i3.B2bModalContent>(
        'b2b',
        'getModalContent',
        {},
      );

  /// Submits a B2B sample request, validates inputs, persists to database, and triggers sandbox notification.
  _i2.Future<String> submitSampleRequest(_i4.B2bSampleRequest request) =>
      caller.callServerEndpoint<String>(
        'b2b',
        'submitSampleRequest',
        {'request': request},
      );
}

/// Serverpod Endpoint for Strategic Collaborations Screen & Inquiry Flow (JIN-68 / JIN-69)
/// {@category Endpoint}
class EndpointCollaborations extends _i1.EndpointRef {
  EndpointCollaborations(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'collaborations';

  /// Fetches complete dynamic collaboration content, partnership tracks, facility info, and compliance standards.
  _i2.Future<_i5.CollaborationContent> getCollaborationsContent() =>
      caller.callServerEndpoint<_i5.CollaborationContent>(
        'collaborations',
        'getCollaborationsContent',
        {},
      );
}

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

  _i2.Future<_i6.HomeContent> getHomeContent() =>
      caller.callServerEndpoint<_i6.HomeContent>(
        'home',
        'getHomeContent',
        {},
      );

  _i2.Future<_i7.PillarItem> createPillar(_i7.PillarItem item) =>
      caller.callServerEndpoint<_i7.PillarItem>(
        'home',
        'createPillar',
        {'item': item},
      );

  _i2.Future<_i7.PillarItem> updatePillar(_i7.PillarItem item) =>
      caller.callServerEndpoint<_i7.PillarItem>(
        'home',
        'updatePillar',
        {'item': item},
      );

  _i2.Future<void> deletePillar(int id) => caller.callServerEndpoint<void>(
        'home',
        'deletePillar',
        {'id': id},
      );

  _i2.Future<_i8.ExecutiveStat> createExecutiveStat(_i8.ExecutiveStat stat) =>
      caller.callServerEndpoint<_i8.ExecutiveStat>(
        'home',
        'createExecutiveStat',
        {'stat': stat},
      );

  _i2.Future<_i8.ExecutiveStat> updateExecutiveStat(_i8.ExecutiveStat stat) =>
      caller.callServerEndpoint<_i8.ExecutiveStat>(
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

  _i2.Future<_i9.ProductVertical> createProductVertical(
          _i9.ProductVertical vertical) =>
      caller.callServerEndpoint<_i9.ProductVertical>(
        'home',
        'createProductVertical',
        {'vertical': vertical},
      );

  _i2.Future<_i9.ProductVertical> updateProductVertical(
          _i9.ProductVertical vertical) =>
      caller.callServerEndpoint<_i9.ProductVertical>(
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

/// Serverpod Endpoint for Science Screen content & 10-step R&D stepper pipeline
/// {@category Endpoint}
class EndpointScience extends _i1.EndpointRef {
  EndpointScience(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'science';

  /// Fetches complete Science Content payload with header metrics, 10 pipeline steps, and clinical QA.
  _i2.Future<_i10.ScienceContent> getScienceContent() =>
      caller.callServerEndpoint<_i10.ScienceContent>(
        'science',
        'getScienceContent',
        {},
      );

  /// Fetches only the 10-step R&D pipeline stepper items.
  _i2.Future<List<_i11.ScienceStep>> getScienceSteps() =>
      caller.callServerEndpoint<List<_i11.ScienceStep>>(
        'science',
        'getScienceSteps',
        {},
      );

  /// Fetches the science header metrics (milestones, coverage, patents).
  _i2.Future<List<_i12.ScienceHeaderMetric>> getHeaderMetrics() =>
      caller.callServerEndpoint<List<_i12.ScienceHeaderMetric>>(
        'science',
        'getHeaderMetrics',
        {},
      );

  /// Fetches the clinical QA standards.
  _i2.Future<_i13.ClinicalQualityAssurance> getClinicalQa() =>
      caller.callServerEndpoint<_i13.ClinicalQualityAssurance>(
        'science',
        'getClinicalQa',
        {},
      );

  _i2.Future<_i11.ScienceStep> createScienceStep(_i11.ScienceStep step) =>
      caller.callServerEndpoint<_i11.ScienceStep>(
        'science',
        'createScienceStep',
        {'step': step},
      );

  _i2.Future<_i11.ScienceStep> updateScienceStep(_i11.ScienceStep step) =>
      caller.callServerEndpoint<_i11.ScienceStep>(
        'science',
        'updateScienceStep',
        {'step': step},
      );

  _i2.Future<void> deleteScienceStep(int id) => caller.callServerEndpoint<void>(
        'science',
        'deleteScienceStep',
        {'id': id},
      );

  _i2.Future<_i12.ScienceHeaderMetric> createHeaderMetric(
          _i12.ScienceHeaderMetric metric) =>
      caller.callServerEndpoint<_i12.ScienceHeaderMetric>(
        'science',
        'createHeaderMetric',
        {'metric': metric},
      );

  _i2.Future<_i12.ScienceHeaderMetric> updateHeaderMetric(
          _i12.ScienceHeaderMetric metric) =>
      caller.callServerEndpoint<_i12.ScienceHeaderMetric>(
        'science',
        'updateHeaderMetric',
        {'metric': metric},
      );

  _i2.Future<void> deleteHeaderMetric(int id) =>
      caller.callServerEndpoint<void>(
        'science',
        'deleteHeaderMetric',
        {'id': id},
      );
}

/// Serverpod Endpoint for Commercial Solutions & Formulation Matrix
/// {@category Endpoint}
class EndpointSolutions extends _i1.EndpointRef {
  EndpointSolutions(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'solutions';

  /// Fetches the complete Solutions Matrix content payload including metrics, cards, and QA standards.
  _i2.Future<_i14.SolutionsContent> getSolutionsContent() =>
      caller.callServerEndpoint<_i14.SolutionsContent>(
        'solutions',
        'getSolutionsContent',
        {},
      );

  /// Fetches all 4 commercial solution cards.
  _i2.Future<List<_i15.SolutionCard>> getSolutions() =>
      caller.callServerEndpoint<List<_i15.SolutionCard>>(
        'solutions',
        'getSolutions',
        {},
      );

  /// Fetches solutions filtered by category (human-health, food-tech, dermo-biotics, agri-tech).
  _i2.Future<List<_i15.SolutionCard>> getSolutionsByCategory(String category) =>
      caller.callServerEndpoint<List<_i15.SolutionCard>>(
        'solutions',
        'getSolutionsByCategory',
        {'category': category},
      );

  /// Fetches top summary KPI metrics.
  _i2.Future<List<_i16.SolutionMetric>> getSolutionMetrics() =>
      caller.callServerEndpoint<List<_i16.SolutionMetric>>(
        'solutions',
        'getSolutionMetrics',
        {},
      );
}

/// Serverpod Endpoint for Leadership & Advisory Team
/// {@category Endpoint}
class EndpointTeam extends _i1.EndpointRef {
  EndpointTeam(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'team';

  /// Fetches the complete Leadership Team content payload including members and governance standards.
  _i2.Future<_i17.LeadershipContent> getLeadershipContent() =>
      caller.callServerEndpoint<_i17.LeadershipContent>(
        'team',
        'getLeadershipContent',
        {},
      );

  /// Fetches all team members ordered by display order.
  _i2.Future<List<_i18.TeamMember>> getTeamMembers() =>
      caller.callServerEndpoint<List<_i18.TeamMember>>(
        'team',
        'getTeamMembers',
        {},
      );

  /// Fetches team members filtered by category (executive, scientific, product, operations).
  _i2.Future<List<_i18.TeamMember>> getTeamMembersByCategory(String category) =>
      caller.callServerEndpoint<List<_i18.TeamMember>>(
        'team',
        'getTeamMembersByCategory',
        {'category': category},
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
          _i19.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    b2b = EndpointB2b(this);
    collaborations = EndpointCollaborations(this);
    health = EndpointHealth(this);
    home = EndpointHome(this);
    science = EndpointScience(this);
    solutions = EndpointSolutions(this);
    team = EndpointTeam(this);
  }

  late final EndpointB2b b2b;

  late final EndpointCollaborations collaborations;

  late final EndpointHealth health;

  late final EndpointHome home;

  late final EndpointScience science;

  late final EndpointSolutions solutions;

  late final EndpointTeam team;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'b2b': b2b,
        'collaborations': collaborations,
        'health': health,
        'home': home,
        'science': science,
        'solutions': solutions,
        'team': team,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
