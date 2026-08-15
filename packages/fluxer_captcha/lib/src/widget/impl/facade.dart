// Constructor parameters are required by the interface but unused in the stub.
// ignore_for_file: avoid_unused_constructor_parameters

import 'package:fluxer_captcha/src/captcha_provider.dart';
import 'package:fluxer_captcha/src/controller/captcha_controller.dart';
import 'package:fluxer_captcha/src/widget/captcha_options.dart';
import 'package:fluxer_captcha/src/widget/interface.dart' as i;
import 'package:material_ui/material_ui.dart';

/// Facade class — platform-specific implementations are selected at compile
/// time via conditional exports.
class FluxerCaptcha extends StatelessWidget implements i.FluxerCaptcha {
  FluxerCaptcha({
    required this.provider,
    required this.siteKey,
    super.key,
    this.action,
    this.cData,
    this.baseUrl = 'http://localhost/',
    CaptchaOptions? options,
    this.controller,
    this.onTokenReceived,
    this.onTokenExpired,
    this.onError,
    this.onTimeout,
  }) : options = options ?? CaptchaOptions();

  factory FluxerCaptcha.invisible({
    required CaptchaProvider provider,
    required String siteKey,
    String? action,
    String? cData,
    String baseUrl = 'http://localhost',
    CaptchaOptions? options,
    i.OnTokenReceived? onTokenReceived,
    i.OnTokenExpired? onTokenExpired,
    i.OnTimeout? onTimeout,
  }) {
    throw UnimplementedError(
      'Cannot call this method on the facade implementation of FluxerCaptcha.',
    );
  }

  @override
  final CaptchaProvider provider;

  @override
  final String siteKey;

  @override
  final String? action;

  @override
  final String? cData;

  @override
  final String baseUrl;

  @override
  final CaptchaOptions? options;

  @override
  final CaptchaController? controller;

  @override
  final i.OnTokenReceived? onTokenReceived;

  @override
  final i.OnTokenExpired? onTokenExpired;

  @override
  final i.OnError? onError;

  @override
  final i.OnTimeout? onTimeout;

  @override
  String? get token => throw UnimplementedError(
    'Cannot call this method on the facade implementation of '
    'FluxerCaptcha.',
  );

  @override
  String? get id => throw UnimplementedError(
    'Cannot call this method on the facade implementation of '
    'FluxerCaptcha.',
  );

  @override
  Future<void> refresh({bool forceRefresh = true}) {
    throw UnimplementedError(
      'Cannot call this method on the facade implementation of FluxerCaptcha.',
    );
  }

  @override
  Future<String?> getToken() {
    throw UnimplementedError(
      'Cannot call this method on the facade implementation of FluxerCaptcha.',
    );
  }

  @override
  Future<bool> isExpired() {
    throw UnimplementedError(
      'Cannot call this method on the facade implementation of FluxerCaptcha.',
    );
  }

  @override
  Future<void> dispose() {
    throw UnimplementedError(
      'Cannot call this method on the facade implementation of FluxerCaptcha.',
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError(
      'Cannot call this method on the facade implementation of FluxerCaptcha.',
    );
  }
}
