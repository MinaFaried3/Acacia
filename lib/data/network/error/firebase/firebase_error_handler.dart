import 'package:acacia/data/network/error/api/data_source_status.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler implements Exception {
  late final Failure failure;

  FirebaseErrorHandler.handle(dynamic error) {
    if (error is FirebaseAuthException) {
      failure = _handleAuthError(error);
    } else if (error is FirebaseException) {
      failure = _handleFirestoreError(error);
    } else {
      failure = DataSourceStatus.defaultState.getFailure();
    }
  }

  Failure _handleAuthError(FirebaseAuthException error) {
    switch (error.code) {
      // 400 – Bad request
      case 'invalid-email':
      case 'invalid-password':
      case 'invalid-argument':
      case 'invalid-claims':
      case 'invalid-continue-uri':
      case 'invalid-creation-time':
      case 'invalid-credential':
      case 'invalid-disabled-field':
      case 'invalid-display-name':
      case 'invalid-dynamic-link-domain':
      case 'invalid-email-verified':
      case 'invalid-hash-algorithm':
      case 'invalid-hash-block-size':
      case 'invalid-hash-derived-key-length':
      case 'invalid-hash-key':
      case 'invalid-hash-memory-cost':
      case 'invalid-hash-parallelization':
      case 'invalid-hash-rounds':
      case 'invalid-hash-salt-separator':
      case 'invalid-id-token':
      case 'invalid-last-sign-in-time':
      case 'invalid-page-token':
      case 'invalid-password-hash':
      case 'invalid-password-salt':
      case 'invalid-phone-number':
      case 'invalid-photo-url':
      case 'invalid-provider-data':
      case 'invalid-provider-id':
      case 'invalid-oauth-responsetype':
      case 'invalid-session-cookie-duration':
      case 'invalid-uid':
      case 'invalid-user-import':
      case 'missing-android-pkg-name':
      case 'missing-continue-uri':
      case 'missing-hash-algorithm':
      case 'missing-ios-bundle-id':
      case 'missing-uid':
      case 'missing-oauth-client-secret':
        return BadRequestFailure(
          code: 400,
          message: error.message ?? 'Bad request',
        );

      // 401 – Unauthorized
      case 'wrong-password':
      case 'id-token-expired':
      case 'id-token-revoked':
      case 'session-cookie-expired':
      case 'session-cookie-revoked':
        return UnauthorizedFailure(
          code: 401,
          message: error.message ?? 'Unauthorized',
        );

      // 403 – Forbidden
      case 'insufficient-permission':
      case 'operation-not-allowed':
      case 'user-disabled':
        return ForbiddenFailure(
          code: 403,
          message: error.message ?? 'Forbidden',
        );

      // 404 – Not found
      case 'user-not-found':
      case 'project-not-found':
        return NotFoundFailure(
          code: 404,
          message: error.message ?? 'Not found',
        );

      // 409 – Conflict
      case 'email-already-exists':
      case 'phone-number-already-exists':
      case 'uid-already-exists':
      case 'maximum-user-count-exceeded':
        return ConflictFailure(code: 409, message: error.message ?? 'Conflict');

      // 422 – Unprocessable entity
      case 'claims-too-large':
      case 'reserved-claims':
        return UnprocessableEntityFailure(
          code: 422,
          message: error.message ?? 'Unprocessable entity',
        );

      // 429 – Too many requests
      case 'too-many-requests':
        return TooManyRequestsFailure(
          code: 429,
          message: error.message ?? 'Too many requests',
        );

      // 500 – Internal server error
      case 'internal-error':
        return InternalServerErrorFailure(
          code: 500,
          message: error.message ?? 'Internal error',
        );

      default:
        return UnKnownFailure(
          code: 520,
          message: error.message ?? AppStrings.defaultError,
        );
    }
  }

  Failure _handleFirestoreError(FirebaseException error) {
    switch (error.code) {
      case 'cancelled':
        return CancelFailure(
          code: 499,
          message: error.message ?? 'Request cancelled',
        );

      case 'unknown':
        return UnKnownFailure(
          code: 520,
          message: error.message ?? 'Unknown Firestore error',
        );

      case 'invalid-argument':
        return BadRequestFailure(
          code: 400,
          message: error.message ?? 'Invalid argument',
        );

      case 'deadline-exceeded':
        return DeadlineExceededFailure(
          code: 504,
          message: error.message ?? 'Deadline exceeded',
        );

      case 'not-found':
        return NotFoundFailure(
          code: 404,
          message: error.message ?? 'Document not found',
        );

      case 'already-exists':
        return AlreadyExistsFailure(
          code: 409,
          message: error.message ?? 'Already exists',
        );

      case 'permission-denied':
        return ForbiddenFailure(
          code: 403,
          message: error.message ?? 'Permission denied',
        );

      case 'resource-exhausted':
        return ResourceExhaustedFailure(
          code: 429,
          message: error.message ?? 'Resource exhausted',
        );

      case 'failed-precondition':
        return PreconditionFailedFailure(
          code: 412,
          message: error.message ?? 'Precondition failed',
        );

      case 'aborted':
        return AbortedFailure(
          code: 409,
          message: error.message ?? 'Transaction aborted',
        );

      case 'out-of-range':
        return BadRequestFailure(
          code: 400,
          message: error.message ?? 'Out of range',
        );

      case 'unimplemented':
        return NotImplementedFailure(
          code: 501,
          message: error.message ?? 'Not implemented',
        );

      case 'internal':
        return InternalServerErrorFailure(
          code: 500,
          message: error.message ?? 'Internal error',
        );

      case 'unavailable':
        return ServiceUnavailableFailure(
          code: 503,
          message: error.message ?? 'Service unavailable',
        );

      case 'data-loss':
        return AbortedFailure(
          code: 500,
          message: error.message ?? 'Data loss occurred',
        );

      case 'unauthenticated':
        return UnauthenticatedFailure(
          code: 401,
          message: error.message ?? 'Unauthenticated',
        );

      default:
        return UnKnownFailure(
          code: 520,
          message: error.message ?? AppStrings.defaultError,
        );
    }
  }
}
