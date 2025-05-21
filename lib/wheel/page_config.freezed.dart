// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageConfig {

 List<WheelConfig> get wheels; bool get allowCustomWheels;
/// Create a copy of PageConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageConfigCopyWith<PageConfig> get copyWith => _$PageConfigCopyWithImpl<PageConfig>(this as PageConfig, _$identity);

  /// Serializes this PageConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageConfig&&const DeepCollectionEquality().equals(other.wheels, wheels)&&(identical(other.allowCustomWheels, allowCustomWheels) || other.allowCustomWheels == allowCustomWheels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(wheels),allowCustomWheels);

@override
String toString() {
  return 'PageConfig(wheels: $wheels, allowCustomWheels: $allowCustomWheels)';
}


}

/// @nodoc
abstract mixin class $PageConfigCopyWith<$Res>  {
  factory $PageConfigCopyWith(PageConfig value, $Res Function(PageConfig) _then) = _$PageConfigCopyWithImpl;
@useResult
$Res call({
 List<WheelConfig> wheels, bool allowCustomWheels
});




}
/// @nodoc
class _$PageConfigCopyWithImpl<$Res>
    implements $PageConfigCopyWith<$Res> {
  _$PageConfigCopyWithImpl(this._self, this._then);

  final PageConfig _self;
  final $Res Function(PageConfig) _then;

/// Create a copy of PageConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wheels = null,Object? allowCustomWheels = null,}) {
  return _then(_self.copyWith(
wheels: null == wheels ? _self.wheels : wheels // ignore: cast_nullable_to_non_nullable
as List<WheelConfig>,allowCustomWheels: null == allowCustomWheels ? _self.allowCustomWheels : allowCustomWheels // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PageConfig implements PageConfig {
  const _PageConfig({required final  List<WheelConfig> wheels, required this.allowCustomWheels}): _wheels = wheels;
  factory _PageConfig.fromJson(Map<String, dynamic> json) => _$PageConfigFromJson(json);

 final  List<WheelConfig> _wheels;
@override List<WheelConfig> get wheels {
  if (_wheels is EqualUnmodifiableListView) return _wheels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wheels);
}

@override final  bool allowCustomWheels;

/// Create a copy of PageConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageConfigCopyWith<_PageConfig> get copyWith => __$PageConfigCopyWithImpl<_PageConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageConfig&&const DeepCollectionEquality().equals(other._wheels, _wheels)&&(identical(other.allowCustomWheels, allowCustomWheels) || other.allowCustomWheels == allowCustomWheels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_wheels),allowCustomWheels);

@override
String toString() {
  return 'PageConfig(wheels: $wheels, allowCustomWheels: $allowCustomWheels)';
}


}

/// @nodoc
abstract mixin class _$PageConfigCopyWith<$Res> implements $PageConfigCopyWith<$Res> {
  factory _$PageConfigCopyWith(_PageConfig value, $Res Function(_PageConfig) _then) = __$PageConfigCopyWithImpl;
@override @useResult
$Res call({
 List<WheelConfig> wheels, bool allowCustomWheels
});




}
/// @nodoc
class __$PageConfigCopyWithImpl<$Res>
    implements _$PageConfigCopyWith<$Res> {
  __$PageConfigCopyWithImpl(this._self, this._then);

  final _PageConfig _self;
  final $Res Function(_PageConfig) _then;

/// Create a copy of PageConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wheels = null,Object? allowCustomWheels = null,}) {
  return _then(_PageConfig(
wheels: null == wheels ? _self._wheels : wheels // ignore: cast_nullable_to_non_nullable
as List<WheelConfig>,allowCustomWheels: null == allowCustomWheels ? _self.allowCustomWheels : allowCustomWheels // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
