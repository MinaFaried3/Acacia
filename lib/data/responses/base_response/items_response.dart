import 'package:acacia/data/responses/base_response/meta_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'items_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ItemsResponse<T> extends Equatable {
  final List<T> data;
  final Meta? meta;

  const ItemsResponse({required this.data, this.meta});

  // A generic factory method to deserialize the JSON.
  factory ItemsResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ItemsResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ItemsResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [data, meta];
}
