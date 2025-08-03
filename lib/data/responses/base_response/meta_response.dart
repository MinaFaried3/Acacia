import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_response.g.dart';

@JsonSerializable()
class Meta extends Equatable {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  @override
  List<Object?> get props =>
      [currentPage, from, lastPage, path, perPage, to, total];
}
