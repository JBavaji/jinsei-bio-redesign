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
import 'executive_stat.dart' as _i2;
import 'health_status.dart' as _i3;
import 'home_content.dart' as _i4;
import 'pillar_item.dart' as _i5;
import 'product_vertical.dart' as _i6;
import 'protocol.dart' as _i7;
export 'executive_stat.dart';
export 'health_status.dart';
export 'home_content.dart';
export 'pillar_item.dart';
export 'product_vertical.dart';
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
    if (t == _i2.ExecutiveStat) {
      return _i2.ExecutiveStat.fromJson(data, this) as T;
    }
    if (t == _i3.HealthStatusResponse) {
      return _i3.HealthStatusResponse.fromJson(data, this) as T;
    }
    if (t == _i4.HomeContent) {
      return _i4.HomeContent.fromJson(data, this) as T;
    }
    if (t == _i5.PillarItem) {
      return _i5.PillarItem.fromJson(data, this) as T;
    }
    if (t == _i6.ProductVertical) {
      return _i6.ProductVertical.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.ExecutiveStat?>()) {
      return (data != null ? _i2.ExecutiveStat.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.HealthStatusResponse?>()) {
      return (data != null
          ? _i3.HealthStatusResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i4.HomeContent?>()) {
      return (data != null ? _i4.HomeContent.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.PillarItem?>()) {
      return (data != null ? _i5.PillarItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.ProductVertical?>()) {
      return (data != null ? _i6.ProductVertical.fromJson(data, this) : null)
          as T;
    }
    if (t == List<_i7.PillarItem>) {
      return (data as List).map((e) => deserialize<_i7.PillarItem>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.ExecutiveStat>) {
      return (data as List)
          .map((e) => deserialize<_i7.ExecutiveStat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i7.ProductVertical>) {
      return (data as List)
          .map((e) => deserialize<_i7.ProductVertical>(e))
          .toList() as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.ExecutiveStat) {
      return 'ExecutiveStat';
    }
    if (data is _i3.HealthStatusResponse) {
      return 'HealthStatusResponse';
    }
    if (data is _i4.HomeContent) {
      return 'HomeContent';
    }
    if (data is _i5.PillarItem) {
      return 'PillarItem';
    }
    if (data is _i6.ProductVertical) {
      return 'ProductVertical';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ExecutiveStat') {
      return deserialize<_i2.ExecutiveStat>(data['data']);
    }
    if (data['className'] == 'HealthStatusResponse') {
      return deserialize<_i3.HealthStatusResponse>(data['data']);
    }
    if (data['className'] == 'HomeContent') {
      return deserialize<_i4.HomeContent>(data['data']);
    }
    if (data['className'] == 'PillarItem') {
      return deserialize<_i5.PillarItem>(data['data']);
    }
    if (data['className'] == 'ProductVertical') {
      return deserialize<_i6.ProductVertical>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
