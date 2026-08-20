import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:ui';
import 'dart:ui_web' as ui;

import 'package:fluxer_captcha/src/captcha_exception.dart';
import 'package:fluxer_captcha/src/captcha_provider.dart';
import 'package:fluxer_captcha/src/captcha_validation.dart';
import 'package:fluxer_captcha/src/controller/captcha_controller.dart';
import 'package:fluxer_captcha/src/controller/impl/captcha_controller_web.dart'
    as web_ctrl;
import 'package:fluxer_captcha/src/widget/captcha_content_size.dart';
import 'package:fluxer_captcha/src/widget/captcha_options.dart';
import 'package:fluxer_captcha/src/widget/captcha_styling.dart';
import 'package:fluxer_captcha/src/widget/interface.dart' as i;
import 'package:material_ui/material_ui.dart';
import 'package:web/web.dart' as web;

/// Resolves `auto` theme to `light` or `dark` using platform brightness.
String _resolveTheme(CaptchaOptions options) {
  if (options.theme != CaptchaTheme.auto) return options.theme.name;
  final brightness = PlatformDispatcher.instance.platformBrightness;
  return brightness == Brightness.dark ? 'dark' : 'light';
}

class _DartCaptcha {
  const _DartCaptcha({
    required this.provider,
    required this.instanceId,
    this.onTokenReceived,
    this.onTokenExpired,
    this.onRawError,
    this.onLoaded,
  });

  final CaptchaProvider provider;
  final String instanceId;
  final i.OnTokenReceived? onTokenReceived;
  final i.OnTokenExpired? onTokenExpired;
  final void Function(String code)? onRawError;
  final void Function()? onLoaded;

  String get _jsGlobal =>
      provider == CaptchaProvider.turnstile ? 'turnstile' : 'hcaptcha';

  @JSExport('onTokenReceived')
  void onReceived(JSString token) {
    onTokenReceived?.call(token.toDart);
  }

  @JSExport('onTokenExpired')
  void onExpired() {
    onTokenExpired?.call();
  }

  @JSExport('onTokenError')
  void onError(JSString code) {
    onRawError?.call(code.toDart);
  }

  @JSExport('onCaptchaReady')
  void onReady() {
    onLoaded?.call();
  }

  bool isScriptLoaded() => web.window.hasProperty(_jsGlobal.toJS).toDart;

  void loadScript() {
    if (!isScriptLoaded()) {
      final scriptUrl = switch (provider) {
        CaptchaProvider.turnstile =>
          'https://challenges.cloudflare.com/turnstile/v0/api.js'
              '?render=explicit&onload=onCaptchaReady',
        CaptchaProvider.hcaptcha =>
          'https://js.hcaptcha.com/1/api.js'
              '?render=explicit&onload=onCaptchaReady',
      };

      final mainScript = web.HTMLScriptElement()
        ..id = 'captcha-script'
        ..async = true
        ..defer = true
        ..src = scriptUrl;

      web.document.head?.append(mainScript);
    }
  }

  web.HTMLDivElement buildWidget({
    required String siteKey,
    required CaptchaOptions options,
    String? action,
    String? cData,
  }) {
    final widget = web.HTMLDivElement()
      ..style.width = '100%'
      ..style.height = 'auto'
      ..style.minHeight = '${options.size.height}px'
      ..style.overflow = 'visible'
      ..style.pointerEvents = 'auto'
      ..style.setProperty('touch-action', 'none')
      ..setAttribute('data-sitekey', siteKey)
      ..setAttribute('data-theme', _resolveTheme(options))
      ..setAttribute('data-size', options.size.name)
      ..setAttribute('data-callback', 'onCaptchaTokenReceived_$instanceId')
      ..setAttribute(
        'data-expired-callback',
        'onCaptchaTokenExpired_$instanceId',
      )
      ..setAttribute('data-error-callback', 'onCaptchaError_$instanceId');

    if (provider == CaptchaProvider.turnstile) {
      widget
        ..setAttribute('data-language', options.language)
        ..setAttribute(
          'data-retry',
          options.retryAutomatically ? 'auto' : 'never',
        )
        ..setAttribute(
          'data-retry-interval',
          options.retryInterval.inMilliseconds.toString(),
        )
        ..setAttribute('data-refresh-expired', options.refreshExpired.name)
        ..setAttribute('data-refresh-timeout', options.refreshTimeout.name)
        ..setAttribute('data-feedback-enabled', 'false');

      if (action != null && action.isNotEmpty) {
        widget.setAttribute('data-action', action);
      }

      if (cData != null && cData.isNotEmpty) {
        widget.setAttribute('data-cdata', cData);
      }
    }

    return widget;
  }
}

int _nextViewId = 0;

String _createViewType() => '_captcha_${_nextViewId++}';

String? _renderWidget(CaptchaProvider provider, String target) {
  final jsGlobal = switch (provider) {
    CaptchaProvider.turnstile => 'turnstile',
    CaptchaProvider.hcaptcha => 'hcaptcha',
  };
  final captchaObj = globalContext.getProperty<JSObject>(jsGlobal.toJS);
  final renderFn = captchaObj.getProperty<JSFunction>('render'.toJS);
  final result = renderFn.callAsFunction(captchaObj, target.toJS);
  return (result as JSString?)?.toDart;
}

/// FluxerCaptcha for web platforms.
class FluxerCaptcha extends StatefulWidget implements i.FluxerCaptcha {
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
  }) : options = options ?? CaptchaOptions() {
    CaptchaValidation.assertTurnstileParams(
      provider: provider,
      options: this.options!,
      action: action,
      cData: cData,
    );
  }

  /// Creates an invisible (headless) captcha widget.
  factory FluxerCaptcha.invisible({
    required CaptchaProvider provider,
    required String siteKey,
    String? action,
    String? cData,
    String baseUrl = 'http://localhost',
    i.OnTokenReceived? onTokenReceived,
    i.OnTokenExpired? onTokenExpired,
    i.OnTimeout? onTimeout,
    CaptchaOptions? options,
  }) {
    return _CaptchaInvisible.init(
      provider: provider,
      siteKey: siteKey,
      action: action,
      cData: cData,
      baseUrl: baseUrl,
      onTokenReceived: onTokenReceived,
      onTokenExpired: onTokenExpired,
      onTimeout: onTimeout,
      options: options ?? CaptchaOptions(),
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
  State<FluxerCaptcha> createState() => _FluxerCaptchaState();

  @override
  String? get token => throw UnimplementedError(
    'This function cannot be called in interactive widget mode.',
  );

  @override
  String? get id => throw UnimplementedError(
    'This function cannot be called in interactive widget mode.',
  );

  @override
  Future<void> refresh({bool forceRefresh = true}) {
    throw UnimplementedError(
      'This function cannot be called in interactive widget mode.',
    );
  }

  @override
  Future<String?> getToken() {
    throw UnimplementedError(
      'This function cannot be called in interactive widget mode.',
    );
  }

  @override
  Future<bool> isExpired() {
    throw UnimplementedError(
      'This function cannot be called in interactive widget mode.',
    );
  }

  @override
  Future<void> dispose() {
    throw UnimplementedError(
      'This function cannot be called in interactive widget mode.',
    );
  }
}

class _FluxerCaptchaState extends State<FluxerCaptcha> {
  static const double _maxHeightScreenRatio = 0.7;

  late web.HTMLDivElement _widget;
  late String _widgetViewId;
  late _DartCaptcha _captcha;

  String? widgetId;

  bool _isWidgetReady = false;
  CaptchaException? _hasError;
  Timer? _scriptLoadTimer;
  Timer? _heightPollTimer;
  bool _isDisposed = false;
  bool _viewCreated = false;
  double? _contentHeight;

  double get _minContentHeight => widget.options!.size.height;

  double _maxContentHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height * _maxHeightScreenRatio;
  }

  double _resolvedContentHeight(BuildContext context) {
    return _contentHeight ?? _minContentHeight;
  }

  void _updateContentHeight(double height) {
    if (_isDisposed || !mounted) return;
    final clamped = clampCaptchaContentHeight(
      height: height,
      minHeight: _minContentHeight,
      maxHeight: _maxContentHeight(context),
    );
    if (_contentHeight == null || (_contentHeight! - clamped).abs() > 1) {
      setState(() => _contentHeight = clamped);
    }
  }

  double _measureWidgetHeight() {
    return _widget.scrollHeight.toDouble();
  }

  void _scheduleContentHeightPolling() {
    _heightPollTimer?.cancel();
    void measure() {
      if (_isDisposed || !mounted) return;
      final height = _measureWidgetHeight();
      if (height > 0) {
        _updateContentHeight(height);
      }
    }

    for (final delayMs in [0, 300, 800, 1500, 2500, 4000]) {
      Future<void>.delayed(Duration(milliseconds: delayMs), measure);
    }
    _heightPollTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => measure(),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      (widget.controller! as web_ctrl.CaptchaController).provider =
          widget.provider;
    }

    _widgetViewId = _createViewType();
    _captcha = _DartCaptcha(
      provider: widget.provider,
      instanceId: _widgetViewId,
      onTokenReceived: (token) {
        if (_isDisposed) return;
        widget.onTokenReceived?.call(token);
        widget.controller?.token = token;
      },
      onTokenExpired: () {
        if (_isDisposed) return;
        widget.onTokenExpired?.call();
      },
      onRawError: (code) {
        if (_isDisposed) return;
        final exception = switch (widget.provider) {
          CaptchaProvider.turnstile => CaptchaException.fromTurnstileCode(
            int.tryParse(code) ?? -1,
          ),
          CaptchaProvider.hcaptcha => CaptchaException.fromHCaptchaCode(code),
        };
        _addError(exception);
      },
      onLoaded: _onCaptchaLoaded,
    );

    globalContext
      ..setProperty(
        'onCaptchaTokenReceived_$_widgetViewId'.toJS,
        _captcha.onReceived.toJS,
      )
      ..setProperty(
        'onCaptchaTokenExpired_$_widgetViewId'.toJS,
        _captcha.onExpired.toJS,
      )
      ..setProperty('onCaptchaError_$_widgetViewId'.toJS, _captcha.onError.toJS)
      ..setProperty('onCaptchaReady'.toJS, _captcha.onReady.toJS);

    _widget = _captcha.buildWidget(
      siteKey: widget.siteKey,
      options: widget.options!,
      cData: widget.cData,
      action: widget.action,
    )..className = 'fluxer-captcha_$_widgetViewId';

    _registerView(_widgetViewId);
  }

  void _onCaptchaLoaded() {
    if (_isDisposed || !mounted) return;
    if (_viewCreated) {
      _renderCaptchaWidget();
    }
  }

  void _renderCaptchaWidget() {
    if (_isDisposed || !mounted) return;
    if (widgetId != null) return;

    widgetId = _renderWidget(widget.provider, '.fluxer-captcha_$_widgetViewId');
    widget.controller?.widgetId = widgetId;
    if (mounted) {
      setState(() => _isWidgetReady = true);
    }
    widget.controller?.isWidgetReady = _isWidgetReady;
    _scriptLoadTimer?.cancel();
    _scheduleContentHeightPolling();
  }

  void _registerView(String viewType) {
    ui.platformViewRegistry.registerViewFactory(viewType, (
      int viewId, {
      Object? params,
    }) {
      return _widget;
    });
  }

  void _addError(CaptchaException error) {
    if (_isDisposed || !mounted) return;
    setState(() {
      _hasError = error;
      _isWidgetReady = error.retryable;
      widget.controller?.error = error;
      widget.controller?.isWidgetReady = error.retryable;
      widget.onError?.call(error);
    });
  }

  late final Widget _view = HtmlElementView(
    key: widget.key,
    viewType: _widgetViewId,
    onPlatformViewCreated: (id) {
      _viewCreated = true;
      _scriptLoadTimer?.cancel();
      _scriptLoadTimer = Timer(const Duration(milliseconds: 8000), () {
        if (_isDisposed || !mounted) return;
        if (!_isWidgetReady) {
          widget.onTimeout?.call();
        }
      });

      if (_captcha.isScriptLoaded()) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _renderCaptchaWidget();
        });
      } else {
        _captcha.loadScript();
      }
    },
  );

  @override
  void dispose() {
    _isDisposed = true;
    _scriptLoadTimer?.cancel();
    _scriptLoadTimer = null;
    _heightPollTimer?.cancel();
    _heightPollTimer = null;
    _widget.remove();
    globalContext
      ..delete('onCaptchaTokenReceived_$_widgetViewId'.toJS)
      ..delete('onCaptchaTokenExpired_$_widgetViewId'.toJS)
      ..delete('onCaptchaError_$_widgetViewId'.toJS);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styling = CaptchaStyling.resolve(
      widget.options!,
      MediaQuery.of(context).platformBrightness,
    );
    final adaptiveBorderColor = _isWidgetReady
        ? styling.secondaryColor
        : Colors.transparent;

    final isErrorResolvable = _hasError != null && _hasError!.retryable;

    final captchaWidget = Visibility(
      visible: _hasError == null || isErrorResolvable,
      child: AnimatedContainer(
        duration: widget.options!.animationDuration!,
        width: _isWidgetReady ? widget.options!.size.width : 0.1,
        height: _isWidgetReady ? _resolvedContentHeight(context) : 0.1,
        curve: widget.options!.curves!,
        foregroundDecoration: BoxDecoration(
          border: Border.all(color: adaptiveBorderColor),
          borderRadius: widget.options!.borderRadius,
        ),
        decoration: BoxDecoration(
          color: styling.primaryColor,
          borderRadius: widget.options!.borderRadius!.add(
            const BorderRadius.all(Radius.circular(1)),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: _view,
      ),
    );

    return captchaWidget;
  }
}

// Mutable fields are required for headless widget state management.
class _CaptchaInvisible extends FluxerCaptcha {
  _CaptchaInvisible.init({
    required super.provider,
    required super.siteKey,
    super.action,
    super.cData,
    super.baseUrl = 'http://localhost',
    super.onTokenReceived,
    super.onTokenExpired,
    super.onTimeout,
    super.options,
  }) : super(controller: CaptchaController()) {
    _register();
  }

  void _register() {
    if (controller != null) {
      (controller! as web_ctrl.CaptchaController).provider = provider;
    }

    _iframeViewType = _createViewType();
    final captcha = _DartCaptcha(
      provider: provider,
      instanceId: _iframeViewType,
      onTokenReceived: (token) {
        controller?.token = token;
        onTokenReceived?.call(token);
        if (_completer != null && !_completer!.isCompleted) {
          _completer?.complete(token);
        }
      },
      onTokenExpired: () {
        onTokenExpired?.call();
        if (_completer != null && !_completer!.isCompleted) {
          _completer?.complete(null);
        }
      },
      onRawError: (code) {
        final error = switch (provider) {
          CaptchaProvider.turnstile => CaptchaException.fromTurnstileCode(
            int.tryParse(code) ?? -1,
          ),
          CaptchaProvider.hcaptcha => CaptchaException.fromHCaptchaCode(code),
        };
        controller?.error = error;
        if (!_completer!.isCompleted) {
          _completer?.completeError(error);
        }
      },
      onLoaded: () {
        controller?.widgetId = _renderWidget(
          provider,
          '.fluxer-captcha_$_iframeViewType',
        );
        controller?.isWidgetReady = true;
        _scriptLoadTimer?.cancel();
      },
    );

    globalContext
      ..setProperty(
        'onCaptchaTokenReceived_$_iframeViewType'.toJS,
        captcha.onReceived.toJS,
      )
      ..setProperty(
        'onCaptchaTokenExpired_$_iframeViewType'.toJS,
        captcha.onExpired.toJS,
      )
      ..setProperty(
        'onCaptchaError_$_iframeViewType'.toJS,
        captcha.onError.toJS,
      )
      ..setProperty('onCaptchaReady'.toJS, captcha.onReady.toJS);

    _widget = captcha.buildWidget(
      siteKey: siteKey,
      options: options!,
      cData: cData,
      action: action,
    )..className = 'fluxer-captcha_$_iframeViewType';

    web.document.body?.append(_widget);
    _scriptLoadTimer?.cancel();
    _scriptLoadTimer = Timer(const Duration(milliseconds: 8000), () {
      if (controller?.isWidgetReady != true) {
        onTimeout?.call();
      }
    });
    captcha.loadScript();

    if (captcha.isScriptLoaded()) {
      controller?.widgetId = _renderWidget(
        provider,
        '.fluxer-captcha_$_iframeViewType',
      );
      controller?.isWidgetReady = true;
    }
  }

  late web.HTMLDivElement _widget;
  late String _iframeViewType;
  Completer<String?>? _completer;
  Timer? _scriptLoadTimer;

  @override
  Future<String?> getToken() async {
    if (_completer != null && !_completer!.isCompleted) {
      return _completer!.future;
    }
    _completer = Completer<String?>();

    if (token != null) {
      await controller?.refreshToken();
    }

    return _completer!.future;
  }

  @override
  String? get id => controller?.widgetId;

  @override
  Future<bool> isExpired() {
    return controller!.isExpired();
  }

  @override
  Future<void> refresh({bool forceRefresh = true}) async {
    if (_completer != null && !_completer!.isCompleted) {
      await _completer!.future;
      return;
    }
    if (!controller!.isWidgetReady || forceRefresh) {
      await getToken();
    } else if (controller!.isWidgetReady) {
      _completer = Completer<String?>();

      if (token != null) {
        if (!await controller!.isExpired()) {
          if (!_completer!.isCompleted) {
            _completer!.complete(token);
            return;
          }
        }
      }

      await controller!.refreshToken();
    }
  }

  @override
  String? get token => controller?.token;

  @override
  Future<void> dispose() async {
    _scriptLoadTimer?.cancel();
    _widget.remove();
    globalContext
      ..delete('onCaptchaTokenReceived_$_iframeViewType'.toJS)
      ..delete('onCaptchaTokenExpired_$_iframeViewType'.toJS)
      ..delete('onCaptchaError_$_iframeViewType'.toJS);
  }
}
