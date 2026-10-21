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
import 'b2b_modal_content.dart' as _i2;
import 'clinical_qa.dart' as _i3;
import 'executive_stat.dart' as _i4;
import 'formulation_format_option.dart' as _i5;
import 'health_status.dart' as _i6;
import 'home_content.dart' as _i7;
import 'leadership_content.dart' as _i8;
import 'pillar_item.dart' as _i9;
import 'product_vertical.dart' as _i10;
import 'science_content.dart' as _i11;
import 'science_header_metric.dart' as _i12;
import 'science_step.dart' as _i13;
import 'solution_card.dart' as _i14;
import 'solution_metric.dart' as _i15;
import 'solutions_content.dart' as _i16;
import 'strain_vertical_option.dart' as _i17;
import 'team_member.dart' as _i18;
import 'protocol.dart' as _i19;
import 'package:jinsei_bio_redesign_client/src/protocol/science_step.dart'
    as _i20;
import 'package:jinsei_bio_redesign_client/src/protocol/science_header_metric.dart'
    as _i21;
import 'package:jinsei_bio_redesign_client/src/protocol/solution_card.dart'
    as _i22;
import 'package:jinsei_bio_redesign_client/src/protocol/solution_metric.dart'
    as _i23;
import 'package:jinsei_bio_redesign_client/src/protocol/team_member.dart'
    as _i24;
export 'b2b_modal_content.dart';
export 'clinical_qa.dart';
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
    if (t == _i2.B2bModalContent) {
      return _i2.B2bModalContent.fromJson(data, this) as T;
    }
    if (t == _i3.ClinicalQualityAssurance) {
      return _i3.ClinicalQualityAssurance.fromJson(data, this) as T;
    }
    if (t == _i4.ExecutiveStat) {
      return _i4.ExecutiveStat.fromJson(data, this) as T;
    }
    if (t == _i5.FormulationFormatOption) {
      return _i5.FormulationFormatOption.fromJson(data, this) as T;
    }
    if (t == _i6.HealthStatusResponse) {
      return _i6.HealthStatusResponse.fromJson(data, this) as T;
    }
    if (t == _i7.HomeContent) {
      return _i7.HomeContent.fromJson(data, this) as T;
    }
    if (t == _i8.LeadershipContent) {
      return _i8.LeadershipContent.fromJson(data, this) as T;
    }
    if (t == _i9.PillarItem) {
      return _i9.PillarItem.fromJson(data, this) as T;
    }
    if (t == _i10.ProductVertical) {
      return _i10.ProductVertical.fromJson(data, this) as T;
    }
    if (t == _i11.ScienceContent) {
      return _i11.ScienceContent.fromJson(data, this) as T;
    }
    if (t == _i12.ScienceHeaderMetric) {
      return _i12.ScienceHeaderMetric.fromJson(data, this) as T;
    }
    if (t == _i13.ScienceStep) {
      return _i13.ScienceStep.fromJson(data, this) as T;
    }
    if (t == _i14.SolutionCard) {
      return _i14.SolutionCard.fromJson(data, this) as T;
    }
    if (t == _i15.SolutionMetric) {
      return _i15.SolutionMetric.fromJson(data, this) as T;
    }
    if (t == _i16.SolutionsContent) {
      return _i16.SolutionsContent.fromJson(data, this) as T;
    }
    if (t == _i17.StrainVerticalOption) {
      return _i17.StrainVerticalOption.fromJson(data, this) as T;
    }
    if (t == _i18.TeamMember) {
      return _i18.TeamMember.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.B2bModalContent?>()) {
      return (data != null ? _i2.B2bModalContent.fromJson(data, this) : null)
          as T;
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
    if (t == _i1.getType<_i5.FormulationFormatOption?>()) {
      return (data != null
          ? _i5.FormulationFormatOption.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i6.HealthStatusResponse?>()) {
      return (data != null
          ? _i6.HealthStatusResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i7.HomeContent?>()) {
      return (data != null ? _i7.HomeContent.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.LeadershipContent?>()) {
      return (data != null ? _i8.LeadershipContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.PillarItem?>()) {
      return (data != null ? _i9.PillarItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.ProductVertical?>()) {
      return (data != null ? _i10.ProductVertical.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.ScienceContent?>()) {
      return (data != null ? _i11.ScienceContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i12.ScienceHeaderMetric?>()) {
      return (data != null
          ? _i12.ScienceHeaderMetric.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i13.ScienceStep?>()) {
      return (data != null ? _i13.ScienceStep.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i14.SolutionCard?>()) {
      return (data != null ? _i14.SolutionCard.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i15.SolutionMetric?>()) {
      return (data != null ? _i15.SolutionMetric.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i16.SolutionsContent?>()) {
      return (data != null ? _i16.SolutionsContent.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i17.StrainVerticalOption?>()) {
      return (data != null
          ? _i17.StrainVerticalOption.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i18.TeamMember?>()) {
      return (data != null ? _i18.TeamMember.fromJson(data, this) : null) as T;
    }
    if (t == List<_i19.StrainVerticalOption>) {
      return (data as List)
          .map((e) => deserialize<_i19.StrainVerticalOption>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.FormulationFormatOption>) {
      return (data as List)
          .map((e) => deserialize<_i19.FormulationFormatOption>(e))
          .toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.PillarItem>) {
      return (data as List).map((e) => deserialize<_i19.PillarItem>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.ExecutiveStat>) {
      return (data as List)
          .map((e) => deserialize<_i19.ExecutiveStat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.ProductVertical>) {
      return (data as List)
          .map((e) => deserialize<_i19.ProductVertical>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.TeamMember>) {
      return (data as List).map((e) => deserialize<_i19.TeamMember>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i19.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i19.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.SolutionMetric>) {
      return (data as List)
          .map((e) => deserialize<_i19.SolutionMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.SolutionCard>) {
      return (data as List)
          .map((e) => deserialize<_i19.SolutionCard>(e))
          .toList() as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i20.ScienceStep>) {
      return (data as List)
          .map((e) => deserialize<_i20.ScienceStep>(e))
          .toList() as dynamic;
    }
    if (t == List<_i21.ScienceHeaderMetric>) {
      return (data as List)
          .map((e) => deserialize<_i21.ScienceHeaderMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i22.SolutionCard>) {
      return (data as List)
          .map((e) => deserialize<_i22.SolutionCard>(e))
          .toList() as dynamic;
    }
    if (t == List<_i23.SolutionMetric>) {
      return (data as List)
          .map((e) => deserialize<_i23.SolutionMetric>(e))
          .toList() as dynamic;
    }
    if (t == List<_i24.TeamMember>) {
      return (data as List).map((e) => deserialize<_i24.TeamMember>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.B2bModalContent) {
      return 'B2bModalContent';
    }
    if (data is _i3.ClinicalQualityAssurance) {
      return 'ClinicalQualityAssurance';
    }
    if (data is _i4.ExecutiveStat) {
      return 'ExecutiveStat';
    }
    if (data is _i5.FormulationFormatOption) {
      return 'FormulationFormatOption';
    }
    if (data is _i6.HealthStatusResponse) {
      return 'HealthStatusResponse';
    }
    if (data is _i7.HomeContent) {
      return 'HomeContent';
    }
    if (data is _i8.LeadershipContent) {
      return 'LeadershipContent';
    }
    if (data is _i9.PillarItem) {
      return 'PillarItem';
    }
    if (data is _i10.ProductVertical) {
      return 'ProductVertical';
    }
    if (data is _i11.ScienceContent) {
      return 'ScienceContent';
    }
    if (data is _i12.ScienceHeaderMetric) {
      return 'ScienceHeaderMetric';
    }
    if (data is _i13.ScienceStep) {
      return 'ScienceStep';
    }
    if (data is _i14.SolutionCard) {
      return 'SolutionCard';
    }
    if (data is _i15.SolutionMetric) {
      return 'SolutionMetric';
    }
    if (data is _i16.SolutionsContent) {
      return 'SolutionsContent';
    }
    if (data is _i17.StrainVerticalOption) {
      return 'StrainVerticalOption';
    }
    if (data is _i18.TeamMember) {
      return 'TeamMember';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'B2bModalContent') {
      return deserialize<_i2.B2bModalContent>(data['data']);
    }
    if (data['className'] == 'ClinicalQualityAssurance') {
      return deserialize<_i3.ClinicalQualityAssurance>(data['data']);
    }
    if (data['className'] == 'ExecutiveStat') {
      return deserialize<_i4.ExecutiveStat>(data['data']);
    }
    if (data['className'] == 'FormulationFormatOption') {
      return deserialize<_i5.FormulationFormatOption>(data['data']);
    }
    if (data['className'] == 'HealthStatusResponse') {
      return deserialize<_i6.HealthStatusResponse>(data['data']);
    }
    if (data['className'] == 'HomeContent') {
      return deserialize<_i7.HomeContent>(data['data']);
    }
    if (data['className'] == 'LeadershipContent') {
      return deserialize<_i8.LeadershipContent>(data['data']);
    }
    if (data['className'] == 'PillarItem') {
      return deserialize<_i9.PillarItem>(data['data']);
    }
    if (data['className'] == 'ProductVertical') {
      return deserialize<_i10.ProductVertical>(data['data']);
    }
    if (data['className'] == 'ScienceContent') {
      return deserialize<_i11.ScienceContent>(data['data']);
    }
    if (data['className'] == 'ScienceHeaderMetric') {
      return deserialize<_i12.ScienceHeaderMetric>(data['data']);
    }
    if (data['className'] == 'ScienceStep') {
      return deserialize<_i13.ScienceStep>(data['data']);
    }
    if (data['className'] == 'SolutionCard') {
      return deserialize<_i14.SolutionCard>(data['data']);
    }
    if (data['className'] == 'SolutionMetric') {
      return deserialize<_i15.SolutionMetric>(data['data']);
    }
    if (data['className'] == 'SolutionsContent') {
      return deserialize<_i16.SolutionsContent>(data['data']);
    }
    if (data['className'] == 'StrainVerticalOption') {
      return deserialize<_i17.StrainVerticalOption>(data['data']);
    }
    if (data['className'] == 'TeamMember') {
      return deserialize<_i18.TeamMember>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
