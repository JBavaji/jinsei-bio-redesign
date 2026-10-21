/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

library protocol;

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'b2b_modal_content.dart' as _i3;
import 'b2b_sample_request.dart' as _i4;
import 'clinical_qa.dart' as _i5;
import 'collaboration_compliance_standard.dart' as _i6;
import 'collaboration_contact_info.dart' as _i7;
import 'collaboration_content.dart' as _i8;
import 'collaboration_track.dart' as _i9;
import 'executive_stat.dart' as _i10;
import 'formulation_format_option.dart' as _i11;
import 'health_status.dart' as _i12;
import 'home_content.dart' as _i13;
import 'leadership_content.dart' as _i14;
import 'pillar_item.dart' as _i15;
import 'product_vertical.dart' as _i16;
import 'science_content.dart' as _i17;
import 'science_header_metric.dart' as _i18;
import 'science_step.dart' as _i19;
import 'solution_card.dart' as _i20;
import 'solution_metric.dart' as _i21;
import 'solutions_content.dart' as _i22;
import 'strain_vertical_option.dart' as _i23;
import 'team_member.dart' as _i24;
import 'protocol.dart' as _i25;
import 'package:jinsei_bio_redesign_server/src/generated/science_step.dart'
    as _i26;
import 'package:jinsei_bio_redesign_server/src/generated/science_header_metric.dart'
    as _i27;
import 'package:jinsei_bio_redesign_server/src/generated/solution_card.dart'
    as _i28;
import 'package:jinsei_bio_redesign_server/src/generated/solution_metric.dart'
    as _i29;
import 'package:jinsei_bio_redesign_server/src/generated/team_member.dart'
    as _i30;
export 'b2b_modal_content.dart';
export 'b2b_sample_request.dart';
export 'clinical_qa.dart';
export 'collaboration_compliance_standard.dart';
export 'collaboration_contact_info.dart';
export 'collaboration_content.dart';
export 'collaboration_track.dart';
export 'executive_stat.dart';
export 'formulation_format_option.dart';
export 'health_status.dart';
export 'home_content.dart';
export 'leadership_content.dart';
export 'pillar_item.dart';
export 'product_vertical.dart';
export 'science_content.dart';
export 'science_header_metric.dart';
export 'science_step.dart';
export 'solution_card.dart';
export 'solution_metric.dart';
export 'solutions_content.dart';
export 'strain_vertical_option.dart';
export 'team_member.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'b2b_sample_request',
      dartName: 'B2bSampleRequest',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'b2b_sample_request_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'strainId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fullName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'company',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'formulationFormat',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'clinicalScope',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'trackingId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'submittedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'b2b_sample_request_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'executive_stat',
      dartName: 'ExecutiveStat',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'executive_stat_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'iconKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'subtitle',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'executive_stat_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'pillar_item',
      dartName: 'PillarItem',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'pillar_item_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'iconKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'pillar_item_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'product_vertical',
      dartName: 'ProductVertical',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'product_vertical_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'strainId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'product_vertical_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'science_header_metric',
      dartName: 'ScienceHeaderMetric',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'science_header_metric_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'iconKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'label',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'accentColorHex',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'science_header_metric_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'science_step',
      dartName: 'ScienceStep',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'science_step_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'stepNumber',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'subtitle',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'iconKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'metricValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'metricLabel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'science_step_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'solution_card',
      dartName: 'SolutionCard',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'solution_card_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'solutionId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'categoryTag',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'subtitle',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'iconKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'formulationCount',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'keyBenefit',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'efficacyMetric',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'bulletPoints',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'actionCtaText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'caseStudyUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'darkImageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lightImageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'solution_card_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'solution_metric',
      dartName: 'SolutionMetric',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'solution_metric_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'iconKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'label',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'accentColorHex',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'solution_metric_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'team_member',
      dartName: 'TeamMember',
      schema: 'public',
      module: 'jinsei_bio_redesign',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'team_member_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'memberId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'categoryTag',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'academicCredential',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'areaOfExpertise',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'displayOrder',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'team_member_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.B2bModalContent) {
      return _i3.B2bModalContent.fromJson(data, this) as T;
    }
    if (t == _i4.B2bSampleRequest) {
      return _i4.B2bSampleRequest.fromJson(data, this) as T;
    }
    if (t == _i5.ClinicalQualityAssurance) {
      return _i5.ClinicalQualityAssurance.fromJson(data, this) as T;
    }
    if (t == _i6.CollaborationComplianceStandard) {
      return _i6.CollaborationComplianceStandard.fromJson(data, this) as T;
    }
    if (t == _i7.CollaborationContactInfo) {
      return _i7.CollaborationContactInfo.fromJson(data, this) as T;
    }
    if (t == _i8.CollaborationContent) {
      return _i8.CollaborationContent.fromJson(data, this) as T;
    }
    if (t == _i9.CollaborationTrack) {
      return _i9.CollaborationTrack.fromJson(data, this) as T;
    }
    if (t == _i10.ExecutiveStat) {
      return _i10.ExecutiveStat.fromJson(data, this) as T;
    }
    if (t == _i11.FormulationFormatOption) {
      return _i11.FormulationFormatOption.fromJson(data, this) as T;
    }
    if (t == _i12.HealthStatusResponse) {
      return _i12.HealthStatusResponse.fromJson(data, this) as T;
    }
    if (t == _i13.HomeContent) {
      return _i13.HomeContent.fromJson(data, this) as T;
    }
    if (t == _i14.LeadershipContent) {
      return _i14.LeadershipContent.fromJson(data, this) as T;
    }
    if (t == _i15.PillarItem) {
      return _i15.PillarItem.fromJson(data, this) as T;
    }
    if (t == _i16.ProductVertical) {
      return _i16.ProductVertical.fromJson(data, this) as T;
    }
    if (t == _i17.ScienceContent) {
      return _i17.ScienceContent.fromJson(data, this) as T;
    }
    if (t == _i18.ScienceHeaderMetric) {
      return _i18.ScienceHeaderMetric.fromJson(data, this) as T;
    }
    if (t == _i19.ScienceStep) {
      return _i19.ScienceStep.fromJson(data, this) as T;
    }
    if (t == _i20.SolutionCard) {
      return _i20.SolutionCard.fromJson(data, this) as T;
    }
    if (t == _i21.SolutionMetric) {
      return _i21.SolutionMetric.fromJson(data, this) as T;
    }
    if (t == _i22.SolutionsContent) {
      return _i22.SolutionsContent.fromJson(data, this) as T;
    }
    if (t == _i23.StrainVerticalOption) {
      return _i23.StrainVerticalOption.fromJson(data, this) as T;
    }
    if (t == _i24.TeamMember) {
      return _i24.TeamMember.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.B2bModalContent?>()) {
      return (data != null ? _i3.B2bModalContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.B2bSampleRequest?>()) {
      return (data != null ? _i4.B2bSampleRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.ClinicalQualityAssurance?>()) {
      return (data != null
          ? _i5.ClinicalQualityAssurance.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i6.CollaborationComplianceStandard?>()) {
      return (data != null
          ? _i6.CollaborationComplianceStandard.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i7.CollaborationContactInfo?>()) {
      return (data != null
          ? _i7.CollaborationContactInfo.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i8.CollaborationContent?>()) {
      return (data != null
          ? _i8.CollaborationContent.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i9.CollaborationTrack?>()) {
      return (data != null ? _i9.CollaborationTrack.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i10.ExecutiveStat?>()) {
      return (data != null ? _i10.ExecutiveStat.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.FormulationFormatOption?>()) {
      return (data != null
          ? _i11.FormulationFormatOption.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i12.HealthStatusResponse?>()) {
      return (data != null
          ? _i12.HealthStatusResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i13.HomeContent?>()) {
      return (data != null ? _i13.HomeContent.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i14.LeadershipContent?>()) {
      return (data != null ? _i14.LeadershipContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i15.PillarItem?>()) {
      return (data != null ? _i15.PillarItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i16.ProductVertical?>()) {
      return (data != null ? _i16.ProductVertical.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i17.ScienceContent?>()) {
      return (data != null ? _i17.ScienceContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i18.ScienceHeaderMetric?>()) {
      return (data != null
          ? _i18.ScienceHeaderMetric.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i19.ScienceStep?>()) {
      return (data != null ? _i19.ScienceStep.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i20.SolutionCard?>()) {
      return (data != null ? _i20.SolutionCard.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i21.SolutionMetric?>()) {
      return (data != null ? _i21.SolutionMetric.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i22.SolutionsContent?>()) {
      return (data != null ? _i22.SolutionsContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i23.StrainVerticalOption?>()) {
      return (data != null
          ? _i23.StrainVerticalOption.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i24.TeamMember?>()) {
      return (data != null ? _i24.TeamMember.fromJson(data, this) : null) as T;
    }
    if (t == List<_i25.StrainVerticalOption>) {
      return (data as List)
          .map((e) => deserialize<_i25.StrainVerticalOption>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.FormulationFormatOption>) {
      return (data as List)
          .map((e) => deserialize<_i25.FormulationFormatOption>(e))
          .toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i25.CollaborationComplianceStandard>) {
      return (data as List)
          .map((e) => deserialize<_i25.CollaborationComplianceStandard>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.CollaborationTrack>) {
      return (data as List)
          .map((e) => deserialize<_i25.CollaborationTrack>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.PillarItem>) {
      return (data as List).map((e) => deserialize<_i25.PillarItem>(e)).toList()
          as dynamic;
    }
    if (t == List<_i25.ExecutiveStat>) {
      return (data as List)
          .map((e) => deserialize<_i25.ExecutiveStat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.ProductVertical>) {
      return (data as List)
          .map((e) => deserialize<_i25.ProductVertical>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.TeamMember>) {
      return (data as List).map((e) => deserialize<_i25.TeamMember>(e)).toList()
          as dynamic;
    }
    if (t == List<_i25.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i25.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i25.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.SolutionMetric>) {
      return (data as List)
          .map((e) => deserialize<_i25.SolutionMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i25.SolutionCard>) {
      return (data as List)
          .map((e) => deserialize<_i25.SolutionCard>(e))
          .toList() as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i26.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i26.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == List<_i27.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i27.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i28.SolutionCard>) {
      return (data as List)
          .map((e) => deserialize<_i28.SolutionCard>(e))
          .toList() as dynamic;
    }
    if (t == List<_i29.SolutionMetric>) {
      return (data as List)
          .map((e) => deserialize<_i29.SolutionMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i30.TeamMember>) {
      return (data as List).map((e) => deserialize<_i30.TeamMember>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.B2bModalContent) {
      return 'B2bModalContent';
    }
    if (data is _i4.B2bSampleRequest) {
      return 'B2bSampleRequest';
    }
    if (data is _i5.ClinicalQualityAssurance) {
      return 'ClinicalQualityAssurance';
    }
    if (data is _i6.CollaborationComplianceStandard) {
      return 'CollaborationComplianceStandard';
    }
    if (data is _i7.CollaborationContactInfo) {
      return 'CollaborationContactInfo';
    }
    if (data is _i8.CollaborationContent) {
      return 'CollaborationContent';
    }
    if (data is _i9.CollaborationTrack) {
      return 'CollaborationTrack';
    }
    if (data is _i10.ExecutiveStat) {
      return 'ExecutiveStat';
    }
    if (data is _i11.FormulationFormatOption) {
      return 'FormulationFormatOption';
    }
    if (data is _i12.HealthStatusResponse) {
      return 'HealthStatusResponse';
    }
    if (data is _i13.HomeContent) {
      return 'HomeContent';
    }
    if (data is _i14.LeadershipContent) {
      return 'LeadershipContent';
    }
    if (data is _i15.PillarItem) {
      return 'PillarItem';
    }
    if (data is _i16.ProductVertical) {
      return 'ProductVertical';
    }
    if (data is _i17.ScienceContent) {
      return 'ScienceContent';
    }
    if (data is _i18.ScienceHeaderMetric) {
      return 'ScienceHeaderMetric';
    }
    if (data is _i19.ScienceStep) {
      return 'ScienceStep';
    }
    if (data is _i20.SolutionCard) {
      return 'SolutionCard';
    }
    if (data is _i21.SolutionMetric) {
      return 'SolutionMetric';
    }
    if (data is _i22.SolutionsContent) {
      return 'SolutionsContent';
    }
    if (data is _i23.StrainVerticalOption) {
      return 'StrainVerticalOption';
    }
    if (data is _i24.TeamMember) {
      return 'TeamMember';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'B2bModalContent') {
      return deserialize<_i3.B2bModalContent>(data['data']);
    }
    if (data['className'] == 'B2bSampleRequest') {
      return deserialize<_i4.B2bSampleRequest>(data['data']);
    }
    if (data['className'] == 'ClinicalQualityAssurance') {
      return deserialize<_i5.ClinicalQualityAssurance>(data['data']);
    }
    if (data['className'] == 'CollaborationComplianceStandard') {
      return deserialize<_i6.CollaborationComplianceStandard>(data['data']);
    }
    if (data['className'] == 'CollaborationContactInfo') {
      return deserialize<_i7.CollaborationContactInfo>(data['data']);
    }
    if (data['className'] == 'CollaborationContent') {
      return deserialize<_i8.CollaborationContent>(data['data']);
    }
    if (data['className'] == 'CollaborationTrack') {
      return deserialize<_i9.CollaborationTrack>(data['data']);
    }
    if (data['className'] == 'ExecutiveStat') {
      return deserialize<_i10.ExecutiveStat>(data['data']);
    }
    if (data['className'] == 'FormulationFormatOption') {
      return deserialize<_i11.FormulationFormatOption>(data['data']);
    }
    if (data['className'] == 'HealthStatusResponse') {
      return deserialize<_i12.HealthStatusResponse>(data['data']);
    }
    if (data['className'] == 'HomeContent') {
      return deserialize<_i13.HomeContent>(data['data']);
    }
    if (data['className'] == 'LeadershipContent') {
      return deserialize<_i14.LeadershipContent>(data['data']);
    }
    if (data['className'] == 'PillarItem') {
      return deserialize<_i15.PillarItem>(data['data']);
    }
    if (data['className'] == 'ProductVertical') {
      return deserialize<_i16.ProductVertical>(data['data']);
    }
    if (data['className'] == 'ScienceContent') {
      return deserialize<_i17.ScienceContent>(data['data']);
    }
    if (data['className'] == 'ScienceHeaderMetric') {
      return deserialize<_i18.ScienceHeaderMetric>(data['data']);
    }
    if (data['className'] == 'ScienceStep') {
      return deserialize<_i19.ScienceStep>(data['data']);
    }
    if (data['className'] == 'SolutionCard') {
      return deserialize<_i20.SolutionCard>(data['data']);
    }
    if (data['className'] == 'SolutionMetric') {
      return deserialize<_i21.SolutionMetric>(data['data']);
    }
    if (data['className'] == 'SolutionsContent') {
      return deserialize<_i22.SolutionsContent>(data['data']);
    }
    if (data['className'] == 'StrainVerticalOption') {
      return deserialize<_i23.StrainVerticalOption>(data['data']);
    }
    if (data['className'] == 'TeamMember') {
      return deserialize<_i24.TeamMember>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.B2bSampleRequest:
        return _i4.B2bSampleRequest.t;
      case _i10.ExecutiveStat:
        return _i10.ExecutiveStat.t;
      case _i15.PillarItem:
        return _i15.PillarItem.t;
      case _i16.ProductVertical:
        return _i16.ProductVertical.t;
      case _i18.ScienceHeaderMetric:
        return _i18.ScienceHeaderMetric.t;
      case _i19.ScienceStep:
        return _i19.ScienceStep.t;
      case _i20.SolutionCard:
        return _i20.SolutionCard.t;
      case _i21.SolutionMetric:
        return _i21.SolutionMetric.t;
      case _i24.TeamMember:
        return _i24.TeamMember.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'jinsei_bio_redesign';
}
