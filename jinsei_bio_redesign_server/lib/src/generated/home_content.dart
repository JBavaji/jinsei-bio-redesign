/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class HomeContent extends _i1.SerializableEntity {
  HomeContent._({
    required this.pillars,
    required this.executiveStats,
    required this.productVerticals,
  });

  factory HomeContent({
    required List<_i2.PillarItem> pillars,
    required List<_i2.ExecutiveStat> executiveStats,
    required List<_i2.ProductVertical> productVerticals,
  }) = _HomeContentImpl;

  factory HomeContent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return HomeContent(
      pillars: serializationManager
          .deserialize<List<_i2.PillarItem>>(jsonSerialization['pillars']),
      executiveStats: serializationManager.deserialize<List<_i2.ExecutiveStat>>(
          jsonSerialization['executiveStats']),
      productVerticals:
          serializationManager.deserialize<List<_i2.ProductVertical>>(
              jsonSerialization['productVerticals']),
    );
  }

  List<_i2.PillarItem> pillars;

  List<_i2.ExecutiveStat> executiveStats;

  List<_i2.ProductVertical> productVerticals;

  HomeContent copyWith({
    List<_i2.PillarItem>? pillars,
    List<_i2.ExecutiveStat>? executiveStats,
    List<_i2.ProductVertical>? productVerticals,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'pillars': pillars.toJson(valueToJson: (v) => v.toJson()),
      'executiveStats': executiveStats.toJson(valueToJson: (v) => v.toJson()),
      'productVerticals':
          productVerticals.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'pillars': pillars.toJson(valueToJson: (v) => v.allToJson()),
      'executiveStats':
          executiveStats.toJson(valueToJson: (v) => v.allToJson()),
      'productVerticals':
          productVerticals.toJson(valueToJson: (v) => v.allToJson()),
    };
  }
}

class _HomeContentImpl extends HomeContent {
  _HomeContentImpl({
    required List<_i2.PillarItem> pillars,
    required List<_i2.ExecutiveStat> executiveStats,
    required List<_i2.ProductVertical> productVerticals,
  }) : super._(
          pillars: pillars,
          executiveStats: executiveStats,
          productVerticals: productVerticals,
        );

  @override
  HomeContent copyWith({
    List<_i2.PillarItem>? pillars,
    List<_i2.ExecutiveStat>? executiveStats,
    List<_i2.ProductVertical>? productVerticals,
  }) {
    return HomeContent(
      pillars: pillars ?? this.pillars.clone(),
      executiveStats: executiveStats ?? this.executiveStats.clone(),
      productVerticals: productVerticals ?? this.productVerticals.clone(),
    );
  }
}
