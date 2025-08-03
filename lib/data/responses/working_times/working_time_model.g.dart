// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingTimeModel _$WorkingTimeModelFromJson(Map<String, dynamic> json) =>
    WorkingTimeModel(
      closingHour: json['closing_hour'] as String?,
      startingHour: json['start_hour'] as String?,
      type: WorkTimeEnum.fromString(json['type'] as String),
      additionalAmount: json['additional_amount'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WorkingTimeModelToJson(WorkingTimeModel instance) =>
    <String, dynamic>{
      'closing_hour': instance.closingHour,
      'start_hour': instance.startingHour,
      'type': WorkingTimeModel._workTimeToJson(instance.type),
      'additional_amount': instance.additionalAmount,
      'message': instance.message,
    };
