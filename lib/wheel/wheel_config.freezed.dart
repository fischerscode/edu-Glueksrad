// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wheel_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WheelConfig {

 List<Event> get events; List<Section> get sections;
/// Create a copy of WheelConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WheelConfigCopyWith<WheelConfig> get copyWith => _$WheelConfigCopyWithImpl<WheelConfig>(this as WheelConfig, _$identity);

  /// Serializes this WheelConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WheelConfig&&const DeepCollectionEquality().equals(other.events, events)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events),const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'WheelConfig(events: $events, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $WheelConfigCopyWith<$Res>  {
  factory $WheelConfigCopyWith(WheelConfig value, $Res Function(WheelConfig) _then) = _$WheelConfigCopyWithImpl;
@useResult
$Res call({
 List<Event> events, List<Section> sections
});




}
/// @nodoc
class _$WheelConfigCopyWithImpl<$Res>
    implements $WheelConfigCopyWith<$Res> {
  _$WheelConfigCopyWithImpl(this._self, this._then);

  final WheelConfig _self;
  final $Res Function(WheelConfig) _then;

/// Create a copy of WheelConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = null,Object? sections = null,}) {
  return _then(_self.copyWith(
events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<Section>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WheelConfig extends WheelConfig {
  const _WheelConfig({required final  List<Event> events, required final  List<Section> sections}): _events = events,_sections = sections,super._();
  factory _WheelConfig.fromJson(Map<String, dynamic> json) => _$WheelConfigFromJson(json);

 final  List<Event> _events;
@override List<Event> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  List<Section> _sections;
@override List<Section> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of WheelConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WheelConfigCopyWith<_WheelConfig> get copyWith => __$WheelConfigCopyWithImpl<_WheelConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WheelConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WheelConfig&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'WheelConfig(events: $events, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$WheelConfigCopyWith<$Res> implements $WheelConfigCopyWith<$Res> {
  factory _$WheelConfigCopyWith(_WheelConfig value, $Res Function(_WheelConfig) _then) = __$WheelConfigCopyWithImpl;
@override @useResult
$Res call({
 List<Event> events, List<Section> sections
});




}
/// @nodoc
class __$WheelConfigCopyWithImpl<$Res>
    implements _$WheelConfigCopyWith<$Res> {
  __$WheelConfigCopyWithImpl(this._self, this._then);

  final _WheelConfig _self;
  final $Res Function(_WheelConfig) _then;

/// Create a copy of WheelConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = null,Object? sections = null,}) {
  return _then(_WheelConfig(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<Section>,
  ));
}


}


/// @nodoc
mixin _$Event {

 String get name;@ColorConverter() Color get color;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,color);

@override
String toString() {
  return 'Event(name: $name, color: $color)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 String name,@ColorConverter() Color color
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? color = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Event implements Event {
  const _Event({required this.name, @ColorConverter() required this.color});
  factory _Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

@override final  String name;
@override@ColorConverter() final  Color color;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,color);

@override
String toString() {
  return 'Event(name: $name, color: $color)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 String name,@ColorConverter() Color color
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? color = null,}) {
  return _then(_Event(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}


/// @nodoc
mixin _$Section {

 int get eventId; int get size;
/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionCopyWith<Section> get copyWith => _$SectionCopyWithImpl<Section>(this as Section, _$identity);

  /// Serializes this Section to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Section&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eventId,size);

@override
String toString() {
  return 'Section(eventId: $eventId, size: $size)';
}


}

/// @nodoc
abstract mixin class $SectionCopyWith<$Res>  {
  factory $SectionCopyWith(Section value, $Res Function(Section) _then) = _$SectionCopyWithImpl;
@useResult
$Res call({
 int eventId, int size
});




}
/// @nodoc
class _$SectionCopyWithImpl<$Res>
    implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._self, this._then);

  final Section _self;
  final $Res Function(Section) _then;

/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eventId = null,Object? size = null,}) {
  return _then(_self.copyWith(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Section implements Section {
  const _Section({required this.eventId, required this.size});
  factory _Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);

@override final  int eventId;
@override final  int size;

/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionCopyWith<_Section> get copyWith => __$SectionCopyWithImpl<_Section>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Section&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eventId,size);

@override
String toString() {
  return 'Section(eventId: $eventId, size: $size)';
}


}

/// @nodoc
abstract mixin class _$SectionCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$SectionCopyWith(_Section value, $Res Function(_Section) _then) = __$SectionCopyWithImpl;
@override @useResult
$Res call({
 int eventId, int size
});




}
/// @nodoc
class __$SectionCopyWithImpl<$Res>
    implements _$SectionCopyWith<$Res> {
  __$SectionCopyWithImpl(this._self, this._then);

  final _Section _self;
  final $Res Function(_Section) _then;

/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? size = null,}) {
  return _then(_Section(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
