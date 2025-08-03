import 'package:acacia/data/responses/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ItemModel<T> extends BaseResponse {
  @JsonKey(name: 'item')
  final T item;

  const ItemModel({
    super.status,
    super.code,
    super.message,
    required this.item,
  });

  // Generic `fromJson` factory
  factory ItemModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ItemModelFromJson(json, fromJsonT);

  // Generic `toJson` method
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ItemModelToJson(this, toJsonT);
}
