/// JavaScript embedded in captcha HTML to report content height changes.
const String captchaResizeHandlerScript = '''
(function() {
  function measure() {
    var body = document.body;
    var html = document.documentElement;
    var height = Math.max(
      body.scrollHeight, body.offsetHeight,
      html.scrollHeight, html.offsetHeight
    );
    document.querySelectorAll('iframe').forEach(function(frame) {
      var rect = frame.getBoundingClientRect();
      height = Math.max(height, rect.bottom);
    });
    return Math.ceil(height);
  }
  function notify() {
    var height = measure();
    if (height > 0 && window.flutter_inappwebview) {
      window.flutter_inappwebview.callHandler('CaptchaResize', height);
    }
  }
  if (typeof ResizeObserver !== 'undefined') {
    new ResizeObserver(notify).observe(document.body);
  }
  new MutationObserver(notify).observe(document.body, {
    childList: true,
    subtree: true,
    attributes: true,
    characterData: true,
  });
  setInterval(notify, 400);
  window.addEventListener('load', notify);
  notify();
})();
''';

/// JavaScript evaluated from Flutter to read the current document height.
const String captchaMeasureHeightJs = '''
(function() {
  var body = document.body;
  var html = document.documentElement;
  var height = Math.max(
    body.scrollHeight, body.offsetHeight,
    html.scrollHeight, html.offsetHeight
  );
  document.querySelectorAll('iframe').forEach(function(frame) {
    var rect = frame.getBoundingClientRect();
    height = Math.max(height, rect.bottom);
  });
  return height;
})()
''';

/// Base styles shared by captcha HTML documents.
const String captchaDocumentStyles = '''
html, body {
  margin: 0;
  padding: 0;
  overflow: visible;
  width: 100%;
  touch-action: none;
  user-select: none;
  -webkit-user-select: none;
}
''';

/// Clamps measured captcha content height between [minHeight] and [maxHeight].
double clampCaptchaContentHeight({
  required double height,
  required double minHeight,
  required double maxHeight,
}) {
  return height.clamp(minHeight, maxHeight);
}
