// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WheelConfig _$WheelConfigFromJson(Map<String, dynamic> json) => _WheelConfig(
  events: (json['events'] as List<dynamic>)
      .map((e) => Event.fromJson(e as Map<String, dynamic>))
      .toList(),
  sections: (json['sections'] as List<dynamic>)
      .map((e) => Section.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WheelConfigToJson(_WheelConfig instance) =>
    <String, dynamic>{'events': instance.events, 'sections': instance.sections};

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  name: json['name'] as String,
  color: const ColorConverter().fromJson((json['color'] as num).toInt()),
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'name': instance.name,
  'color': const ColorConverter().toJson(instance.color),
};

_Section _$SectionFromJson(Map<String, dynamic> json) => _Section(
  eventId: (json['eventId'] as num).toInt(),
  size: (json['size'] as num).toInt(),
);

Map<String, dynamic> _$SectionToJson(_Section instance) => <String, dynamic>{
  'eventId': instance.eventId,
  'size': instance.size,
};
