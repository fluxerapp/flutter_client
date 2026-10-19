import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/platform/bundled_root_certificates.dart';

class _FileAssetBundle extends CachingAssetBundle {
  _FileAssetBundle(this.files);

  final Map<String, String> files;

  @override
  Future<ByteData> load(String key) async {
    final Uint8List bytes = File(files[key]!).readAsBytesSync();
    return ByteData.sublistView(bytes);
  }
}

late Directory _tls;

Future<void> _openssl(String args) async {
  final ProcessResult result = await Process.run(
    'openssl',
    args.split(' '),
    workingDirectory: _tls.path,
  );
  if (result.exitCode != 0) {
    throw StateError('openssl $args failed: ${result.stderr}');
  }
}

Future<void> _createCertificates() async {
  _tls = Directory.systemTemp.createTempSync('fluxer_tls_');
  File('${_tls.path}/server.ext').writeAsStringSync(
    'subjectAltName=DNS:localhost\n'
    'basicConstraints=CA:FALSE\n'
    'extendedKeyUsage=serverAuth\n',
  );
  await _openssl(
    'req -x509 -newkey rsa:2048 -nodes -keyout ca.key -out ca.pem '
    '-days 30 -subj /CN=fluxer-test-root',
  );
  await _openssl(
    'req -newkey rsa:2048 -nodes -keyout server.key -out server.csr '
    '-subj /CN=localhost',
  );
  await _openssl(
    'x509 -req -in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial '
    '-out server.pem -days 30 -extfile server.ext',
  );
}

Future<SecureServerSocket> _serve() async {
  final SecurityContext serverContext = SecurityContext()
    ..useCertificateChain('${_tls.path}/server.pem')
    ..usePrivateKey('${_tls.path}/server.key');
  final SecureServerSocket server = await SecureServerSocket.bind(
    InternetAddress.loopbackIPv4,
    0,
    serverContext,
  );
  server.listen((SecureSocket socket) {
    socket.write('ok');
    unawaited(socket.close());
  }, onError: (Object _) {});
  addTearDown(server.close);
  return server;
}

Future<String> _connect(
  SecureServerSocket server,
  SecurityContext context,
) async {
  final SecureSocket socket = await SecureSocket.connect(
    'localhost',
    server.port,
    context: context,
  );
  final String body = await utf8.decodeStream(socket);
  await socket.close();
  return body;
}

void main() {
  setUpAll(_createCertificates);
  tearDownAll(() => _tls.deleteSync(recursive: true));

  test('android trusts servers that chain to a bundled root', () async {
    final SecureServerSocket server = await _serve();
    final SecurityContext context = SecurityContext();

    await expectLater(
      _connect(server, context),
      throwsA(isA<HandshakeException>()),
    );

    await trustBundledRootCertificates(
      isAndroid: true,
      bundle: _FileAssetBundle(<String, String>{
        bundledRootCertificatesAsset: '${_tls.path}/ca.pem',
      }),
      context: context,
    );

    expect(await _connect(server, context), 'ok');
  });

  test('other platforms keep their system trust as is', () async {
    final SecureServerSocket server = await _serve();
    final SecurityContext context = SecurityContext();

    await trustBundledRootCertificates(
      isAndroid: false,
      bundle: _FileAssetBundle(<String, String>{
        bundledRootCertificatesAsset: '${_tls.path}/ca.pem',
      }),
      context: context,
    );

    await expectLater(
      _connect(server, context),
      throwsA(isA<HandshakeException>()),
    );
  });

  test('the bundled roots parse and include ISRG Root X1', () {
    final String pem = File(bundledRootCertificatesAsset).readAsStringSync();

    SecurityContext().setTrustedCertificatesBytes(utf8.encode(pem));
    expect(
      pem,
      contains(
        'MIIFazCCA1OgAwIBAgIRAIIQz7DSQONZRGPgu2OCiwAwDQYJKoZIhvcNAQELBQAw',
      ),
    );
  });
}
