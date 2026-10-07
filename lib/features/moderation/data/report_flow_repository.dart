import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';

enum ReportFlowSubmitFailure {
  alreadyReported,
  outdated,
  rateLimited,
  accountUnclaimed,
  emailVerificationRequired,
  rejected,
  generic,
}

class ReportFlowSubmitException implements Exception {
  const ReportFlowSubmitException(this.failure, {this.apiMessage});

  final ReportFlowSubmitFailure failure;
  final String? apiMessage;

  @override
  String toString() => 'ReportFlowSubmitException($failure, $apiMessage)';
}

ReportFlowSubmitException classifyReportFlowSubmitError(Object error) {
  if (error is! DioException) {
    return const ReportFlowSubmitException(ReportFlowSubmitFailure.generic);
  }
  final int? status = error.response?.statusCode;
  final String? code = apiErrorCodeFromDioException(error);
  final String? apiMessage = apiMessageFromDioException(error);
  if (status == 429) {
    return const ReportFlowSubmitException(ReportFlowSubmitFailure.rateLimited);
  }
  final ReportFlowSubmitFailure? failure = switch (code) {
    'CONFLICT' when status == 409 => ReportFlowSubmitFailure.alreadyReported,
    'REPORT_FLOW_OUTDATED' ||
    'INVALID_REPORT_FLOW_ANSWERS' => ReportFlowSubmitFailure.outdated,
    'UNCLAIMED_ACCOUNT_CANNOT_SUBMIT_REPORTS' =>
      ReportFlowSubmitFailure.accountUnclaimed,
    'REPORT_EMAIL_VERIFICATION_REQUIRED' =>
      ReportFlowSubmitFailure.emailVerificationRequired,
    'REPORT_BANNED' => ReportFlowSubmitFailure.rejected,
    final String value
        when value.startsWith('CANNOT_REPORT_') ||
            value.startsWith('UNKNOWN_') =>
      ReportFlowSubmitFailure.rejected,
    _ => null,
  };
  return ReportFlowSubmitException(
    failure ?? ReportFlowSubmitFailure.generic,
    apiMessage: apiMessage,
  );
}

class ReportFlowRepository {
  ReportFlowRepository(this._dio);

  final Dio _dio;

  Future<ReportFlow> fetch(
    ReportFlowTargetType targetType, {
    required String locale,
  }) async {
    final Response<Map<String, dynamic>> response = await _dio
        .get<Map<String, dynamic>>(
          '/reports/flows/${targetType.wireValue}',
          queryParameters: <String, Object>{
            'surface': 'in_app',
            'locale': locale,
          },
        );
    final Map<String, dynamic>? data = response.data;
    if (data == null) {
      throw const FormatException('Empty report flow response');
    }
    return ReportFlow.fromJson(data);
  }

  Future<String> submitMessage({
    required String channelId,
    required String messageId,
    required String revisionHash,
    required List<ReportFlowStep> steps,
    required String locale,
  }) {
    return _submit(ReportFlowTargetType.message, <String, Object>{
      'channel_id': channelId,
      'message_id': messageId,
      ..._answers(revisionHash, steps, locale),
    });
  }

  Future<String> submitUser({
    required String userId,
    required String revisionHash,
    required List<ReportFlowStep> steps,
    required String locale,
    String? guildId,
  }) {
    return _submit(ReportFlowTargetType.user, <String, Object>{
      'user_id': userId,
      'guild_id': ?guildId,
      ..._answers(revisionHash, steps, locale),
    });
  }

  Map<String, Object> _answers(
    String revisionHash,
    List<ReportFlowStep> steps,
    String locale,
  ) {
    return <String, Object>{
      'revision_hash': revisionHash,
      'locale': locale,
      'steps': steps
          .map((ReportFlowStep step) => step.toJson())
          .toList(growable: false),
    };
  }

  Future<String> _submit(
    ReportFlowTargetType targetType,
    Map<String, Object> body,
  ) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio
          .post<Map<String, dynamic>>(
            '/reports/flows/${targetType.wireValue}/submissions',
            data: body,
          );
      final Object? reportId = response.data?['report_id'];
      return reportId is String ? reportId : '';
    } on DioException catch (error) {
      throw classifyReportFlowSubmitError(error);
    }
  }
}
