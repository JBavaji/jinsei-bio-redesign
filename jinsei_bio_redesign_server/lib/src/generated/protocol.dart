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
import 'clinical_qa.dart' as _i3;
import 'executive_stat.dart' as _i4;
import 'health_status.dart' as _i5;
import 'home_content.dart' as _i6;
import 'leadership_content.dart' as _i7;
import 'pillar_item.dart' as _i8;
import 'product_vertical.dart' as _i9;
import 'science_content.dart' as _i10;
import 'science_header_metric.dart' as _i11;
import 'science_step.dart' as _i12;
import 'solution_card.dart' as _i13;
import 'solution_metric.dart' as _i14;
import 'solutions_content.dart' as _i15;
import 'team_member.dart' as _i16;
import 'protocol.dart' as _i17;
import 'package:jinsei_bio_redesign_server/src/generated/science_step.dart'
    as _i18;
import 'package:jinsei_bio_redesign_server/src/generated/science_header_metric.dart'
    as _i19;
import 'package:jinsei_bio_redesign_server/src/generated/solution_card.dart'
    as _i20;
import 'package:jinsei_bio_redesign_server/src/generated/solution_metric.dart'
    as _i21;
import 'package:jinsei_bio_redesign_server/src/generated/team_member.dart'
    as _i22;
export 'clinical_qa.dart';
export 'executive_stat.dart';
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
export 'team_member.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
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
    if (t == _i3.ClinicalQualityAssurance) {
      return _i3.ClinicalQualityAssurance.fromJson(data, this) as T;
    }
    if (t == _i4.ExecutiveStat) {
      return _i4.ExecutiveStat.fromJson(data, this) as T;
    }
    if (t == _i5.HealthStatusResponse) {
      return _i5.HealthStatusResponse.fromJson(data, this) as T;
    }
    if (t == _i6.HomeContent) {
      return _i6.HomeContent.fromJson(data, this) as T;
    }
    if (t == _i7.LeadershipContent) {
      return _i7.LeadershipContent.fromJson(data, this) as T;
    }
    if (t == _i8.PillarItem) {
      return _i8.PillarItem.fromJson(data, this) as T;
    }
    if (t == _i9.ProductVertical) {
      return _i9.ProductVertical.fromJson(data, this) as T;
    }
    if (t == _i10.ScienceContent) {
      return _i10.ScienceContent.fromJson(data, this) as T;
    }
    if (t == _i11.ScienceHeaderMetric) {
      return _i11.ScienceHeaderMetric.fromJson(data, this) as T;
    }
    if (t == _i12.ScienceStep) {
      return _i12.ScienceStep.fromJson(data, this) as T;
    }
    if (t == _i13.SolutionCard) {
      return _i13.SolutionCard.fromJson(data, this) as T;
    }
    if (t == _i14.SolutionMetric) {
      return _i14.SolutionMetric.fromJson(data, this) as T;
    }
    if (t == _i15.SolutionsContent) {
      return _i15.SolutionsContent.fromJson(data, this) as T;
    }
    if (t == _i16.TeamMember) {
      return _i16.TeamMember.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.ClinicalQualityAssurance?>()) {
      return (data != null
          ? _i3.ClinicalQualityAssurance.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i4.ExecutiveStat?>()) {
      return (data != null ? _i4.ExecutiveStat.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.HealthStatusResponse?>()) {
      return (data != null
          ? _i5.HealthStatusResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i6.HomeContent?>()) {
      return (data != null ? _i6.HomeContent.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.LeadershipContent?>()) {
      return (data != null ? _i7.LeadershipContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.PillarItem?>()) {
      return (data != null ? _i8.PillarItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.ProductVertical?>()) {
      return (data != null ? _i9.ProductVertical.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i10.ScienceContent?>()) {
      return (data != null ? _i10.ScienceContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.ScienceHeaderMetric?>()) {
      return (data != null
          ? _i11.ScienceHeaderMetric.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i12.ScienceStep?>()) {
      return (data != null ? _i12.ScienceStep.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i13.SolutionCard?>()) {
      return (data != null ? _i13.SolutionCard.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i14.SolutionMetric?>()) {
      return (data != null ? _i14.SolutionMetric.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i15.SolutionsContent?>()) {
      return (data != null ? _i15.SolutionsContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i16.TeamMember?>()) {
      return (data != null ? _i16.TeamMember.fromJson(data, this) : null) as T;
    }
    if (t == List<_i17.PillarItem>) {
      return (data as List).map((e) => deserialize<_i17.PillarItem>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.ExecutiveStat>) {
      return (data as List)
          .map((e) => deserialize<_i17.ExecutiveStat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i17.ProductVertical>) {
      return (data as List)
          .map((e) => deserialize<_i17.ProductVertical>(e))
          .toList() as dynamic;
    }
    if (t == List<_i17.TeamMember>) {
      return (data as List).map((e) => deserialize<_i17.TeamMember>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i17.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i17.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i17.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.SolutionMetric>) {
      return (data as List)
          .map((e) => deserialize<_i17.SolutionMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i17.SolutionCard>) {
      return (data as List)
          .map((e) => deserialize<_i17.SolutionCard>(e))
          .toList() as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i18.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i18.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i19.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i20.SolutionCard>) {
      return (data as List)
          .map((e) => deserialize<_i20.SolutionCard>(e))
          .toList() as dynamic;
    }
    if (t == List<_i21.SolutionMetric>) {
      return (data as List)
          .map((e) => deserialize<_i21.SolutionMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i22.TeamMember>) {
      return (data as List).map((e) => deserialize<_i22.TeamMember>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.ClinicalQualityAssurance) {
      return 'ClinicalQualityAssurance';
    }
    if (data is _i4.ExecutiveStat) {
      return 'ExecutiveStat';
    }
    if (data is _i5.HealthStatusResponse) {
      return 'HealthStatusResponse';
    }
    if (data is _i6.HomeContent) {
      return 'HomeContent';
    }
    if (data is _i7.LeadershipContent) {
      return 'LeadershipContent';
    }
    if (data is _i8.PillarItem) {
      return 'PillarItem';
    }
    if (data is _i9.ProductVertical) {
      return 'ProductVertical';
    }
    if (data is _i10.ScienceContent) {
      return 'ScienceContent';
    }
    if (data is _i11.ScienceHeaderMetric) {
      return 'ScienceHeaderMetric';
    }
    if (data is _i12.ScienceStep) {
      return 'ScienceStep';
    }
    if (data is _i13.SolutionCard) {
      return 'SolutionCard';
    }
    if (data is _i14.SolutionMetric) {
      return 'SolutionMetric';
    }
    if (data is _i15.SolutionsContent) {
      return 'SolutionsContent';
    }
    if (data is _i16.TeamMember) {
      return 'TeamMember';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ClinicalQualityAssurance') {
      return deserialize<_i3.ClinicalQualityAssurance>(data['data']);
    }
    if (data['className'] == 'ExecutiveStat') {
      return deserialize<_i4.ExecutiveStat>(data['data']);
    }
    if (data['className'] == 'HealthStatusResponse') {
      return deserialize<_i5.HealthStatusResponse>(data['data']);
    }
    if (data['className'] == 'HomeContent') {
      return deserialize<_i6.HomeContent>(data['data']);
    }
    if (data['className'] == 'LeadershipContent') {
      return deserialize<_i7.LeadershipContent>(data['data']);
    }
    if (data['className'] == 'PillarItem') {
      return deserialize<_i8.PillarItem>(data['data']);
    }
    if (data['className'] == 'ProductVertical') {
      return deserialize<_i9.ProductVertical>(data['data']);
    }
    if (data['className'] == 'ScienceContent') {
      return deserialize<_i10.ScienceContent>(data['data']);
    }
    if (data['className'] == 'ScienceHeaderMetric') {
      return deserialize<_i11.ScienceHeaderMetric>(data['data']);
    }
    if (data['className'] == 'ScienceStep') {
      return deserialize<_i12.ScienceStep>(data['data']);
    }
    if (data['className'] == 'SolutionCard') {
      return deserialize<_i13.SolutionCard>(data['data']);
    }
    if (data['className'] == 'SolutionMetric') {
      return deserialize<_i14.SolutionMetric>(data['data']);
    }
    if (data['className'] == 'SolutionsContent') {
      return deserialize<_i15.SolutionsContent>(data['data']);
    }
    if (data['className'] == 'TeamMember') {
      return deserialize<_i16.TeamMember>(data['data']);
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
      case _i4.ExecutiveStat:
        return _i4.ExecutiveStat.t;
      case _i8.PillarItem:
        return _i8.PillarItem.t;
      case _i9.ProductVertical:
        return _i9.ProductVertical.t;
      case _i11.ScienceHeaderMetric:
        return _i11.ScienceHeaderMetric.t;
      case _i12.ScienceStep:
        return _i12.ScienceStep.t;
      case _i13.SolutionCard:
        return _i13.SolutionCard.t;
      case _i14.SolutionMetric:
        return _i14.SolutionMetric.t;
      case _i16.TeamMember:
        return _i16.TeamMember.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'jinsei_bio_redesign';
}
