import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

final class AppErrors extends Equatable {
  final Map<String, List<String>>? errors;
  final String? message;

  const AppErrors({required this.errors, this.message});

  String getAllErrorsMessagesAsOneMessage() {
    if (errors.isNullOrEmpty) return message ?? AppStrings.unknownError.tr();

    final String errorMessage = errors!.entries
        .map((entry) {
          return entry.value.join(', ');
        })
        .join('\n');

    return errorMessage;
  }

  String? _getAttributeMessage(String key) => errors?[key]?.join(', ');

  //attributes
  String? get email => _getAttributeMessage('email');
  String? get userBankName => _getAttributeMessage('user_bank_name');
  String? get receiverName => _getAttributeMessage('receiver_name');
  String? get receiverPhone => _getAttributeMessage('receiver_phone');

  @override
  List<Object?> get props => [errors, message];
}
