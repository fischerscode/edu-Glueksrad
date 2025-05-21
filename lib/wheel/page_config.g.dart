// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageConfig _$PageConfigFromJson(Map<String, dynamic> json) => _PageConfig(
  wheels: (json['wheels'] as List<dynamic>)
      .map((e) => WheelConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  allowCustomWheels: json['allowCustomWheels'] as bool,
);

Map<String, dynamic> _$PageConfigToJson(_PageConfig instance) =>
    <String, dynamic>{
      'wheels': instance.wheels,
      'allowCustomWheels': instance.allowCustomWheels,
    };
