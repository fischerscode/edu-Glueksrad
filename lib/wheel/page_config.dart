import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glueksrad/wheel/wheel_config.dart';

part 'page_config.freezed.dart';
part 'page_config.g.dart';

@freezed
abstract class PageConfig with _$PageConfig {
  const factory PageConfig({
    required List<WheelConfig> wheels,
    required bool allowCustomWheels,
  }) = _PageConfig;

  factory PageConfig.fromJson(Map<String, dynamic> json) =>
      _$PageConfigFromJson(json);
}
