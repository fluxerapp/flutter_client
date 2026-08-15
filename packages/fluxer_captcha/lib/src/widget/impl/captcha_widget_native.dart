import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:ui';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluxer_captcha/src/captcha_exception.dart';
import 'package:fluxer_captcha/src/captcha_provider.dart';
import 'package:fluxer_captcha/src/captcha_validation.dart';
import 'package:fluxer_captcha/src/controller/captcha_controller.dart';
import 'package:fluxer_captcha/src/controller/impl/captcha_controller_native.dart'
    as native_ctrl;
import 'package:fluxer_captcha/src/widget/captcha_content_size.dart';
import 'package:fluxer_captcha/src/widget/captcha_options.dart';
import 'package:fluxer_captcha/src/widget/captcha_styling.dart';
import 'package:fluxer_captcha/src/widget/interface.dart' as i;
import 'package:material_ui/material_ui.dart';

const String _tokenReceivedJSHandler =
    'window.flutter_inappwebview.callHandler(`CaptchaToken`, token);';
const String _errorJSHandler =
    'window.flutter_inappwebview.callHandler(`CaptchaError`, code);';
const String _tokenExpiredJSHandler =
    'window.flutter_inappwebview.callHandler(`TokenExpired`);';
const String _widgetCreatedJSHandler =
    'window.flutter_inappwebview.callHandler(`CaptchaWidgetId`, widgetId);';

const String _turnstileSource =
    """
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <link rel="icon" href="data:,">
   <meta name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
   <script src="https://challenges.cloudflare.com/turnstile/v0/api.js?render=explicit"></script>


</head>

<body>
   <div id="cf-turnstile"></div>
   <script>
      turnstile.ready(function () {
           if (!document.getElementById('cf-turnstile').hasChildNodes()) {
               const widgetId = turnstile.render('#cf-turnstile', {
                  sitekey: '<CAPTCHA_SITE_KEY>',
                  action: '<CAPTCHA_ACTION>',
                  cData: '<CAPTCHA_CDATA>',
                  theme: '<CAPTCHA_THEME>',
                  size: '<CAPTCHA_SIZE>',
                  language: '<CAPTCHA_LANGUAGE>',
                  retry: '<CAPTCHA_RETRY>',
                  'retry-interval': parseInt('<CAPTCHA_RETRY_INTERVAL>'),
                  'refresh-expired': '<CAPTCHA_REFRESH_EXPIRED>',
                  'refresh-timeout': '<CAPTCHA_REFRESH_TIMEOUT>',
                  'feedback-enabled': false,
                  callback: function (token) {
                     <CAPTCHA_TOKEN_RECEIVED>
                  },
                  'error-callback': function (code) {
                     <CAPTCHA_ERROR>
                  },
                  'expired-callback': function () {
                     <CAPTCHA_TOKEN_EXPIRED>
                  }
               });

               <CAPTCHA_CREATED>
           }
        });

   </script>
   <style>
      $captchaDocumentStyles
   </style>
   <script>
      $captchaResizeHandlerScript
   </script>
</body>

</html>

""";

const String _hcaptchaSource =
    """
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <link rel="icon" href="data:,">
   <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
</head>
<body>
   <div id="h-captcha"></div>
   <script>
      function onHCaptchaLoaded() {
          if (!document.getElementById('h-captcha').hasChildNodes()) {
              const widgetId = hcaptcha.render('h-captcha', {
                 sitekey: '<CAPTCHA_SITE_KEY>',
                 theme: '<CAPTCHA_THEME>',
                 size: '<CAPTCHA_SIZE>',
                 callback: function (token) {
                    <CAPTCHA_TOKEN_RECEIVED>
                 },
                 'error-callback': function (code) {
                    <CAPTCHA_ERROR>
                 },
                 'expired-callback': function () {
                    <CAPTCHA_TOKEN_EXPIRED>
                 }
              });
              <CAPTCHA_CREATED>
              <CAPTCHA_EXECUTE>
          }
      }
   </script>
   <script src="https://js.hcaptcha.com/1/api.js?render=explicit&onload=onHCaptchaLoaded" async defer></script>
   <style>
      $captchaDocumentStyles
   </style>
   <script>
      $captchaResizeHandlerScript
   </script>
</body>
</html>

""";

String _escapeHtml(String input) {
  return input
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#39;');
}

/// Captcha view builder for Turnstile provider.
String _buildTurnstileHTML({
  required String siteKey,
  required CaptchaOptions options,
  required String onTokenReceived,
  required String onCaptchaError,
  required String onTokenExpired,
  required String onWidgetCreated,
  String? action,
  String? cData,
}) {
  final exp = RegExp(
    '<CAPTCHA_(SITE_KEY|ACTION|CDATA|THEME|SIZE|LANGUAGE'
    '|RETRY|RETRY_INTERVAL|REFRESH_EXPIRED|REFRESH_TIMEOUT'
    '|TOKEN_RECEIVED|ERROR|TOKEN_EXPIRED|CREATED)>',
  );

  return _turnstileSource.replaceAllMapped(exp, (match) {
    switch (match.group(1)) {
      case 'SITE_KEY':
        return _escapeHtml(siteKey);
      case 'ACTION':
        return _escapeHtml(action ?? '');
      case 'CDATA':
        return _escapeHtml(cData ?? '');
      case 'THEME':
        return _resolveTheme(options);
      case 'SIZE':
        return options.size.name;
      case 'LANGUAGE':
        return _escapeHtml(options.language);
      case 'RETRY':
        return options.retryAutomatically ? 'auto' : 'never';
      case 'RETRY_INTERVAL':
        return options.retryInterval.inMilliseconds.toString();
      case 'REFRESH_EXPIRED':
        return options.refreshExpired.name;
      case 'REFRESH_TIMEOUT':
        return options.refreshTimeout.name;
      case 'TOKEN_RECEIVED':
        return onTokenReceived;
      case 'ERROR':
        return onCaptchaError;
      case 'TOKEN_EXPIRED':
        return onTokenExpired;
      case 'CREATED':
        return onWidgetCreated;
      default:
        return match.group(0) ?? '';
    }
  });
}

/// Captcha view builder for hCaptcha provider.
String _buildHCaptchaHTML({
  required String siteKey,
  required CaptchaOptions options,
  required String onTokenReceived,
  required String onCaptchaError,
  required String onTokenExpired,
  required String onWidgetCreated,
  bool isInvisible = false,
}) {
  // hCaptcha invisible mode requires size='invisible'.
  // hCaptcha does not support 'flexible' size; map to 'normal'.
  final String sizeValue;
  if (isInvisible) {
    sizeValue = 'invisible';
  } else if (options.size == CaptchaSize.flexible) {
    sizeValue = 'normal';
  } else {
    sizeValue = options.size.name;
  }

  final exp = RegExp(
    '<CAPTCHA_(SITE_KEY|THEME|SIZE'
    '|TOKEN_RECEIVED|ERROR|TOKEN_EXPIRED|CREATED|EXECUTE)>',
  );

  return _hcaptchaSource.replaceAllMapped(exp, (match) {
    switch (match.group(1)) {
      case 'SITE_KEY':
        return _escapeHtml(siteKey);
      case 'THEME':
        return _resolveTheme(options);
      case 'SIZE':
        return sizeValue;
      case 'TOKEN_RECEIVED':
        return onTokenReceived;
      case 'ERROR':
        return onCaptchaError;
      case 'TOKEN_EXPIRED':
        return onTokenExpired;
      case 'CREATED':
        return onWidgetCreated;
      case 'EXECUTE':
        // hCaptcha invisible mode requires explicit execute() after render.
        return isInvisible
            ? 'hcaptcha.execute(widgetId, { async: false });'
            : '';
      default:
        return match.group(0) ?? '';
    }
  });
}

/// Resolves `auto` theme to `light` or `dark` using platform brightness.
///
/// hCaptcha does not support `auto` — it must always be resolved.
/// Turnstile supports `auto` natively, but we resolve it here too for
/// consistency (matching the original cloudflare_turnstile behavior).
String _resolveTheme(CaptchaOptions options) {
  if (options.theme != CaptchaTheme.auto) return options.theme.name;
  final brightness = PlatformDispatcher.instance.platformBrightness;
  return brightness == Brightness.dark ? 'dark' : 'light';
}

/// Build HTML for the given captcha [provider].
String buildHTML({
  required CaptchaProvider provider,
  required String siteKey,
  required CaptchaOptions options,
  required String onTokenReceived,
  required String onCaptchaError,
  required String onTokenExpired,
  required String onWidgetCreated,
  String? action,
  String? cData,
  bool isInvisible = false,
}) {
  return switch (provider) {
    CaptchaProvider.turnstile => _buildTurnstileHTML(
      siteKey: siteKey,
      options: options,
      onTokenReceived: onTokenReceived,
      onCaptchaError: onCaptchaError,
      onTokenExpired: onTokenExpired,
      onWidgetCreated: onWidgetCreated,
      action: action,
      cData: cData,
    ),
    CaptchaProvider.hcaptcha => _buildHCaptchaHTML(
      siteKey: siteKey,
      options: options,
      onTokenReceived: onTokenReceived,
      onCaptchaError: onCaptchaError,
      onTokenExpired: onTokenExpired,
      isInvisible: isInvisible,
      onWidgetCreated: onWidgetCreated,
    ),
  };
}

/// FluxerCaptcha for native (mobile/desktop) platforms.
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

  final GlobalKey webViewKey = GlobalKey();

  final InAppWebViewSettings _settings = InAppWebViewSettings(
    disableHorizontalScroll: true,
    verticalScrollBarEnabled: false,
    transparentBackground: true,
    disallowOverScroll: true,
    disableVerticalScroll: true,
    supportZoom: false,
    useWideViewPort: false,
    disableDefaultErrorPage: true,
    disableContextMenu: true,
    disableLongPressContextMenuOnLinks: true,
  );

  late String data;

  String? widgetId;

  bool _isWidgetReady = false;
  bool _isCaptchaLoaded = false;
  CaptchaException? _hasError;
  bool _isRendered = false;
  Timer? _scriptLoadTimer;
  Timer? _heightPollTimer;
  double? _contentHeight;

  double get _minContentHeight => widget.options!.size.height;

  double _maxContentHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height * _maxHeightScreenRatio;
  }

  double _resolvedContentHeight(BuildContext context) {
    return _contentHeight ?? _minContentHeight;
  }

  void _applyMeasuredHeight(double height) {
    if (!mounted) return;
    final clamped = clampCaptchaContentHeight(
      height: height,
      minHeight: _minContentHeight,
      maxHeight: _maxContentHeight(context),
    );
    if (_contentHeight == null || (_contentHeight! - clamped).abs() > 1) {
      setState(() => _contentHeight = clamped);
    }
  }

  void _scheduleContentHeightPolling(InAppWebViewController controller) {
    _heightPollTimer?.cancel();
    Future<void> measure() async {
      if (!mounted) return;
      final result = await controller.evaluateJavascript(
        source: captchaMeasureHeightJs,
      );
      if (!mounted) return;
      final parsed = switch (result) {
        final num value => value.toDouble(),
        final String value => double.tryParse(value),
        _ => null,
      };
      if (parsed != null && parsed > 0) {
        _applyMeasuredHeight(parsed);
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

    if (!(Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isLinux ||
        Platform.isWindows ||
        Platform.isMacOS)) {
      throw UnsupportedError('FluxerCaptcha does not support this platform.');
    }

    PlatformInAppWebViewController.debugLoggingSettings.enabled = false;

    if (widget.controller != null) {
      (widget.controller! as native_ctrl.CaptchaController).provider =
          widget.provider;
    }

    data = buildHTML(
      provider: widget.provider,
      siteKey: widget.siteKey,
      action: widget.action,
      cData: widget.cData,
      options: widget.options!,
      onTokenReceived: _tokenReceivedJSHandler,
      onCaptchaError: _errorJSHandler,
      onTokenExpired: _tokenExpiredJSHandler,
      onWidgetCreated: _widgetCreatedJSHandler,
    );
  }

  void _createChannels(InAppWebViewController controller) {
    controller
      ..addJavaScriptHandler(
        handlerName: 'CaptchaToken',
        callback: (List<dynamic> args) {
          if (!mounted) return;
          final token = args[0] as String;
          widget.controller?.token = token;
          widget.onTokenReceived?.call(token);
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'CaptchaError',
        callback: (List<dynamic> args) {
          if (!mounted || _hasError != null) return;
          final code = args[0] as String;
          final error = switch (widget.provider) {
            CaptchaProvider.turnstile => CaptchaException.fromTurnstileCode(
              int.tryParse(code) ?? -1,
            ),
            CaptchaProvider.hcaptcha => CaptchaException.fromHCaptchaCode(code),
          };
          _addError(error);
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'CaptchaWidgetId',
        callback: (List<dynamic> args) {
          if (!mounted) return;
          widgetId = args[0] as String;
          widget.controller?.widgetId = widgetId;
          _isRendered = true;
          _scriptLoadTimer?.cancel();
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'TokenExpired',
        callback: (List<dynamic> message) {
          if (!mounted) return;
          widget.onTokenExpired?.call();
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'CaptchaResize',
        callback: (List<dynamic> args) {
          if (!mounted || args.isEmpty) return;
          final height = switch (args.first) {
            final num value => value.toDouble(),
            final String value => double.tryParse(value),
            _ => null,
          };
          if (height != null && height > 0) {
            _applyMeasuredHeight(height);
          }
        },
      );
  }

  void _resetWidget() {
    _hasError = null;
    _isWidgetReady = false;
    _contentHeight = null;
    widget.controller?.error = null;
    widget.controller?.isWidgetReady = false;
    if (!mounted) return;
    setState(() {});
  }

  void _addError(CaptchaException error) {
    _hasError = error;
    widget.controller?.error = error;
    widget.onError?.call(_hasError!);
    if (!mounted) return;
    setState(() {});
  }

  void _ready(bool ready) {
    _isWidgetReady = ready;
    widget.controller?.isWidgetReady = ready;
    if (!mounted) return;
    setState(() {});
  }

  late final _view = InAppWebView(
    key: webViewKey,
    initialData: InAppWebViewInitialData(
      data: data,
      baseUrl: WebUri(widget.baseUrl),
    ),
    initialSettings: _settings,
    onWebViewCreated: (controller) {
      _createChannels(controller);
      widget.controller?.setConnector(controller);
    },
    onLoadStart: (controller, _) {
      _isCaptchaLoaded = false;
      _resetWidget();
    },
    onLoadResource: (controller, resource) async {
      if (_isCaptchaLoaded && _hasError != null) {
        await controller.reload();
      }
    },
    shouldOverrideUrlLoading: (controller, navigationAction) async {
      var reqHost = navigationAction.request.url?.host;

      if (reqHost == null || reqHost.isEmpty) {
        reqHost = 'about:srcdoc';
      }

      final host = WebUri(widget.baseUrl).host;

      final allowedHosts = RegExp(
        'localhost|'
        '${RegExp.escape(host)}|'
        r'challenges\.cloudflare\.com|'
        r'(newassets|imgs)\.hcaptcha\.com|'
        r'hcaptcha\.com|'
        'about:blank|'
        'about:srcdoc',
      );

      if (allowedHosts.hasMatch(reqHost)) {
        return NavigationActionPolicy.ALLOW;
      }

      return NavigationActionPolicy.CANCEL;
    },
    onLoadStop: (controller, uri) async {
      if (!_isWidgetReady && mounted) {
        final contentWidth = await controller.getContentWidth();
        if (contentWidth != null && contentWidth <= 0) {
          dev.log(
            'Widget mode mismatch: The current widget is Invisible, which may'
            ' not match the mode set in the captcha provider dashboard. '
            'Please verify the widget mode in the dashboard settings.',
            name: 'fluxer_captcha',
            level: 800,
          );
        }
      }

      _isCaptchaLoaded = true;
      _ready(true);
      _scheduleContentHeightPolling(controller);
      _scriptLoadTimer?.cancel();
      _scriptLoadTimer = Timer(const Duration(milliseconds: 8000), () {
        if (!mounted) return;
        if (!_isRendered) {
          widget.onTimeout?.call();
        }
      });
    },
    onConsoleMessage: (controller, consoleMessage) {},
    onReceivedError: (controller, _, error) {
      if (error.type == WebResourceErrorType.CANNOT_CONNECT_TO_HOST) {
        return;
      }
      _ready(false);
      _addError(CaptchaException(error.description));
    },
    onPermissionRequest: (_, _) async => PermissionResponse(),
  );

  @override
  void dispose() {
    _scriptLoadTimer?.cancel();
    _heightPollTimer?.cancel();
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
      maintainState: true,
      child: AnimatedOpacity(
        duration: widget.options!.animationDuration!,
        curve: widget.options!.curves!,
        opacity: _isWidgetReady ? 1.0 : 0.0,
        child: AnimatedContainer(
          duration: widget.options!.animationDuration!,
          curve: widget.options!.curves!,
          width: widget.options!.size.width,
          height: _resolvedContentHeight(context),
          decoration: BoxDecoration(
            color: styling.primaryColor,
            borderRadius: widget.options!.borderRadius,
          ),
          foregroundDecoration: BoxDecoration(
            border: Border.all(color: adaptiveBorderColor),
            borderRadius: widget.options!.borderRadius,
          ),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: widget.options!.borderRadius!.add(
              const BorderRadius.all(Radius.circular(1)),
            ),
            child: _view,
          ),
        ),
      ),
    );

    return Wrap(children: [captchaWidget]);
  }
}

// Mutable fields are required for headless WebView state management.
class _CaptchaInvisible extends FluxerCaptcha {
  _CaptchaInvisible.init({
    required CaptchaProvider provider,
    required String siteKey,
    required String baseUrl,
    String? action,
    String? cData,
    CaptchaOptions? options,
    super.onTokenReceived,
    super.onTokenExpired,
    super.onTimeout,
  }) : super(
         provider: provider,
         siteKey: siteKey,
         controller: CaptchaController(),
       ) {
    if (!(Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isLinux ||
        Platform.isWindows ||
        Platform.isMacOS)) {
      throw UnsupportedError('FluxerCaptcha does not support this platform.');
    }

    PlatformInAppWebViewController.debugLoggingSettings.enabled = false;

    if (controller != null) {
      (controller! as native_ctrl.CaptchaController).provider = provider;
    }

    final data = buildHTML(
      provider: provider,
      siteKey: siteKey,
      action: action,
      cData: cData,
      options: options!,
      isInvisible: true,
      onTokenReceived: _tokenReceivedJSHandler,
      onCaptchaError: _errorJSHandler,
      onTokenExpired: _tokenExpiredJSHandler,
      onWidgetCreated: _widgetCreatedJSHandler,
    );

    _view = HeadlessInAppWebView(
      initialData: InAppWebViewInitialData(
        data: data,
        baseUrl: WebUri(baseUrl),
      ),
      onWebViewCreated: (wController) {
        controller?.setConnector(wController);
        _createChannels(wController);
      },
      onLoadStart: (_, _) {
        controller?.isWidgetReady = false;
        controller?.error = null;
      },
      onLoadStop: (_, _) {
        controller?.isWidgetReady = true;
      },
      onConsoleMessage: (_, _) {},
      onReceivedError: (_, _, error) {
        if (error.type == WebResourceErrorType.CANNOT_CONNECT_TO_HOST) {
          return;
        }
        controller?.error = CaptchaException(error.description);
        if (_completer != null && !_completer!.isCompleted) {
          _completer?.completeError(error);
        }
      },
      onPermissionRequest: (_, _) async => PermissionResponse(),
    );
  }

  late HeadlessInAppWebView _view;
  Completer<String?>? _completer;
  bool _isRendered = false;
  Timer? _scriptLoadTimer;
  Timer? _tokenTimer;

  static const Duration _renderTimeout = Duration(seconds: 4);
  Duration get _tokenTimeout => provider == CaptchaProvider.hcaptcha
      ? const Duration(seconds: 2)
      : const Duration(seconds: 4);

  void _createChannels(InAppWebViewController wController) {
    wController
      ..addJavaScriptHandler(
        handlerName: 'CaptchaToken',
        callback: (List<dynamic> args) {
          final token = args[0] as String;
          _tokenTimer?.cancel();
          controller?.token = token;
          onTokenReceived?.call(token);
          if (_completer != null && !_completer!.isCompleted) {
            _completer?.complete(token);
          }
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'CaptchaError',
        callback: (List<dynamic> args) {
          final code = args[0] as String;
          final error = switch (provider) {
            CaptchaProvider.turnstile => CaptchaException.fromTurnstileCode(
              int.tryParse(code) ?? -1,
            ),
            CaptchaProvider.hcaptcha => CaptchaException.fromHCaptchaCode(code),
          };

          _tokenTimer?.cancel();
          if (_completer != null && !_completer!.isCompleted) {
            _completer?.completeError(error);
          }
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'CaptchaWidgetId',
        callback: (List<dynamic> args) {
          controller!.widgetId = args[0] as String;
          _isRendered = true;
          _scriptLoadTimer?.cancel();
          _startTokenTimer();
        },
      )
      ..addJavaScriptHandler(
        handlerName: 'TokenExpired',
        callback: (List<dynamic> message) {
          _tokenTimer?.cancel();
          onTokenExpired?.call();
          if (_completer != null && !_completer!.isCompleted) {
            _completer?.complete(null);
          }
        },
      );
  }

  void _startTokenTimer() {
    _tokenTimer?.cancel();
    _tokenTimer = Timer(_tokenTimeout, () {
      if (_completer != null && !_completer!.isCompleted) {
        onTimeout?.call();
        _completer!.complete(null);
      }
    });
  }

  void _completeWithNullOnTimeout() {
    onTimeout?.call();
    if (_completer != null && !_completer!.isCompleted) {
      _completer!.complete(null);
    }
  }

  @override
  Future<String?> getToken() async {
    if (_completer != null && !_completer!.isCompleted) {
      return _completer!.future;
    }
    _completer = Completer<String?>();

    if (!_view.isRunning()) {
      await _view.run();
    }

    if (token != null) {
      await controller!.refreshToken();
    }

    _scriptLoadTimer?.cancel();
    _tokenTimer?.cancel();
    _scriptLoadTimer = Timer(_renderTimeout, () {
      if (!_isRendered) {
        _completeWithNullOnTimeout();
      }
    });

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
    if (!_view.isRunning() || forceRefresh) {
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
    _tokenTimer?.cancel();
    await _view.dispose();
  }
}
