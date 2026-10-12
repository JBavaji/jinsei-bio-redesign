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
import 'pillar_item.dart' as _i7;
import 'product_vertical.dart' as _i8;
import 'science_content.dart' as _i9;
import 'science_header_metric.dart' as _i10;
import 'science_step.dart' as _i11;
import 'protocol.dart' as _i12;
export 'clinical_qa.dart';
export 'executive_stat.dart';
export 'health_status.dart';
export 'home_content.dart';
export 'pillar_item.dart';
export 'product_vertical.dart';
export 'science_content.dart';
export 'science_header_metric.dart';
export 'science_step.dart';

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
    if (t == _i7.PillarItem) {
      return _i7.PillarItem.fromJson(data, this) as T;
    }
    if (t == _i8.ProductVertical) {
      return _i8.ProductVertical.fromJson(data, this) as T;
    }
    if (t == _i9.ScienceContent) {
      return _i9.ScienceContent.fromJson(data, this) as T;
    }
    if (t == _i10.ScienceHeaderMetric) {
      return _i10.ScienceHeaderMetric.fromJson(data, this) as T;
    }
    if (t == _i11.ScienceStep) {
      return _i11.ScienceStep.fromJson(data, this) as T;
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
    if (t == _i1.getType<_i7.PillarItem?>()) {
      return (data != null ? _i7.PillarItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.ProductVertical?>()) {
      return (data != null ? _i8.ProductVertical.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.ScienceContent?>()) {
      return (data != null ? _i9.ScienceContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i10.ScienceHeaderMetric?>()) {
      return (data != null
          ? _i10.ScienceHeaderMetric.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i11.ScienceStep?>()) {
      return (data != null ? _i11.ScienceStep.fromJson(data, this) : null) as T;
    }
    if (t == List<_i12.PillarItem>) {
      return (data as List).map((e) => deserialize<_i12.PillarItem>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.ExecutiveStat>) {
      return (data as List)
          .map((e) => deserialize<_i12.ExecutiveStat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i12.ProductVertical>) {
      return (data as List)
          .map((e) => deserialize<_i12.ProductVertical>(e))
          .toList() as dynamic;
    }
    if (t == List<_i12.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i12.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i12.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i12.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
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
    if (data is _i7.PillarItem) {
      return 'PillarItem';
    }
    if (data is _i8.ProductVertical) {
      return 'ProductVertical';
    }
    if (data is _i9.ScienceContent) {
      return 'ScienceContent';
    }
    if (data is _i10.ScienceHeaderMetric) {
      return 'ScienceHeaderMetric';
    }
    if (data is _i11.ScienceStep) {
      return 'ScienceStep';
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
    if (data['className'] == 'PillarItem') {
      return deserialize<_i7.PillarItem>(data['data']);
    }
    if (data['className'] == 'ProductVertical') {
      return deserialize<_i8.ProductVertical>(data['data']);
    }
    if (data['className'] == 'ScienceContent') {
      return deserialize<_i9.ScienceContent>(data['data']);
    }
    if (data['className'] == 'ScienceHeaderMetric') {
      return deserialize<_i10.ScienceHeaderMetric>(data['data']);
    }
    if (data['className'] == 'ScienceStep') {
      return deserialize<_i11.ScienceStep>(data['data']);
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
      case _i7.PillarItem:
        return _i7.PillarItem.t;
      case _i8.ProductVertical:
        return _i8.ProductVertical.t;
      case _i10.ScienceHeaderMetric:
        return _i10.ScienceHeaderMetric.t;
      case _i11.ScienceStep:
        return _i11.ScienceStep.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'jinsei_bio_redesign';
}
