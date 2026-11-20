import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/attachment_request_auth.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/instance/well_known_compat.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/well_known_fixture.dart';

const String _kToken = 'test-session-token';
const String _kAttachment =
    'https://api.example.test/api/channels/11/attachments/22/cat.png?mid=33';

WellKnownFluxerResponse _discovery({bool? proxied}) => wellKnownFixture(
  media: 'https://media.example.test',
  staticCdn: 'https://static.example.test',
  api: 'https://api.example.test/api',
  proxyAttachmentsThroughApi: proxied,
);

WellKnownFluxerResponse _savedAndRestored(WellKnownFluxerResponse response) =>
    InstanceConfigSnapshot.parseWellKnown(
      jsonDecode(jsonEncode(wellKnownFluxerToJson(response)))
          as Map<String, dynamic>,
    );

void main() {
  setUp(() {
    InstanceEndpoints.proxyAttachmentsThroughApi = true;
  });

  tearDown(() {
    InstanceEndpoints.resetToDefaults();
    AttachmentRequestAuth.update(token: null, baseUrl: null, mintToken: null);
  });

  test('sends the session only to attachment links on the own api', () {
    AttachmentRequestAuth.update(
      token: _kToken,
      baseUrl: 'https://api.example.test/api/v1',
      mintToken: null,
    );
    expect(AttachmentRequestAuth.headersFor(_kAttachment), <String, String>{
      'Authorization': _kToken,
      fluxerApiFeaturesHeaderName: buildFluxerApiFeaturesHeaderValue(),
    });
    for (final String url in <String>[
      'https://media.example.test/attachments/11/22/cat.png',
      'https://api.example.test.other.test/api/channels/11/attachments/22/a',
      'https://api.example.test:8443/api/channels/11/attachments/22/cat.png',
      'http://api.example.test/api/channels/11/attachments/22/cat.png',
      'https://api.example.test/channels/11/attachments/22/cat.png',
      'https://api.example.test/api/channels/11/messages/22',
      'https://api.example.test/api/users/@me',
      'https://api.example.test/api/channels/11/attachments/22/..%2F..%2Fusers%2F%40me',
      'https://api.example.test/api/channels/11/attachments/22/..%5c..%5Cusers',
    ]) {
      expect(AttachmentRequestAuth.headersFor(url), isNull, reason: url);
    }
  });

  test('an off flag that has not caught up still sends the session to own '
      'api attachment links and nowhere else', () async {
    InstanceEndpoints.proxyAttachmentsThroughApi = false;
    int minted = 0;
    AttachmentRequestAuth.update(
      token: _kToken,
      baseUrl: 'https://api.example.test/api',
      mintToken: ({required String url}) async {
        minted += 1;
        return AttachmentMediaToken(
          token: 'file-token',
          expiresAt: DateTime.now().add(const Duration(minutes: 5)),
        );
      },
    );
    expect(AttachmentRequestAuth.isApiAttachmentUrl(_kAttachment), isTrue);
    expect(
      AttachmentRequestAuth.headersFor(_kAttachment)?['Authorization'],
      _kToken,
    );
    expect(
      Uri.parse(
        await AttachmentRequestAuth.fileTokenUrl(_kAttachment),
      ).queryParameters['mt'],
      'file-token',
    );
    const String mediaProxy =
        'https://media.example.test/attachments/11/22/cat.png';
    expect(AttachmentRequestAuth.headersFor(mediaProxy), isNull);
    expect(await AttachmentRequestAuth.fileTokenUrl(mediaProxy), mediaProxy);
    expect(minted, 1);
  });

  test('sends nothing without a session', () {
    AttachmentRequestAuth.update(
      token: null,
      baseUrl: 'https://api.example.test/api',
      mintToken: null,
    );
    expect(AttachmentRequestAuth.headersFor(_kAttachment), isNull);
  });

  test('audio links get a token minted for that one file', () async {
    final List<String> requested = <String>[];
    AttachmentRequestAuth.update(
      token: _kToken,
      baseUrl: 'https://api.example.test/api',
      mintToken: ({required String url}) async {
        requested.add(url);
        return AttachmentMediaToken(
          token: 'file-token-${requested.length}',
          expiresAt: DateTime.now().add(const Duration(minutes: 5)),
        );
      },
    );
    final Uri playable = Uri.parse(
      await AttachmentRequestAuth.fileTokenUrl('$_kAttachment&width=64'),
    );
    expect(playable.queryParameters['mt'], 'file-token-1');
    expect(playable.queryParameters['mid'], '33');
    expect(playable.queryParameters['width'], '64');
    await AttachmentRequestAuth.fileTokenUrl(_kAttachment);
    expect(requested, <String>[_kAttachment]);
    const String other =
        'https://api.example.test/api/channels/11/attachments/44/dog.ogg?mid=55';
    final Uri otherPlayable = Uri.parse(
      await AttachmentRequestAuth.fileTokenUrl(other),
    );
    expect(otherPlayable.queryParameters['mt'], 'file-token-2');
    expect(requested, <String>[_kAttachment, other]);
    const String foreign = 'https://media.example.test/attachments/11/22/a.ogg';
    expect(await AttachmentRequestAuth.fileTokenUrl(foreign), foreign);
    expect(requested, hasLength(2));
  });

  test('a file token that is about to end is minted again', () async {
    int minted = 0;
    AttachmentRequestAuth.update(
      token: _kToken,
      baseUrl: 'https://api.example.test/api',
      mintToken: ({required String url}) async {
        minted += 1;
        return AttachmentMediaToken(
          token: 'file-token-$minted',
          expiresAt: DateTime.now().add(const Duration(seconds: 10)),
        );
      },
    );
    await AttachmentRequestAuth.fileTokenUrl(_kAttachment);
    final Uri second = Uri.parse(
      await AttachmentRequestAuth.fileTokenUrl(_kAttachment),
    );
    expect(minted, 2);
    expect(second.queryParameters['mt'], 'file-token-2');
  });

  test('file tokens are dropped when the session changes', () async {
    int minted = 0;
    Future<AttachmentMediaToken?> mint({required String url}) async {
      minted += 1;
      return AttachmentMediaToken(
        token: 'file-token-$minted',
        expiresAt: DateTime.now().add(const Duration(minutes: 5)),
      );
    }

    AttachmentRequestAuth.update(
      token: _kToken,
      baseUrl: 'https://api.example.test/api',
      mintToken: mint,
    );
    await AttachmentRequestAuth.fileTokenUrl(_kAttachment);
    AttachmentRequestAuth.update(
      token: 'other-session-token',
      baseUrl: 'https://api.example.test/api',
      mintToken: mint,
    );
    final Uri after = Uri.parse(
      await AttachmentRequestAuth.fileTokenUrl(_kAttachment),
    );
    expect(after.queryParameters['mt'], 'file-token-2');
  });

  test(
    'a token minted for a session that has ended is never handed out',
    () async {
      final Completer<AttachmentMediaToken?> slow =
          Completer<AttachmentMediaToken?>();
      AttachmentRequestAuth.update(
        token: _kToken,
        baseUrl: 'https://api.example.test/api',
        mintToken: ({required String url}) => slow.future,
      );
      final Future<String> first = AttachmentRequestAuth.fileTokenUrl(
        _kAttachment,
      );
      final Future<String> second = AttachmentRequestAuth.fileTokenUrl(
        _kAttachment,
      );
      AttachmentRequestAuth.update(
        token: 'other-session-token',
        baseUrl: 'https://api.example.test/api',
        mintToken: ({required String url}) async => null,
      );
      slow.complete(
        AttachmentMediaToken(
          token: 'old-session-file-token',
          expiresAt: DateTime.now().add(const Duration(minutes: 5)),
        ),
      );
      expect(await first, _kAttachment);
      expect(await second, _kAttachment);
      expect(
        await AttachmentRequestAuth.fileTokenUrl(_kAttachment),
        _kAttachment,
      );
    },
  );

  test('a link stays bare when no token can be minted', () async {
    AttachmentRequestAuth.update(
      token: _kToken,
      baseUrl: 'https://api.example.test/api',
      mintToken: ({required String url}) async => throw StateError('offline'),
    );
    expect(
      await AttachmentRequestAuth.fileTokenUrl('$_kAttachment&mt=old'),
      _kAttachment,
    );
  });

  test('the discovery flag is read and kept when the instance is saved', () {
    final WellKnownFluxerResponse on = _discovery(proxied: true);
    expect(proxiesAttachmentsThroughApi(on), isTrue);
    expect(proxiesAttachmentsThroughApi(_savedAndRestored(on)), isTrue);
    InstanceEndpoints.apply(on);
    expect(InstanceEndpoints.proxyAttachmentsThroughApi, isTrue);

    for (final bool? value in <bool?>[null, false]) {
      final WellKnownFluxerResponse off = _discovery(proxied: value);
      expect(proxiesAttachmentsThroughApi(off), isFalse);
      expect(proxiesAttachmentsThroughApi(_savedAndRestored(off)), isFalse);
      expect(jsonEncode(wellKnownFluxerToJson(off)), jsonEncode(off.toJson()));
      InstanceEndpoints.apply(off);
      expect(InstanceEndpoints.proxyAttachmentsThroughApi, isFalse);
    }
  });

  test('links opened outside the app get a token for that one file', () async {
    final List<String> requested = <String>[];
    AttachmentRequestAuth.update(
      token: _kToken,
      baseUrl: 'https://api.example.test/api',
      mintToken: ({required String url}) async {
        requested.add(url);
        return AttachmentMediaToken(
          token: 'file-token',
          expiresAt: DateTime.now().add(const Duration(minutes: 5)),
        );
      },
    );
    final Uri shared = Uri.parse(
      await AttachmentRequestAuth.fileTokenUrl('$_kAttachment&mt=old'),
    );
    expect(shared.queryParameters['mt'], 'file-token');
    expect(requested, <String>[_kAttachment]);
  });
}
