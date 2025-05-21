import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wheel_config.freezed.dart';
part 'wheel_config.g.dart';

@freezed
abstract class WheelConfig with _$WheelConfig {
  const WheelConfig._();

  const factory WheelConfig({
    required List<Event> events,
    required List<Section> sections,
    @DurationConverter() required Duration spinDuration,
  }) = _WheelConfig;

  factory WheelConfig.fromJson(Map<String, Object?> json) =>
      _$WheelConfigFromJson(json);

  int get totalSize {
    return sections.fold(0, (sum, section) => sum + section.size);
  }
}

@freezed
abstract class Event with _$Event {
  const factory Event({
    required String name,
    @ColorConverter() required Color color,
  }) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}

@freezed
abstract class Section with _$Section {
  const factory Section({required int eventId, required int size}) = _Section;

  factory Section.fromJson(Map<String, Object?> json) =>
      _$SectionFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) {
    return Color(json);
  }

  @override
  int toJson(Color color) {
    return color.toARGB32();
  }
}

class DurationConverter implements JsonConverter<Duration, int> {
  const DurationConverter();

  @override
  Duration fromJson(int json) {
    return Duration(milliseconds: json);
  }

  @override
  int toJson(Duration duration) {
    return duration.inMilliseconds;
  }
}
