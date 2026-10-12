/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

library protocol;

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'clinical_qa.dart' as _i2;
import 'executive_stat.dart' as _i3;
import 'health_status.dart' as _i4;
import 'home_content.dart' as _i5;
import 'pillar_item.dart' as _i6;
import 'product_vertical.dart' as _i7;
import 'science_content.dart' as _i8;
import 'science_header_metric.dart' as _i9;
import 'science_step.dart' as _i10;
import 'protocol.dart' as _i11;
import 'package:jinsei_bio_redesign_client/src/protocol/science_step.dart'
    as _i12;
import 'package:jinsei_bio_redesign_client/src/protocol/science_header_metric.dart'
    as _i13;
export 'clinical_qa.dart';
export 'executive_stat.dart';
export 'health_status.dart';
export 'home_content.dart';
export 'pillar_item.dart';
export 'product_vertical.dart';
export 'science_content.dart';
export 'science_header_metric.dart';
export 'science_step.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.ClinicalQualityAssurance) {
      return _i2.ClinicalQualityAssurance.fromJson(data, this) as T;
    }
    if (t == _i3.ExecutiveStat) {
      return _i3.ExecutiveStat.fromJson(data, this) as T;
    }
    if (t == _i4.HealthStatusResponse) {
      return _i4.HealthStatusResponse.fromJson(data, this) as T;
    }
    if (t == _i5.HomeContent) {
      return _i5.HomeContent.fromJson(data, this) as T;
    }
    if (t == _i6.PillarItem) {
      return _i6.PillarItem.fromJson(data, this) as T;
    }
    if (t == _i7.ProductVertical) {
      return _i7.ProductVertical.fromJson(data, this) as T;
    }
    if (t == _i8.ScienceContent) {
      return _i8.ScienceContent.fromJson(data, this) as T;
    }
    if (t == _i9.ScienceHeaderMetric) {
      return _i9.ScienceHeaderMetric.fromJson(data, this) as T;
    }
    if (t == _i10.ScienceStep) {
      return _i10.ScienceStep.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.ClinicalQualityAssurance?>()) {
      return (data != null
          ? _i2.ClinicalQualityAssurance.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i3.ExecutiveStat?>()) {
      return (data != null ? _i3.ExecutiveStat.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.HealthStatusResponse?>()) {
      return (data != null
          ? _i4.HealthStatusResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i5.HomeContent?>()) {
      return (data != null ? _i5.HomeContent.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.PillarItem?>()) {
      return (data != null ? _i6.PillarItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.ProductVertical?>()) {
      return (data != null ? _i7.ProductVertical.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.ScienceContent?>()) {
      return (data != null ? _i8.ScienceContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.ScienceHeaderMetric?>()) {
      return (data != null
          ? _i9.ScienceHeaderMetric.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i10.ScienceStep?>()) {
      return (data != null ? _i10.ScienceStep.fromJson(data, this) : null) as T;
    }
    if (t == List<_i11.PillarItem>) {
      return (data as List).map((e) => deserialize<_i11.PillarItem>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.ExecutiveStat>) {
      return (data as List)
          .map((e) => deserialize<_i11.ExecutiveStat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i11.ProductVertical>) {
      return (data as List)
          .map((e) => deserialize<_i11.ProductVertical>(e))
          .toList() as dynamic;
    }
    if (t == List<_i11.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i11.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i11.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i11.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i12.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i12.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == List<_i13.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i13.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.ClinicalQualityAssurance) {
      return 'ClinicalQualityAssurance';
    }
    if (data is _i3.ExecutiveStat) {
      return 'ExecutiveStat';
    }
    if (data is _i4.HealthStatusResponse) {
      return 'HealthStatusResponse';
    }
    if (data is _i5.HomeContent) {
      return 'HomeContent';
    }
    if (data is _i6.PillarItem) {
      return 'PillarItem';
    }
    if (data is _i7.ProductVertical) {
      return 'ProductVertical';
    }
    if (data is _i8.ScienceContent) {
      return 'ScienceContent';
    }
    if (data is _i9.ScienceHeaderMetric) {
      return 'ScienceHeaderMetric';
    }
    if (data is _i10.ScienceStep) {
      return 'ScienceStep';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ClinicalQualityAssurance') {
      return deserialize<_i2.ClinicalQualityAssurance>(data['data']);
    }
    if (data['className'] == 'ExecutiveStat') {
      return deserialize<_i3.ExecutiveStat>(data['data']);
    }
    if (data['className'] == 'HealthStatusResponse') {
      return deserialize<_i4.HealthStatusResponse>(data['data']);
    }
    if (data['className'] == 'HomeContent') {
      return deserialize<_i5.HomeContent>(data['data']);
    }
    if (data['className'] == 'PillarItem') {
      return deserialize<_i6.PillarItem>(data['data']);
    }
    if (data['className'] == 'ProductVertical') {
      return deserialize<_i7.ProductVertical>(data['data']);
    }
    if (data['className'] == 'ScienceContent') {
      return deserialize<_i8.ScienceContent>(data['data']);
    }
    if (data['className'] == 'ScienceHeaderMetric') {
      return deserialize<_i9.ScienceHeaderMetric>(data['data']);
    }
    if (data['className'] == 'ScienceStep') {
      return deserialize<_i10.ScienceStep>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
