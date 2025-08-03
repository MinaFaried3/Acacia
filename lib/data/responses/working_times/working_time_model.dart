import 'package:json_annotation/json_annotation.dart';

part 'working_time_model.g.dart';

@JsonSerializable()
class WorkingTimeModel {
  @JsonKey(name: 'closing_hour')
  final String? closingHour;

  @JsonKey(name: 'start_hour')
  final String? startingHour;

  @JsonKey(
    fromJson: WorkTimeEnum.fromString,
    toJson: _workTimeToJson,
  )
  final WorkTimeEnum type;

  @JsonKey(name: 'additional_amount')
  final String? additionalAmount;

  @JsonKey(name: 'message')
  final String? message;

  WorkingTimeModel({
    this.closingHour,
    this.startingHour,
    required this.type,
    this.additionalAmount,
    this.message,
  });

  // Factory method to generate an instance from JSON
  factory WorkingTimeModel.fromJson(Map<String, dynamic> json) =>
      _$WorkingTimeModelFromJson(json);

  // Method to serialize an instance to JSON
  Map<String, dynamic> toJson() => _$WorkingTimeModelToJson(this);

  static String _workTimeToJson(WorkTimeEnum work) => work.name;
}

enum WorkTimeEnum {
  percentage('Percentage'),
  number('Number');

  final String name;

  const WorkTimeEnum(this.name);

  // fromString function
  static WorkTimeEnum fromString(String name) {
    return WorkTimeEnum.values.firstWhere(
      (status) => status.name == name,
      orElse: () => WorkTimeEnum.number,
    );
  }

  bool get isPercentage => this == WorkTimeEnum.percentage;

  bool get isNumber => this == WorkTimeEnum.number;
}
