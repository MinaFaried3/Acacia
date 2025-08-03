import 'package:acacia/data/responses/base_response/items_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';
// dart run build_runner build --delete-conflicting-outputs

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponse<T> {
  final ItemsResponse<T> items;

  const PaginationResponse({required this.items});

  // Generic fromJson method that handles nested data serialization
  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginationResponseFromJson(json, fromJsonT);

  // Generic toJson method
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginationResponseToJson(this, toJsonT);

  List<Object?> get props => [items];
}
