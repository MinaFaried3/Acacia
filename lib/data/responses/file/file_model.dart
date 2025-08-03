import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable()
class FileModel extends Equatable {
  @JsonKey(name: 'relativePath')
  final String relativePath;

  @JsonKey(name: 'absolutePath')
  final String absolutePath;

  const FileModel({
    required this.relativePath,
    required this.absolutePath,
  });

  /// Factory constructor to create an instance from JSON
  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  /// Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$FileModelToJson(this);

  @override
  List<Object?> get props => [relativePath, absolutePath];

  @override
  String toString() {
    return 'FileModel(relativePath: $relativePath, absolutePath: $absolutePath)';
  }
}
